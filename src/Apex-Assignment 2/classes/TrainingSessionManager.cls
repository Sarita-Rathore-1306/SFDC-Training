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
public static void readRecordsFromTrainingSession(ID id){
  List<Training_Session__c> readRecords = new List<Training_Session__c>();
  for(Training_Session__c trainingSessionsToBeReaded:[SELECT Id,Name FROM Training_Session__c]){
    if(trainingSessionsToBeReaded.Id == id)
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
public static void updateRecordsFromTrainingSession(ID id, String location){
  for(Training_Session__c trainingSessionToBeUpdated:[SELECT Id, Name, Location__c FROM Training_Session__c]){
   try{
    if(trainingSessionToBeUpdated.Id == id){
      trainingSessionToBeUpdated.Location__c=location;
      update trainingSessionToBeUpdated;
    }
   } 
   catch(DmlException error){
     System.debug('DML Updation Failed'+ error.getMessage());
   }
  }
}
/*
 Purpose        : This Method will delete records from Training Session.
 Return         : void
 Argument       : No Argument
 Revision_Log   : V1.0
 */
public static void deleteRecordsFromTrainingSession(Id id){
  for(Training_Session__c trainingSessionToBeDeleted: [SELECT Id, Name, Location__c FROM Training_Session__c]){
   try{
    if(trainingSessionToBeDeleted.Id == id)
      delete trainingSessionToBeDeleted; 
   } 
   catch(DmlException error){
    System.debug('DML Deletion Failed'+ error.getMessage());
   }
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

public static void addAttendeesToTrainingSession (ID idOftrainingSession, Attendee__c newAttendees){
  //This Map will store the list of attendees related to the Training Session.
  Map<String, Set<Attendee__c>> mapOfTrainingSessionWithAssociatedAttendees = new Map<String, Set<Attendee__c>>();
  //For existing Records
  for(Attendee__c detailsOfAttendees:[SELECT Id, Name, Training_Session_lookup__c, Training_Session_lookup__r.Name FROM Attendee__c WHERE Training_Session_lookup__r.Name!=Null])
  {
    if(!mapOfTrainingSessionWithAssociatedAttendees.containsKey(detailsOfAttendees.Training_Session_lookup__r.Name)){
      mapOfTrainingSessionWithAssociatedAttendees.put(detailsOfAttendees.Training_Session_lookup__r.Name, new Set<Attendee__c>());
      }
      mapOfTrainingSessionWithAssociatedAttendees.get(detailsOfAttendees.Training_Session_lookup__r.Name).add(detailsOfAttendees);
  }
  //For New Records
  for(Training_Session__c detailsOfTrainingSessions:[SELECT Id, Name FROM Training_Session__c WHERE Id = :idOftrainingSession])
  {
    if(!mapOfTrainingSessionWithAssociatedAttendees.containsKey(detailsOfTrainingSessions.Name)){
     mapOfTrainingSessionWithAssociatedAttendees.put(detailsOfTrainingSessions.Name, new Set<Attendee__c>());
    }
     mapOfTrainingSessionWithAssociatedAttendees.get(detailsOfTrainingSessions.Name).add(newAttendees);
     insert newAttendees;
      }
  System.debug(mapOfTrainingSessionWithAssociatedAttendees);
  }
}