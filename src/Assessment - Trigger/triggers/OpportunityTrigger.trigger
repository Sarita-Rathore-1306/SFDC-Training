trigger OpportunityTrigger on Opportunity (after insert, after update) {
    
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            
            OpportunityTriggerHandler.createTaskOnAccount(Trigger.new , Null);
            
        }
        else if(Trigger.isUpdate){
            
            OpportunityTriggerHandler.createTaskOnAccount(Trigger.new , Trigger.oldMap);
            
        }
    }

}