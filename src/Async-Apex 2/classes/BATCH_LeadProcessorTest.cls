@isTest
(SeeALLData = false)
public class BATCH_LeadProcessorTest {
    
    @testSetup
    private static void setupData(){
        List<Lead> listOfLeads = new List<Lead>();
        for(Integer i = 1 ; i <= 200 ; i++){
            Lead ld = new Lead(LastName = ('Test' + i), Company = 'Fexle', Status = 'Closed - Converted');
            listOfLeads.add(ld);
        }
        insert listOfLeads;
    }
    
    @isTest
    private static void checkLeadProcessor(){
        Test.StartTest();
        String CRON_EXP = '0 0 13 * * ?';
        System.Schedule('Schedule Batch',CRON_EXP,new BATCH_LeadProcessor()); //The Batch size you pass in your database.execute must be same as your data processed in test class or more than that 
                                                                              //otherwise your code will get failed
        Test.StopTest();
        
    }
    @isTest
    private static void testSchdeuler(){
        Test.StartTest();
        BATCH_LeadProcessor btc = new BATCH_LeadProcessor();
        Database.executeBatch(btc);
        Test.StopTest();
        List<Lead> updatedLeads = [ SELECT Id,LeadSource FROM Lead ];
        Assert.areEqual('Dreamforce',updatedLeads[0].LeadSource , 'Your leadsourse is not updated successfully' );
    }
}