/*
Purpose        : Trigger on Contact
Created Date   : 12/05/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0-created 
*/
    trigger ContactTrigger on Contact (before insert, before update) {
        //Before Events
        if(Trigger.isBefore){
            
            if(Trigger.isInsert){
                DynamicApexPractice.validateRecordandUpdateFields(Trigger.new);
                new ContactTriggerHandler().run();
                
            }
            
            if(Trigger.isUpdate){
                DynamicApexPractice.validateRecordandUpdateFields(Trigger.new);
                new ContactTriggerHandler().run();
                
            }
            
            if(Trigger.isDelete){
                
            }
        }
            
        //After Events
        if(Trigger.isAfter){
            if(Trigger.isInsert){
                
                
                
            }
            
            if(Trigger.isUpdate){
                
                
                
            }
            
            if(Trigger.isDelete){
                
            }
            
            if(Trigger.isUndelete){
                
            }
        }
    }