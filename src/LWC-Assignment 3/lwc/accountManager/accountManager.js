import { LightningElement, track,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountManagerController.getDataOfAccounts';
import getDataOfAccountsImperatively from '@salesforce/apex/AccountManagerController.getDataOfAccountsImperatively';
const columns = [
    { label: 'id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone'},
    { label: 'Website', fieldName: 'Website', type: 'URL',editable: 'true'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone'},
];



export default class AccountManager extends LightningElement {
    // Use of Wire method to retrieve data 
     @track data = [];
     
     @track columns = columns ;
     
    @wire(getAccountList)
    wiredAccounts({ error , data }){
        if(data){
            
            this.data = data ;
        }else if(error){
            console.log('Failed to fetch data');
        }
    }

    connectedCallback(){
        console.log('Check the Console ');
    }


    // Use of Imperative Method

    @track data1 = [];
    @track error ;
    connectedCallback(){
        getDataOfAccountsImperatively()
        .then(result => {
            this.data1 = result ;
            this.error = undefined;
        })
        .catch(error => {
            this.error = error;
            this.data1 = undefined;
        }) 

        
    }

    

}