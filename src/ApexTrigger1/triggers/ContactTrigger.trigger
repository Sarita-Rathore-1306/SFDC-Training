/*
Purpose        : This Trigger has been created to manage Contact records.
Created Date   : 12/05/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0-created 
*/
trigger ContactTrigger on Contact (before insert, before update,before delete) {
        if((Trigger.isInsert || Trigger.isUpdate) && (Trigger.isBefore))
           ContactTriggerHandler.checkEmailWithTheMatchingAccountDomain(Trigger.new);
}