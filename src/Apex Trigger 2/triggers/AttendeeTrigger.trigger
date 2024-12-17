trigger AttendeeTrigger on Attendee__c (after insert, after update, after delete) {
    
      new AttendeeTriggerHandler2().run();
  
}