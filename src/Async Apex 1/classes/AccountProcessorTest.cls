@isTest
 (SEEALLDATA = false)
public without sharing class AccountProcessorTest {
    @testSetup
    private static void testSetup(){
        List<Account> listOfAccount = new List<Account>();
        For(Integer i = 0 ;i < 10 ; i++){
            Account acc = new Account(Name = 'Test' + i);
            listOfAccount.add(acc);
        }
        insert listOfAccount;
        List<Contact> listOfContacts = new List<Contact>();
        for(Integer j = 0;j < listOfAccount.size() ; j++){
            if(j < 3){
                for(Integer p = 0 ; p < 10 ; p++ ) {
                    Contact con = new Contact(LastName = 'Test - Contact ' + ' ' + p + 'Account' + ' ' + j );
                    listOfContacts.add(con);
               }
            }
            if((2 < j) && (j < 8)){
                for(Integer p = 0 ; p < 10 ; p++ ) {
                    Contact con = new Contact(LastName = 'Test - Contact ' + ' ' + p + 'Account' + ' ' + j , AccountId = listOfAccount[j].Id );
                    listOfContacts.add(con);
               }
            }
            
            
            if(j > 8){
                for(Integer p = 0 ; p < 5 ; p++ ) {
                    Contact con = new Contact(LastName = 'Test - Contact ' + ' ' + p + 'Account' + ' ' + j , AccountId = listOfAccount[j].Id );
                    listOfContacts.add(con);
               }
            }
        }
        insert listOfContacts ;
    }
    
    
    
    @isTest 
    private static void testFuture(){
        
        List<Id> accountIds = new List<Id>();
        for(Account acc : [ SELECT Id, Number_Of_Contacts__c FROM Account]){
            accountIds.add(acc.Id);
        }
        
        Test.StartTest();
          AccountProcessor.countContacts(accountIds);
        Test.StopTest();
        
    
        
        List<Account> listOfAccounts1 = [SELECT Id , Number_Of_Contacts__c FROM Account WHERE Name IN ('Test3','Test4','Test5')];
        Assert.areEqual(10,listOfAccounts1[0].Number_Of_Contacts__c,'Error');
        Assert.areEqual(10,listOfAccounts1[1].Number_Of_Contacts__c,'Error');
        Assert.areEqual(10,listOfAccounts1[2].Number_Of_Contacts__c,'Error');
        
        
        List<Account> listOfAccounts2 = [SELECT Id , Number_Of_Contacts__c FROM Account WHERE Name ='Test9'];
        Assert.areEqual(5,listOfAccounts2[0].Number_Of_Contacts__c,'Error');
       
       
    }
        
}