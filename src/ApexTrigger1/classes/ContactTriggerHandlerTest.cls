@isTest
      (SeeAllData = false)
    public class ContactTriggerHandlerTest {
    
        @testSetup
         static void test1(){
            List<Account> listOfAccount = new List<Account>();
            listOfAccount.add(new Account(Name = 'Redmi', AccountNumber='1236789'));
            listOfAccount.add(new Account(Name = 'Fexle', AccountNumber='56488900', Domain__c = 'fexle.com'));
            listOfAccount.add(new Account(Name = 'TCS', AccountNumber='56488900', Domain__c = 'tcs.com'));
            insert listOfAccount ;
            List<Contact> lisOfContactsForUpdation = new List<Contact>();
            lisOfContactsForUpdation.add(new Contact(LastName='Sarita', Email ='sarita@fexle.com', AccountId = listOfAccount[1].Id ));
            lisOfContactsForUpdation.add(new Contact(LastName='Neha', Email ='', AccountId = listOfAccount[1].Id));
            lisOfContactsForUpdation.add(new Contact(LastName='Rani', Email ='', AccountId = listOfAccount[0].Id));
            lisOfContactsForUpdation.add(new Contact(LastName='Harsh', Email ='harsh@gmail.com'));
            lisOfContactsForUpdation.add(new Contact(LastName='Yash', Email ='yash@fexle.com', AccountId = listOfAccount[1].Id ));
            lisOfContactsForUpdation.add(new Contact(LastName='Dipesh'));
            lisOfContactsForUpdation.add(new Contact(LastName='Parth'));
            
            insert lisOfContactsForUpdation;
           
         }
        /*
             * Purpose      : This Method has been created to test the insert operation on contacts.
             * Arguments    : No args
             * Return       : void
             * Revision_Log : v1_0 - created by -Sarita Rathore
        */
        @isTest
         static void checkForInsert(){
            List<Account> accList = [SELECT Id,Name,Domain__c FROM Account];
             System.debug(accList);
            List<Contact> listOfContact = new List<Contact>();
            listOfContact.add(new Contact(LastName='AKHIL'));
            listOfContact.add(new Contact(LastName='Akash', Email ='akash@gmail.com', AccountId = accList[0].Id ));
            listOfContact.add(new Contact(LastName='Kumar', Email ='kumar@fexle.com', AccountId = accList[1].Id ));
            listOfContact.add(new Contact(LastName='Anish', AccountId = accList[1].Id ));
            listOfContact.add(new Contact(LastName='Sunita', Email ='sarita@gmail.com', AccountId = accList[1].Id ));
            
             
            Test.StartTest();
             //Positive Cases
             String error;
             try{
                 
                 insert listOfContact[0];  
                 
                 }
             catch(DmlException e){
                 
                 error= e.getMessage(); 
                 
                 }  
              Assert.areEqual(listOfContact[0].Email,listOfContact[0].Email,'error');
            
             
              insert listOfContact[1]; 
              Assert.areEqual(listOfContact[1].Email,listOfContact[1].Email, 'Your email is not correct');
             
              insert listOfContact[2]; 
              Assert.isTrue(listOfContact[2].Email.contains(accList[1].Domain__c), 'Your email is not correct');
             
              insert listOfContact[3]; 
              Assert.areEqual(listOfContact[3].Email,listOfContact[3].Email, 'Your email is not correct');
                
              //Negative Case
              try{
                  
                 insert listOfContact[4];
                  
                 } 
              catch(DmlException e){
                 System.debug(e);
                 Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                  
                 }
            
            Test.StopTest();
                      
         }
         /*
             * Purpose      : This Method has been created to test the update operation on contacts.
             * Arguments    : No args
             * Return       : void
             * Revision_Log : v1_0 - created by -Sarita Rathore
             */
           @isTest
           static void checkForUpdate(){
               
            List<Account> accList = [SELECT Id,Name,Domain__c FROM Account ];
            System.debug(accList);
            List<Contact> conList = [SELECT LastName,Email,AccountId FROM Contact];
            System.debug(conList);
               
            Test.StartTest();
            //Negative Case
            try{
                
                  conList[0].Email = 'sarita@gmail.com';
                  update conList[0];
               
               }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
               }
            //Negative Case
            try{
                
                  conList[1].Email = 'neha@gmail.com';
                  update conList[1];
                
               }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
               }
             //Positive Case
            try{
                
                 conList[2].Email = 'rani@gmail.com';
                 update conList[2];
                
               }
            catch(DmlException e){
              
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
                }
            //Negative Case
            try{
                
                  conList[3].AccountId = accList[1].Id;
                  update conList[3];
               
            }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
            }
            //Negative Case
            try{
                
                  conList[4].AccountId = accList[2].Id;
                  update conList[4];
               
               }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
                }
             //Positve Case
            try{
                
                  conList[5].AccountId = accList[2].Id;
                  update conList[5];
               
               }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
                }
             //Negative Case
            try{
                
                  conList[6].Email = 'parth@gmail.com';
                  conList[6].AccountId = accList[2].Id;
                  update conList[6];
               
               }
            catch(DmlException e){
                
                Assert.isTrue(e.getMessage().contains('You cannot insert/Update this Contact with different domain'),'Your have not catched the exception');
                
                }
            Test.StopTest();
               
            }
        
    
        
        
            
        }