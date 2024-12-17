/*
Purpose        : Trigger on Contact
Created Date   : 12/05/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0-created 
*/
trigger ContactTrigger on Contact (before insert, before update) {
    
      new ContactTriggerHandler().run();
   
}