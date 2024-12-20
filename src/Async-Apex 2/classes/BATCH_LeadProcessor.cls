/*
 Purpose      : This Batch Class has been created to process the lead records and scheduled them.

 Created By   : Sarita Rathore

 Created Date : 20/12/2024

 Revision_log : V1_0  - Created by Sarita Rathore

*/
    global class BATCH_LeadProcessor implements Database.Batchable<sObject>,Schedulable {
        
        global Database.QueryLocator start(Database.BatchableContext bc)
        {
            return Database.getQueryLocator('SELECT Id,LeadSource FROM Lead');
        }
        
        global void execute(Database.BatchableContext bc, List<Lead> allLeads){
            for(Lead ld : AllLeads)
            {
                ld.LeadSource = 'Dreamforce';
            }
            update allLeads ;
        }
        
        global void finish(Database.BatchableContext bc)
        {
            System.debug('Finish Method Executed');
        }
        
        global void execute(SchedulableContext ctx)
        {
            Database.executeBatch(new BATCH_LeadProcessor(),200);
        }
        
    }