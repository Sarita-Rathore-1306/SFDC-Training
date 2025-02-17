public without sharing class AccountSelector {
@AuraEnabled(Cacheable=true)
public static List<Account> getAccountDetails(String recordId){
      try
       {

        return [SELECT Id, Name,Owner.Name,Description,Number_Of_Contacts__c FROM Account WHERE ID = :recordId];
        
       } 
       catch (Exception e) 
       {

        throw new AuraHandledException(e.getMessage());

       }
       
    }
   
}