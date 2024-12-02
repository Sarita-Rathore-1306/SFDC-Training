/*
Purpose        : This class has been created to manage Training Session records.
Created Date   : 11/27/2024
Created By     : Sarita Rathore
Revision_Log   : V1.0
*/
public with sharing class TrainingSessionManager {
public enum SessionType { 
  WEBINAR , WORKSHOP, SEMINAR
  }
/*
 Purpose        : This Method will implement the usecase of Enum SessionType.
 Return         : void
 Argument       : SessionType
 Revision_Log   : V1.0
 */
public static void usecaseOfEnum(SessionType type){
  Training_Session__c newTrainingSession = new Training_Session__c(Name='Training Session-Webinar', Type_Of_Session__c = type.name());
  try{
    insert newTrainingSession;
  }
  catch(DmlException e){
    System.debug('Insertion Failed'+ e.getMessage());
  }
}

/*
 Purpose        : This Method will create records in Training Session.
 Return         : void
 Argument       : No Argument
 Revision_Log   : V1.0
 */
public static void createRecordsOfTrainingSession(){
  List<Training_Session__c> newRecords = new List<Training_Session__c>();
  for(Integer i=0;i<10;i++){
    newRecords.add(new Training_Session__c(Name = 'TrainingSession'+ i));
  }
  try{
    if(newRecords != Null){
      insert newRecords;
    }
  }
  catch(DmlException error){
     System.debug('DML Insertion Failed'+ error.getMessage());
  }
  
}
/*
 Purpose        : This Method will read records from Training Session.
 Return         : void
 Argument       : Id 
 Revision_Log   : V1.0
 */
public static void readRecordsFromTrainingSession(ID idOfRecordToRead){
  List<Training_Session__c> readRecords = new List<Training_Session__c>();
  for(Training_Session__c trainingSessionsToBeReaded:[SELECT Id,Name FROM Training_Session__c WHERE Id = :idOfRecordToRead]){
      readRecords.add(trainingSessionsToBeReaded);
  }
  if(!readRecords.isEmpty())
    System.debug(readRecords);
  else
    System.debug('No Such Record is there in Database');
}
/*
 Purpose        : This Method will update records from Training Session.
 Return         : void
 Argument       : Id,String
 Revision_Log   : V1.0
 */
public static void updateRecordsFromTrainingSession(ID idToUpdatedRecords, String location){
  List<Training_Session__c> storeTrainingSessionToUpdate = [SELECT Id, Name, Location__c FROM Training_Session__c WHERE Id = :idToUpdatedRecords];
  for(Training_Session__c trainingSessionToBeUpdated : storeTrainingSessionToUpdate){
      trainingSessionToBeUpdated.Location__c=location;
   } 
   try{
      update storeTrainingSessionToUpdate;
     }
   catch(DmlException error){
     System.debug('DML Updation Failed'+ error.getMessage());
  }
}
/*
 Purpose        : This Method will delete records from Training Session.
 Return         : void
 Argument       : No Argument
 Revision_Log   : V1.0
 */
public static void deleteRecordsFromTrainingSession(Id idForDeletingRecords){
  List<Training_Session__c> trainingSessionToBeDeleted = [SELECT Id, Name, Location__c FROM Training_Session__c WHERE Id = :idForDeletingRecords];
   try{
      delete trainingSessionToBeDeleted; 
   } 
   catch(DmlException error){
    System.debug('DML Deletion Failed'+ error.getMessage());
   }
}
/*
 Purpose        : This Method safely navigates through the relationships of a Training_Session__c record to fetch related Attendee__c records.
                  //Use of Safe navigator Operator
 Return         : List<Attendee__c>
 Argument       : No Argument
 Revision_Log   : V1.0
 */
public static List<Attendee__c> fetchRelatedRecordsOfAttendeesFromTrainingSession(){
  return [SELECT Id, Name, (SELECT Id,Name FROM Attendees1__r) FROM Training_Session__c LIMIT 1]?.Attendees1__r;
}

/*
 Purpose        : This Method fetches all Training Session Records and their related Attendees records
 Return         : void
 Argument       : No Argument
 Revision_Log   : V1.0
 */
 public static void getAllRecordsOfTrainingSessionWithTheirRelatedAttendeesRecords(){
 List<Training_Session__c> listOfTrainingSession=[SELECT Id,Name,(SELECT Id,Name FROM Attendees1__r) FROM Training_Session__c];
 } 

//Dynamic Aprroach from UI
//  Purpose        : This Method will add Unique Attedees to Training Sessions dynamically.
//  Return         : void
//  Argument       : ID,Attendee__c
//  Revision_Log   : V1.0
   public static void addAttendeesToTrainingSession1(Id idOfTrainingSession , List<Attendee__c> newAttendee){
       List<Attendee__c> listOfExistingAttendees =[SELECT Id, Name, Phone__c,Training_Session__c FROM Attendee__c WHERE Training_Session__c != Null];
       Set<String> listToStorePhone = new Set<String>();
        for(Attendee__c attendees : listOfExistingAttendees){
            listToStorePhone.add(attendees.Phone__c);
        }
        Set<String> listOfNewPhone = new Set<String>();
        for(Attendee__c att:newAttendee){
            listOfNewPhone.add(att.Phone__c);
        }
        listOfNewPhone.removeAll(listToStorePhone);
        List<Attendee__c> listOfNewAttendeesToInsert = new List<Attendee__c>();
        for(Attendee__c att:newAttendee){
            if(listOfNewPhone.contains(att.Phone__c)){
              Attendee__c newRecord = new Attendee__c();
              newRecord.Name = att.Name;
              newRecord.Phone__c = att.Phone__c;
              newRecord.Training_Session__c = idOfTrainingSession;
              listOfNewAttendeesToInsert.add(newRecord);
              listOfNewPhone.remove(att.Phone__c)  ;}          
        }
        if(!listOfNewAttendeesToInsert.isEmpty()){
        try{
            insert listOfNewAttendeesToInsert;
        }
        catch(DmlException e){
            System.debug('Insertion Failed' + e.getMessage());
        }
        }
}}
