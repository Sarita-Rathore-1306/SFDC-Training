/*
            Purpose      :  Test Class for DynamicApexPractice.
            Created By   :  Sarita Rathore
            Created Date :  12/30/2024
            Revision_log :  v1_0- 12/30/2024 - Sarita Rathore - 100% 
            */


@isTest
    (SeeAllData = false)
    public class DynamicApexPractice_Test {
        
        
        @testSetup
        private static void setupData(){
            
            Contact con = new Contact(LastName = 'Rathore');
            Account acc = new Account(Name = 'Sarita');
            Date dateofToday = Date.today();
            Opportunity opp = new Opportunity(Name = 'Test-Opp' , CloseDate = dateofToday , ForecastCategoryName = 'Omitted',StageName = 'Prospecting');
            
            insert con;
            insert acc;
            insert opp;
            
        }
        
        @isTest
        private static void testForInsertPositiveCases(){
            Id idOfCon = [SELECT Id FROM Contact LIMIT 1].Id ;
            String str = (String)idOfCon;
            String str1 = (String)([SELECT Id FROM Account].Id);
            String str2 = (String)([SELECT Id FROM Opportunity].Id);
            Contact con = new Contact();
            con.LastName = 'Testing';
            con.RecordId__c = str ;
            
            Contact con1 = new Contact(LastName = 'Testing 1', RecordId__c = str1);
            Contact con2 = new Contact(LastName = 'Testing 2',RecordId__c = str2);
            Test.StartTest();
            insert con ;
            insert con1;
            insert con2;
            Test.StopTest();
            //Positive Cases
            List<Contact> conList = [SELECT Id,Object_Name__c,Picklist_Field__c FROM Contact WHERE LastName Like 'Testing%'];
            System.debug(conList);
            
            Assert.areEqual(conList[0].Object_Name__c , 'Contact');
            Assert.areEqual(conList[1].Object_Name__c , 'Account');
            Assert.areEqual(conList[2].Object_Name__c , 'Opportunity');
            
            Assert.isTrue(String.isNotBlank(conList[0].Picklist_Field__c));
            Assert.isTrue(String.isNotBlank(conList[1].Picklist_Field__c));
            Assert.isTrue(String.isNotBlank(conList[2].Picklist_Field__c));
            
        }
        
        @isTest
        private static void testForInsertNegativeCases(){
            
            String str = 'hdsugewy77294';
            String str1 = (String)([SELECT Id FROM Account].Id);
            String str2 = (String)([SELECT Id FROM Opportunity].Id);
            Contact con = new Contact();
            con.LastName = 'Testing';
            con.RecordId__c = str ;
            
            Contact con1 = new Contact(LastName = 'Testing 1');
            
            Test.StartTest();
            String error;
            try{
                insert con ;
            }
            catch(DmlException e){
                error = e.getMessage();
            }
            Assert.isTrue(error.contains('Please add the valid salesforce Id'));
            
            
            insert con1;
            Contact con2 = [SELECT Id,Object_Name__c,Picklist_Field__c FROM Contact WHERE LastName Like 'Testing 1' ];
            Assert.isTrue(String.isEmpty(con2.Object_Name__c));
            Assert.isTrue(String.isEmpty(con2.Picklist_Field__c));
            Test.StopTest();
            
            
            
        }
    }