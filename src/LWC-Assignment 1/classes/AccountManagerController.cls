public  with sharing class AccountManagerController {
    @AuraEnabled(Cacheable = true) 
    public static List<sObject> getDataOfAccounts(){
        try{
            
            List<Account> listOfAccount = [SELECT Id,Name,Phone,Website FROM Account];
            return listOfAccount;
        }
        catch(Exception e){
            return null;
        }
        
    } 
  
}