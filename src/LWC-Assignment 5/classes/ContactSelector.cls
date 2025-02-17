public without sharing class ContactSelector {
    @AuraEnabled(Cacheable=true)
    public static List<Contact>  getAllContacts(String recordId){     
        try
        {
         
           return [SELECT Name,Title,Phone,Email,AccountId FROM Contact WHERE AccountId = :recordId];
        
        }  
        catch (Exception e) 
        {

            throw new AuraHandledException(e.getMessage());

        }
    }
}