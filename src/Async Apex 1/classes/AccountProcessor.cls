/*
Purpose      :  This class has been created to update Number of Contacts on the  Accounts.
Created By   :  Sarita Rathore
Created Date :  12/16/2024
Revision_log :  v1_0 
*/

public without sharing class AccountProcessor {
    /*
Purpose      :  This is a future Method which has been created to count associated contacts on Accounts.
Return       :  void
Argument     :  List<Id>
Created By   :  Sarita Rathore
Revision_log :  v1_0
*/  
    
    @future
      public static void countContacts(List<Id> accountIds){
          
          AggregateResult[] listOfAllTheContactWithTheCount = [SELECT AccountId, COUNT(Id)countOfContact FROM Contact WHERE AccountId IN :accountIds GROUP BY AccountId];
          Map<Id,Integer> mapToStoreAccountIdWithTheCountOfAssociatedNumberOfContacts = new Map<Id , Integer>();
          for(aggregateResult res : listOfAllTheContactWithTheCount){
              Id idOfAccount = (Id)res.get('AccountId');
              Integer countOfContact =(Integer)res.get('countOfContact');
              mapToStoreAccountIdWithTheCountOfAssociatedNumberOfContacts.put(idOfAccount,countOfContact);
          }
          List<Account> listOfAccounts = [SELECT Id,Number_Of_Contacts__c FROM Account 
                             WHERE ID IN :mapToStoreAccountIdWithTheCountOfAssociatedNumberOfContacts.keySet()];
          for(Account acc : listOfAccounts){
                acc.Number_Of_Contacts__c = mapToStoreAccountIdWithTheCountOfAssociatedNumberOfContacts.get(acc.Id);
          }
          if(!listOfAccounts.isEmpty()){
              update listOfAccounts;
          }
       }
  }