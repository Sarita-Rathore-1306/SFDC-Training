/*
            Purpose      :  Test Class for Batch_ArchivingData,Batch_ArchivingDataSchedule.
            Created By   :  Sarita Rathore
            Created Date :  12/30/2024
            Revision_log :  v1_0- 12/30/2024 - Sarita Rathore - 100% 
            */

@isTest
     (SeeAllData = false)
                    public class Batch_ArchivingData_Test {
               
                    @isTest (SeeAllData = true)
                    private static void testScheduleAndBatchJob(){
                    
                    List<Archive_Config__mdt> dataOfCustomMetadata = [SELECT Developer_Name__c,Object_Label__c,Filter__c,Duration__c,Label,DeveloperName FROM Archive_Config__mdt] ; 
                    Schema.sObjectType typeSObject = ((SObject)Type.forName(dataOfCustomMetadata[0].Object_Label__c).newInstance()).getsObjectType();
                    Schema.DescribeSObjectResult result = typeSObject.getDescribe();
                    Map<String,Schema.sObjectField> mapTostorefields = result.fields.getMap();
                        String str1 = '';
                     for(String str : mapTostoreFields.keySet())
                     {
                                    str1 = str1 +str + ',';
                      }
                     String str2 = str1.removeEnd(',');
                    Test.StartTest();
                    String exp = '0 0 12 L * ? ';
                    
                    Schedule_Batch_ArchivingData btc1 = new Schedule_Batch_ArchivingData();
                    System.schedule('Schedule Job',exp,btc1);
                    
                    String query =  'SELECT ' + str2 +' FROM ' + dataOfCustomMetadata[0].Object_Label__c  + ' WHERE CreatedDate >= LAST_N_DAYS:' + dataOfCustomMetadata[0].Duration__c + ' AND ' + dataOfCustomMetadata[0].Filter__c + ' LIMIT 200 ';
                    Batch_ArchivingData btc2 = new Batch_ArchivingData(query , str2);
                    Database.executeBatch(btc2);
                    
                    Test.StopTest();
                     //Asserts for Schedule Job  
                     Assert.areEqual(2, Schedule_Batch_ArchivingData.numberOfTimesBatchExecuted);
                     
                     //Asserts for Batch Job 
                     List<Account> listofBatchProcessed = [SELECT Id FROM Account WHERE Domain__c = 'fexle.com'];    
                     System.debug(listofBatchProcessed);
                        
                     Assert.isTrue(listofBatchProcessed.size() == 0);
                     
                     Assert.areEqual(1,Batch_ArchivingData.invocations);
            
                       
                    
                }
               
            }