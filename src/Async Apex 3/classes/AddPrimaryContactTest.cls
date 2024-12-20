@isTest
(SeeAllData = false)
public class AddPrimaryContactTest {
    @testSetup
    private static void setupData(){
        List<Account> listOfAccount = new List<Account>();
        for(Integer i = 1 ; i <= 100 ; i++){
            if(i<= 50){
                Account acc = new Account(Name = ('Test' + i),BillingState ='CA');
                listOfAccount.add(acc);
            }else{
                Account acc = new Account(Name = ('Test'+i),BillingState ='NY');
                listOfAccount.add(acc);
            }
        }
        insert listOfAccount;
        
        Contact con = new Contact(LastName = 'Test Contact');
        insert con;
    }
    
    @isTest
    private static void test(){
        List<Contact> con = [SELECT Id,LastName FROM Contact];
        
        Test.StartTest();
        System.enqueueJob(new AddPrimaryContact(con[0],'CA'));
        Test.StopTest();
        List<Account> accList = [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE BillingState = 'CA'];
        List<Account> accList1 = [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE BillingState = 'NY'];
        Assert.isTrue(accList[0].Contacts.size() > 0 , 'Assert Failed');
        Assert.isTrue(accList1[0].Contacts.size() == 0 , 'Assert Failed');
        
    }
}