/*
            Purpose      :  This class has been created to update the object name and picklist field on contact on insertion of recordId.
            Created By   :  Sarita Rathore
            Created Date :  12/27/2024
            Revision_log :  v1_0 
            */
            
            
            public class DynamicApexPractice {
                /*
            Purpose      :  This method has been created to validate the recordId and update the fields.
            Return       :  void
            Argument     :  List<Contact>
            Created By   :  Sarita Rathore
            Revision_log :  v1_0
            */   
                public static void validateRecordandUpdateFields(List<Contact> newList){
                    List<Contact> listOfContactToProcess = new List<Contact>();
                    
                    
                    for(Contact con : newList){
                        if(String.isNotBlank(con.RecordId__c )){
                            listOfContactToProcess.add(con);
                        }
                    }
                    
                    
                    for(Contact con : listOfContactToProcess){
                        if((con.RecordId__c instanceOf Id)){
                            Id myId = (Id)con.RecordId__c;
                            Schema.sObjectType sObjectType = myId.getSObjectType();
                            
                            if(sObjectType != Null){
                                Schema.DescribeSObjectResult Result =  sObjectType.getDescribe();
                                
                                if(Result != Null && (validationFromDatabase(myId,Result.getName()))){
                                    con.Object_Name__c = Result.getName();
                                    
                                    Map<String,Schema.sObjectField> mapTostoreFields = Result.fields.getMap();
                                    String str1;
                                    str1 = getAllPicklistFields(mapTostoreFields);
                                    con.Picklist_Field__c = str1;
                                    
                                }
                                else{
                                    con.addError('This Record Id dont exist in Database');
                                }
                            }else{
                                con.addError('This Record Id does not exist in Database');
                            }
                        }
                        else{
                            con.addError('Please add the valid salesforce Id');
                        }
                    }
                    
                }
                
                /*
            Purpose      :  This Method has been created to Validate recordId from database.
            Return       :  Boolean
            Argument     :  Id,String
            Created By   :  Sarita Rathore
            Revision_log :  v1_0
            */
                public static Boolean validationFromDatabase(Id recordId, String name){
                    
                    String str = 'SELECT Id FROM '+ name + ' WHERE Id = \'' + recordId + '\'';
                    
                    List<sObject> sobjList = Database.query(str);
                    
                    if(!(sobjList.isEmpty())){
                        
                        return true;
                        
                    }
                    
                    return false ;
                    
                }
                /*
            Purpose      :  This Method has been created to get all the picklist fields associated with that object.
            Return       :  String
            Argument     :  Map<String,Schema.sObjectField>
            Created By   :  Sarita Rathore
            Revision_log :  v1_0
            */  
                
                
                public static String getAllPicklistFields(Map<String,Schema.sObjectField> mapTostoreFields){
                    String str1 = ' ';
                    if(!mapTostoreFields.isEmpty()){
                        
                        for(String str : mapTostoreFields.keySet()){
                            
                            Schema.DescribeFieldResult Result1 =  mapTostoreFields.get(str).getDescribe();
                            
                            if(Result1.getType() == Schema.DisplayType.PICKLIST){
                                
                                str1 = str1 +str + '\n';
                                
                            }                                    
                        }
                        
                    }
                    return str1;
                    
                }
                
            
            }