public class EventTriggerHandler {
    public static void updateAccountOnEvents(List<Event> newList, Map<id,Event> oldMap){
        Map<Id,Id> mapOfEventIdWithWhatId = new Map<Id,Id>();
        for(Event tk : newList){
            if(tk.WhatId != Null){
                mapOfEventIdWithWhatId.put(tk.Id,tk.WhatId);
            }
        }
        
        List<Account> accList = [SELECT Id, Total_Activities__c,Total_Open_Activities__c,Total_Closed_Activities__c FROM Account WHERE ID IN :mapOfEventIdWithWhatId.values() ];
        Map<Id,Integer> mapOfTotalActivities = new Map<Id,Integer>();
        AggregateResult[] aggr= [SELECT Count(Id)countEvent,WhatId FROM Task WHERE Id IN :mapOfEventIdWithWhatId.keySet() GROUP BY WhatId];
            for(AggregateResult agg : aggr){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfEvent = (Integer)agg.get('countEvent');
            mapOfTotalActivities.put(IdOfAccount, countOfEvent);
            }
        
        Map<Id,Integer> mapOfOpenedActivities = new Map<Id,Integer>();
        AggregateResult[] aggr1 =[SELECT Count(Id)countEvent,WhatId FROM Event WHERE Id IN :mapOfEventIdWithWhatId.keySet()  AND Status__c= 'Opened' GROUP BY WhatId];
        for(AggregateResult agg : aggr1){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfEvent = (Integer)agg.get('countEvent');
            mapOfOpenedActivities.put(IdOfAccount, countOfEvent);
            }
        
        Map<Id,Integer> mapOfClosedActivities = new Map<Id,Integer>();
        AggregateResult[] aggr2= [SELECT Count(Id)countEvent,WhatId FROM Event WHERE Id IN :mapOfEventIdWithWhatId.keySet()  AND Status__c= 'Closed' GROUP By WhatId];
            for(AggregateResult agg : aggr2){
            Id IdOfAccount = (Id)agg.get('WhatId');
            Integer countOfEvent = (Integer)agg.get('countEvent');
            mapOfClosedActivities.put(IdOfAccount, countOfEvent);
            }
        
       
        for(Account acc : accList){
            if(oldMap.isEmpty()){
            
            acc.Total_Activities__c =acc.Total_Activities__c + mapOfTotalActivities.get(acc.Id);
            acc.Total_Open_Activities__c = acc.Total_Open_Activities__c+mapOfOpenedActivities.get(acc.Id);
            acc.Total_Closed_Activities__c = acc.Total_Closed_Activities__c + mapOfClosedActivities.get(acc.Id);
            
            }
           
        }
        
        if(!accList.isEmpty()){
            update accList;
        }

            
        }
    }