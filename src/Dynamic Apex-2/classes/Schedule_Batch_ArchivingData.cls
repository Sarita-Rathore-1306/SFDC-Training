/*
            Purpose      :  This Schedule class has been created to schedule tha Archive Batch Job.
            Created By   :  Sarita Rathore
            Created Date :  12/30/2024
            Revision_log :  v1_0 
            */
            

            public class Schedule_Batch_ArchivingData implements Schedulable {
                
                @testVisible static Integer numberOfTimesBatchExecuted = 0 ;
                
                public void execute(SchedulableContext sc)
                {
                    List<Archive_Config__mdt> getAllData = Archive_Config__mdt.getAll().values();
                    //System.debug(getAllData);
                    List<Archive_Config__mdt> DataToProcess = new List<Archive_Config__mdt>();
                    for(Archive_Config__mdt meta : getAllData)
                    {
                        Schema.sObjectType typeSObject = ((SObject)Type.forName(meta.Object_Label__c).newInstance()).getsObjectType();
                        Schema.DescribeSObjectResult result = typeSObject.getDescribe();
                        Map<String,Schema.sObjectField> mapTostorefields = result.fields.getMap();
                        String fieldsAll = getAllFields(mapTostorefields);
                        String  str = 'SELECT ' + fieldsAll +' FROM ' + meta.Object_Label__c  + ' WHERE CreatedDate >= LAST_N_DAYS:' + meta.Duration__c + ' AND ' + meta.Filter__c + ' LIMIT 200 ';
                        Batch_ArchivingData btc = new Batch_ArchivingData(str,fieldsAll);
                        Database.executeBatch(btc);
                        numberOfTimesBatchExecuted++ ;
                        
                    }
                    
                }
                
                public static String getAllFields(Map<String,Schema.sObjectField> mapTostoreFields)
                {
                    String str1 = ' ';
                    String str2 ;
                    if(!mapTostoreFields.isEmpty())
                    {
                        
                        for(String str : mapTostoreFields.keySet())
                        {
                            
                            str1 = str1 +str + ',';
                            
                        }
                        str2 = str1.removeEnd(',');
                        
                    }
                    return str2;
                    
                }
            }