trigger EventTrigger on Event (after insert, after update, after delete, after undelete) {
   if(Trigger.isAfter){
        if(Trigger.isInsert){
            EventTriggerHandler.updateAccountOnEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isUpdate){
            EventTriggerHandler.updateAccountOnEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            EventTriggerHandler.updateAccountOnEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isUndelete){
            EventTriggerHandler.updateAccountOnEvents(Trigger.new,Trigger.oldMap);
        }
    }
}