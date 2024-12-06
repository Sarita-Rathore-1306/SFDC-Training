/*
Purpose        : This class has been created to handle Insertion and Updation of Records before saving to the database using Trigger on Contact.
Created Date   : 12/05/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0
*/
public class ContactTriggerHandler {
    public static void checkEmailWithTheMatchingAccountDomain(List<Contact> newContacts){
        //This Map will store the information of All acoount with their ID as key and corresponding Account as value
        Map<Id, Account> existingAccounts = new Map<Id, Account>([SELECT Id, Domain__c FROM Account]);
        if(!newContacts.isEmpty()){
          for(Contact con : newContacts){
              if(existingAccounts.get(con.AccountId).Domain__c != Null){
                  if(con.email !=Null){
                     if(!(((con.email).toLowerCase()).contains((existingAccounts.get(con.AccountId).Domain__c).toLowerCase())))
                     con.addError('You cannot insert/Update this Contact with different domain');  
                     } else
                      con.addError('Please Populate email field of your contact');    
                 } else
                     con.addError('Please Populate Domain field in the related Account');
         }  
       }     
   }
}