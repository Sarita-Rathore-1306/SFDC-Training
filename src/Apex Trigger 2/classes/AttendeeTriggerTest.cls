@isTest
public class AttendeeTriggerTest {
  
    @testSetup
    private static void setup(){
       List<Contact> conList = new List<Contact>();
       conList.add(new Contact(LastName = 'Test-Contact'));
       conList.add(new Contact(LastName = 'Test-Contact 1'));
       conList.add(new Contact(LastName = 'Test-Contact 2'));
       insert conList;
        
       List<Training_Session__c> trainingSessionList = new List<Training_Session__c>();
       trainingSessionList.add(new Training_Session__c(Name = 'Java'));
       trainingSessionList.add(new Training_Session__c(Name = 'Python'));
       trainingSessionList.add(new Training_Session__c(Name = 'Apex'));
       trainingSessionList.add(new Training_Session__c(Name = 'Pearl'));
       trainingSessionList.add(new Training_Session__c(Name = 'HTML'));
       trainingSessionList.add(new Training_Session__c(Name = 'JavaScript'));
        insert trainingSessionList;
        
       List<Attendee__c> newAttendees = new List<Attendee__c>();
        newAttendees.add(new Attendee__c(Contact__c = conList[0].Id, Training_Session__c=trainingSessionList[0].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[0].Id, Training_Session__c=trainingSessionList[1].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[0].Id, Training_Session__c=trainingSessionList[2].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[0].Id, Training_Session__c=trainingSessionList[1].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[1].Id, Training_Session__c=trainingSessionList[2].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[1].Id, Training_Session__c=trainingSessionList[3].Id));
        newAttendees.add(new Attendee__c(Contact__c = conList[1].Id, Training_Session__c=trainingSessionList[5].Id));
        newAttendees.add(new Attendee__c( Training_Session__c = trainingSessionList[5].Id));
        
        
        insert newAttendees;
        
    }
    
    
    @isTest
    private static void InsertCaseCheck(){
    
        List<Contact> updatedCon = [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName IN ( 'Test-Contact','Test-Contact 1')];
        System.debug(updatedCon);
        
        Assert.areEqual(3,updatedCon[0].Number_Of_Training_Sessions__c,'Not Correct');
        Assert.areEqual(3,updatedCon[1].Number_Of_Training_Sessions__c,'Not Correct');
    }
    
    
    @isTest
    private static void updateCaseCheck(){
        List<Contact> updatedCon = [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName IN ( 'Test-Contact','Test-Contact 1')];
        System.debug(updatedCon);
        
        List<Training_Session__c> trainingSessions = [SELECT Id,Name FROM Training_Session__c ];
        System.debug(trainingSessions);
        Test.StartTest();
        List<Attendee__c> attendee =[SELECT Id,Contact__c,Training_Session__c FROM Attendee__c WHERE (Contact__c = :updatedCon[0].Id AND Training_Session__c = :trainingSessions[1].Id)];
        attendee[0].Contact__c = updatedCon[1].Id ;
        update attendee;
        
        List<Contact> updatedContact = [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName = 'Test-Contact'];
        Assert.areEqual(3,updatedContact[0].Number_Of_Training_Sessions__c,'Not Correct');
        
        List<Contact> updatedContact1= [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName = 'Test-Contact 1'];
        Assert.areEqual(4,updatedContact1[0].Number_Of_Training_Sessions__c, 'Not correct');  
        Test.StopTest();
    }
    
    
    @isTest
    private static void deleteCaseCheck(){
        
        List<Contact> updatedCon = [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName IN ( 'Test-Contact','Test-Contact 1')];
        System.debug(updatedCon);
        
        List<Training_Session__c> trainingSessions = [SELECT Id,Name FROM Training_Session__c ];
        System.debug(trainingSessions);
      
        Test.StartTest();
        List<Attendee__c> attendee =[SELECT Id,Contact__c,Training_Session__c FROM Attendee__c WHERE (Contact__c = :updatedCon[0].Id AND Training_Session__c = :trainingSessions[2].Id)];
        delete attendee ;
        
        List<Contact> updatedContact = [SELECT Id,LastName,Number_Of_Training_Sessions__c FROM Contact WHERE LastName = 'Test-Contact'];
        Assert.areEqual(2,updatedContact[0].Number_Of_Training_Sessions__c,'Not Correct');
        Test.StopTest();
    }
}