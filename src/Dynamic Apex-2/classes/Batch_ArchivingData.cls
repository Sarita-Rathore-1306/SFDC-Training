/*
            Purpose      :  This Batch class has been created to send the email of aarchive data and then delete it.
            Created By   :  Sarita Rathore
            Created Date :  12/30/2024
            Revision_log :  v1_0 
            */
            

global class Batch_ArchivingData implements Database.Batchable<sObject>,Database.stateful {
    
    public String query = '';
    public String fieldsall = '';
    @TestVisible static Integer invocations;
   
    
    
     public Batch_ArchivingData(String query1 ,String fields )
    {
        this.query = query1 ;
        this.fieldsall = fields ;
    }
    
    
    
    
    public List<sObject> overallList = new List<sObject>();
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc, List<sObject> listOfsObject){
        
        overallList.addAll(listOfsObject);
       
       
        //Deleting the data retrieved
        if(!(listOfsObject.isEmpty())){
            
                delete listOfsObject ;
     
        }
        
    }
    public void finish(Database.BatchableContext bc){
        //System.debug(listOfsObject);
        if(!(overallList.isEmpty())){
        sObject firstRecord = overallList[0];
        Schema.sObjectType typeOfSObject = firstRecord.getSObjectType();
        Schema.DescribeSObjectResult result = typeOfSObject.getDescribe();
        Map<String, Schema.sObjectField> mapTostorefields = result.fields.getMap();
        
        
        //CSV File Creation
        //Prepare Header
        String header = '';
        for(String fieldName : mapTostorefields.keySet()){
           header = header +  fieldName + ',';
        }
        header = header.removeEnd(',');
        //Prepare All Rows
        
        for(sObject record : overallList){
            String row1 = '';
            for(String fieldName :mapTostorefields.keySet()){
                row1 = row1 + String.valueOf(record.get(fieldName)) + ',';
            }
            row1 = row1.removeEnd(',');
            header = header + '\n' + row1 ;
        }
        
        Messaging.EmailFileAttachment csvFile = new Messaging.EmailFileAttachment();
        csvFile.setFileName('ArchivedData.csv');
        csvFile.setBody(blob.valueOf(header));
        
        //Sending Email with attached CSV File
        Id idOfLoginUser = UserInfo.getUserId();
        String emailAddress = [SELECT Email FROM User WHERE ID = :idOfLoginUser].Email;
        List<String> emailAddresses = new List<String>();
        emailAddresses.add(emailAddress);
        Messaging.SingleEmailMessage emailTemp = new Messaging.SingleEmailMessage();
        emailTemp.setToAddresses(emailAddresses);
        emailTemp.setSubject('Archived Data');
        emailTemp.setSenderDisplayName('Fexle-An Xorinat');
        emailTemp.setFileAttachments(new List<Messaging.EmailFileAttachment>{csvFile});
        String htmlBody = '<p>Hello, </p>';
        htmlBody += '<p> This email contains the data which is archived</p>'; 
        htmlBody += '<p> Please find the attached CSV file for the Archived Data.</p>';
        htmlBody += '<p> Thank You!</p>';
        emailTemp.setHTMLBody(htmlBody);
        Messaging.sendEmail(new list<Messaging.SingleEmailMessage>{emailTemp});
        invocations = Limits.getEmailInvocations();
        
        }
    }
    
    
             
          

    }