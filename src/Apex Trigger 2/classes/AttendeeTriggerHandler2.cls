/*
            Purpose        : This class has been created to roll up the no of training sessions on contacts.
            Created Date   : 12/05/2024
            Created By     : Sarita Rathore
            Revision_Log   : V1.0
            */
    
    
    
    public without sharing class AttendeeTriggerHandler2 extends TriggerHandler {
        
        public override void afterInsert(){
            List<Attendee__c> listOfAttendees = new list<Attendee__c>();
            listOfAttendees = Trigger.new;
            Map<Id,Attendee__c> oldMapForAttendees = new Map<id,Attendee__c>([SELECT Id,Contact__c FROM Attendee__c ]);
            AttendeeTriggerHandler2.updateNumberFieldOnContact(listOfAttendees, oldMapForAttendees);
        }
        
        public override void afterUpdate(){
            List<Attendee__c> listOfAttendees = new list<Attendee__c>();
            listOfAttendees = Trigger.new;
            Map<Id,Attendee__c> oldMapForAttendees = new Map<id,Attendee__c>([SELECT Id,Contact__c FROM Attendee__c ]);
            AttendeeTriggerHandler2.updateNumberFieldOnContact(listOfAttendees, oldMapForAttendees);
        }
        
        public override void afterDelete(){
            List<Attendee__c> listOfAttendees = new list<Attendee__c>();
            listOfAttendees = Trigger.new;
            Map<Id,Attendee__c> oldMapForAttendees = new Map<id,Attendee__c>([SELECT Id,Contact__c FROM Attendee__c ]);
            AttendeeTriggerHandler2.updateNumberFieldOnContact(listOfAttendees, oldMapForAttendees);
        }
        
        /*
                 * Purpose      : This Method has been created to update the No of training sessions on contacts.
                 * Arguments    : list<Attendee__c>,Map<Id,Attendee__c>
                 * Return       : void
                 * Revision_Log : v1_0 - created
                 */
        
        public static void updateNumberFieldOnContact(List<Attendee__c> newList, Map<Id,Attendee__c> oldMapOfAttendees){
            Set<Id> setOfIdsComingFromTheUpdates = new Set<Id>();
            Set<Id> contactIdsOfIncomingData = new Set<ID>();
            if(newList != Null){
                for(Attendee__c att : newList ){
                  setOfIdsComingFromTheUpdates.add(att.Id);
                  contactIdsOfIncomingData.add(att.Contact__c);
                }    
            }
            if(oldMapOfAttendees != Null){
                for(Attendee__c att : oldMapOfAttendees.values()){
                  setOfIdsComingFromTheUpdates.add(att.Id);
                  contactIdsOfIncomingData.add(att.Contact__c);
                }
            }
            
            Map<Id,Contact> mapToStoreAllAttendeesContacts = new Map<Id,Contact>([SELECT Id,Number_Of_Training_Sessions__c FROM Contact WHERE ID IN :contactIdsOfIncomingData]);
            Map<Id,Integer> mapToStoreCountWithTheirContact = new Map<Id, Integer> ();
            List<AggregateResult> listToStoreNumberOfSessionsOnContacts = [SELECT Contact__c, COUNT_DISTINCT(Training_Session__c)countSession
                                                                           FROM Attendee__c 
                                                                           GROUP BY Contact__c];
            for(AggregateResult agg : listToStoreNumberOfSessionsOnContacts ){
                 mapToStoreCountWithTheirContact.put((Id)agg.get('Contact__c'), (Integer)agg.get('countSession'));
            }
            if(!mapToStoreAllAttendeesContacts.isEmpty()){
             for(Contact con : mapToStoreAllAttendeesContacts.values()){
                 con.Number_Of_Training_Sessions__c = mapToStoreCountWithTheirContact.get(con.Id);
            }
            }
            
                
            if(!mapToStoreAllAttendeesContacts.isEmpty())
                update mapToStoreAllAttendeesContacts.Values();
                       
            
    
        }
    }