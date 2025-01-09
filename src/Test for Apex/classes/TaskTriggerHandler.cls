public class TaskTriggerHandler {
    
    public static void updateAccountOnTaskEvents(List<Task> newList, Map<Id,Task> oldMap){
        
        Map<Id,Id> mapOfTaskIdWithWhatId = new Map<Id,Id>();
        for(Task tk : newList){
            if(tk.WhatId != Null){
                mapOfTaskIdWithWhatId.put(tk.Id,tk.WhatId);
            }
        }
        
        List<Account> accList = [SELECT Id, Total_Activities__c,Total_Open_Activities__c,Total_Closed_Activities__c FROM Account WHERE ID IN :mapOfTaskIdWithWhatId.values() ];
        Map<Id,Integer> mapOfTotalActivities = new Map<Id,Integer>();
        AggregateResult[] aggr= [SELECT Count(Id)countTask,WhatId FROM Task WHERE Id IN :mapOfTaskIdWithWhatId.keySet() GROUP BY WhatId];
            for(AggregateResult agg : aggr){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfTask = (Integer)agg.get('countTask');
            mapOfTotalActivities.put(IdOfAccount, countOfTask);
            }
        
        Map<Id,Integer> mapOfOpenedActivities = new Map<Id,Integer>();
        AggregateResult[] aggr1 =[SELECT Count(Id)countTask,WhatId FROM Task WHERE Id IN :mapOfTaskIdWithWhatId.keySet()  AND Status= 'In Progress' GROUP BY WhatId];
        for(AggregateResult agg : aggr1){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfTask = (Integer)agg.get('countTask');
            mapOfOpenedActivities.put(IdOfAccount, countOfTask);
            }
        
        Map<Id,Integer> mapOfClosedActivities = new Map<Id,Integer>();
        AggregateResult[] aggr2= [SELECT Count(Id)countTask,WhatId FROM Task WHERE Id IN :mapOfTaskIdWithWhatId.keySet()  AND Status= 'Completed' GROUP By WhatId];
            for(AggregateResult agg : aggr2){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfTask = (Integer)agg.get('countTask');
            mapOfClosedActivities.put(IdOfAccount, countOfTask);
            }
        
        
        for(Account acc : accList){
           
            acc.Total_Activities__c =acc.Total_Activities__c + mapOfTotalActivities.get(acc.Id);
            acc.Total_Open_Activities__c = acc.Total_Open_Activities__c+mapOfOpenedActivities.get(acc.Id);
            acc.Total_Closed_Activities__c = acc.Total_Closed_Activities__c + mapOfClosedActivities.get(acc.Id);
            
            }
        
        if(!accList.isEmpty()){
            update accList;
        }
            
           
        }
      
        
    }