/*
        Purpose        : This class has been created to handle Insertion and Updation of Records before saving to the database using Trigger on Contact.
        Created Date   : 12/05/2024
        Created By     : Sarita Rathore
        Revision_Log   : V1.0
        */
        public without sharing class ContactTriggerHandler extends TriggerHandler{
            
    
            public override void beforeUpdate(){
                List<Contact> listOfContacts = new List<Contact>();
                listOfContacts = Trigger.new;
                Map<Id , Contact> mapOfContacts = new Map<Id, Contact>([SELECT Id,AccountId,LastName,Email FROM Contact WHERE ID IN :Trigger.oldMap.keySet()]);
                ContactTriggerHandler.checkEmailWithTheMatchingAccountDomain(listOfContacts, mapOfContacts);
            }
            
            public override void beforeInsert(){
                List<Contact> listOfContacts = new List<Contact>();
                listOfContacts = Trigger.new;
                ContactTriggerHandler.checkEmailWithTheMatchingAccountDomain(listOfContacts, Null);
            }
            
         
            /*
             * Purpose      : This Method has been created to validate the email field on contact.
             * Arguments    : list<contacts>,Map<Id,Contact>
             * Return       : void
             * Revision_Log : v1_0 - created
             */
            public static void checkEmailWithTheMatchingAccountDomain(List<Contact> newContacts, Map<Id,Contact> mapOfOldContactsValue){
            
                Set<Id> setToStoreAccountIdOfNewContacts = new Set<Id>();
                List<Contact> listOfNewContactsToProcess = new List<Contact>();
                for(Contact con : newContacts){
                    if(con.AccountId != Null ){
                        setToStoreAccountIdOfNewContacts.add(con.AccountId);
                        listOfNewContactsToProcess.add(con);}
                }
                if(listOfNewContactsToProcess.isEmpty()){
                    return;
                }
               
                Map<Id, Account> existingAccounts = new Map<Id, Account>([SELECT Id, Domain__c FROM Account
                                                                          WHERE Id IN :setToStoreAccountIdOfNewContacts AND Domain__c != Null]);
                
                if(!existingAccounts.isEmpty() ){
                    for(Contact con : listOfNewContactsToProcess){
                        
                        
                        if(con.Email != Null && existingAccounts.containsKey(con.AccountId) && mapOfOldContactsValue == Null){
                            
                            
                            if(!(((con.email).toLowerCase()).endsWith('@' + (existingAccounts.get(con.AccountId).Domain__c).toLowerCase())))
                                con.addError('You cannot insert/Update this Contact with different domain'); 
                            
                        }
                        else if(mapOfOldContactsValue != Null && mapOfOldContactsValue.get(con.Id).AccountId != Null){
                            
                            if(((con.email != mapOfOldContactsValue.get(con.Id).Email)
                                ||con.AccountId != mapOfOldContactsValue.get(con.Id).AccountId ))
                            {
                                if(!(((con.email).toLowerCase()).endsWith('@' + (existingAccounts.get(con.AccountId).Domain__c).toLowerCase())))
                                    con.addError('You cannot insert/Update this Contact with different domain');    
                            }
                            } else if(mapOfOldContactsValue != Null && (mapOfOldContactsValue.get(con.Id).AccountId == Null ) && con.Email != Null){
                                 if(!(((con.email).toLowerCase()).endsWith('@' + (existingAccounts.get(con.AccountId).Domain__c).toLowerCase())))
                                    con.addError('You cannot insert/Update this Contact with different domain');  
                        }
                    }
                }
            }
        }