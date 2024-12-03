/*
Purpose      :  This class has been created to handle bulk operations of insertion, deletion and updation using Database class.
Created By   :  Sarita Rathore
Created Date :  11/29/2024
Revision_log :  v1_0
*/
public without sharing class TrainingSessionHandler {

    // This Enum contains the type of Session
        public enum SessionType { 
          WEBINAR , WORKSHOP, SEMINAR
          }
/*
Purpose      :  This Method has been created to handle bulk operations of insertion.
Return       :  void
Argument     :  No argument
Created By   :  Sarita Rathore
Revision_log :  v1_0
*/  
  public static void insertingBulkRecordsInTrainingSession(){
    List<Training_Session__c> listOfTrainingSessions=new List<Training_Session__c>();
    for(Integer i=1;i<100;i++){
        listOfTrainingSessions.add(new Training_Session__c(Name='TS'+i));
    }
   
    //Database.insert(sObjects,allOrNone)
    Database.SaveResult[] insertionOperationData = Database.insert(listOfTrainingSessions, false);
    for(Integer i=0;i<insertionOperationData.size();i++){
    //Handling Partial success and failure 
    if(insertionOperationData[i].isSuccess()){
        System.debug('Successfully Inserted Data' + insertionOperationData[i].Id);
    }
    else{
        for(Database.Error e : insertionOperationData[i].getErrors()){
        System.debug('The Following Errors Occurred');
        System.debug(e.getStatusCode() + ': ' + e.getMessage());
        System.debug('Fields Where the error occurred' + e.getFields());
        }
    }}
  } 

/*
Purpose      :  This Method has been created to handle bulk operations of updation.
Return       :  void
Argument     :  No argument
Created By   :  Sarita Rathore
Revision_log :  v1_0
*/  

  public static void updatingBulkRecordsInTrainingSession(){
    list<Training_Session__c> trainingSessions = [SELECT Id, Name, Location__c  FROM Training_Session__c WHERE CreatedDate= Today];
    for(Training_Session__c tS : trainingSessions ){
        tS.Location__c='Jaipur'; 
    }
    Database.SaveResult[] updationOperationData = Database.update(trainingSessions, false);
    for(Integer i=0;i<updationOperationData.size();i++){
    if(updationOperationData[i].isSuccess()){
        System.debug('This records has been Updated' + updationOperationData[i].Id );
    }
    else {
         for(Database.Error e : updationOperationData[i].getErrors()){
           System.debug('The Following errors occured');
           System.debug(e.getStatusCode() + ': ' + e.getMessage());
           System.debug('Field where the Error Occured' + e.getFields());
          }
        }
    }
    }
/*
Purpose      :  This Method has been created to handle bulk operations of deletion.
Return       :  void
Argument     :  No argument
Created By   :  Sarita Rathore
Revision_log :  v1_0
*/  
   public static void deletingBulkRecordsFromTrainingSession(){
    List<training_Session__c> trainingSessionsToBeDeleted = [SELECT id,Name FROM Training_Session__c WHERE Name Like '%TrainingSession%'];
    Database.DeleteResult[] deletedTS = Database.delete(trainingSessionsToBeDeleted, false);
    for(Integer i=0;i<deletedTS.size();i++){
        if(deletedTS[i].isSuccess()){
            System.debug('This Record has been deleted' + deletedTS[i].id );
        }
        else{
            for(Database.Error e : deletedTS[i].getErrors() ){
                System.debug('This following errors occured during deletion process');
                System.debug(e.getStatusCode()+ ': ' + e.getMessage());
                System.debug('Fields where the error occured' + e.getFields());
            }
        }
    }
   } 


  //  Purpose        : This Method will fetch training sessions based on certain criteria such date ,type and attendee count.
  //  Return         : void
  //  Argument       : Date, SessionType, Integer
  //  Revision_Log   : V1.0
public static void fetchTrainingSessionsOnComplexCriterias(Date dateOfTrainingSessions, SessionType type, Integer count ){
    for(Training_Session__c trainingSessionsHavingComplexLogics : [SELECT Id, Name, Session_Date__c, Type_Of_Session__c, No_Of_Attendees__c FROM Training_Session__c WHERE (Session_Date__c = :dateOfTrainingSessions AND  Type_Of_Session__c = :type.name() AND No_Of_Attendees__c = :count)]){
      System.debug(trainingSessionsHavingComplexLogics);
    }
  }


  // Purpose         : This Method will display different messages for different session types.
  //  Return         : void
  //  Argument       : No Argumnet
  //  Revision_Log   : V1.0
  public static void generateMessagesForAllTrainingSessionsAccordingToSessionType(){
    for(Training_Session__c  trainingSessions : [SELECT Id,Name,Type_Of_Session__c FROM Training_Session__c]){
        if(trainingSessions.Type_Of_Session__c == SessionType.WEBINAR.name()){
            System.debug('TrainingSession Name'+ trainingSessions);
            System.debug(System.Label.SessionType_Webinar);
        }
        else if(trainingSessions.Type_Of_Session__c == SessionType.WORKSHOP.name()){
            System.debug('TrainingSession Name'+ trainingSessions);
            System.debug(System.Label.Session_Type_Workshop);
        }
        else if(trainingSessions.Type_Of_Session__c == SessionType.WORKSHOP.name()){
            System.debug('TrainingSession Name'+ trainingSessions);  
            System.debug(System.Label.Session_Type_Seminar);
        }
    }
}
  }