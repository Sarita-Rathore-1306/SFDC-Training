trigger TaskTrigger on Task (after insert, after update, after delete, after undelete) {
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            TaskTriggerHandler.updateAccountOnTaskEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isUpdate){
            TaskTriggerHandler.updateAccountOnTaskEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isDelete){
            TaskTriggerHandler.updateAccountOnTaskEvents(Trigger.new,Trigger.oldMap);
        }
        if(Trigger.isUndelete){
            TaskTriggerHandler.updateAccountOnTaskEvents(Trigger.new,Trigger.oldMap);
        }

}
}