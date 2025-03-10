public class OpportunityTriggerHandler {
    
    public static void createTaskOnAccount(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
        
        Set<Id> setOfAccountId = new Set<Id>();
        for(Opportunity opp : newList){
            //In Case of insert
            if(oldMap == Null){
                if(opp.AccountId != Null && opp.StageName == 'Closed Won')
                    setOfAccountId.add(opp.AccountId);
                
            }
            //In Case of Update
            else if(oldMap != Null){
                if(opp.StageName != oldMap.get(opp.Id).Stagename){
                    if(opp.AccountId != Null && opp.StageName == 'Closed Won')
                     setOfAccountId.add(opp.AccountId);
                }
            }
            
        }
        
        List<Task> taskToInsert = new List<Task>();
        
        List<Opportunity> listOfOppToProcess = [SELECT Id , Name , AccountId FROM Opportunity WHERE (AccountId IN : setOfAccountId AND Task_Exist__c = false AND StageName = 'Closed Won')];
        
        for(Opportunity opp : listOfOppToProcess){
            
            //if(checkTaskExist(opp.Name , opp.AccountId)){
                Task tk = new Task();
                tk.WhatId = opp.AccountId;
                tk.Subject = opp.Name ;
                tk.Status = 'Opened';
                taskToInsert.add(tk);
            //}
            opp.Task_Exist__c = true ;
        }
        
        if(!taskToInsert.isEmpty()){
            insert taskToInsert;
        }
        
        if(!listOfOppToProcess.isEmpty()){
            update listOfOppToProcess;
        }
        
    }
    
    public static Boolean checkTaskExist(String oppName, Id AccountId){
        List<Task> taskExist = [SELECT Id FROM Task WHERE WhatId = :AccountId AND Subject = :oppName];
        
        
        if(taskExist.isEmpty()){
            return true;
        }
        return false;
    }

    
    public static void countMethod(List<Opportunity> newList, Map<Id,Opportunity> oldMap){
       if(newList.isEmpty()){
            return ;
        }
        
        Set<Id> setOfAccountId = new Set<Id>();
        for(Opportunity opp : newList){
            //In Case of insert
            if(oldMap == Null){
                if(opp.AccountId != Null && opp.StageName == 'Closed Won')
                    setOfAccountId.add(opp.AccountId);
                
            }
            //In Case of Update
            else if(oldMap != Null){
                if(opp.StageName != oldMap.get(opp.Id).Stagename){
                    if(opp.AccountId != Null && opp.StageName == 'Closed Won')
                     setOfAccountId.add(opp.AccountId);
                }
            }}
            List<Task> taskToInsert = new List<Task>();
            List<AggregateResult> aggrResult = [SELECT Count(Id)countOfTask,AccountId FROM Opportunity WHERE (AccountId IN : setOfAccountId AND Task_Exist__c = false AND StageName = 'Closed Won') GROUP BY AccountId];
            for(AggregateResult aggr : aggrResult){
             //   taskToInsert.addAll(createTask((Id)aggr.get('AccountId') , (Integer)aggr.get('countOfTask'))) ;
            }
    }
   /* public static List<Task> createTask(Id AccountId , Integer count){
        List<Task> taskToBeInserted = new List<Task>();
        for(Integer i = 1 ; i <= count ; i++){
             Task tk = new Task();
                tk.WhatId = opp.AccountId;
                tk.Subject = opp.Name ;
                tk.Status = 'Opened';
                taskToBeInserted.add(tk);
        }
    }*/
    
}