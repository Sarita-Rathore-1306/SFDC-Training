import { LightningElement, track,wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountManagerController.getDataOfAccounts';
const columns = [
    { label: 'id', fieldName: 'Id' },
    { label: 'Name', fieldName: 'Name'},
    { label: 'Phone', fieldName: 'Phone', type: 'phone'},
    { label: 'Website', fieldName: 'Website', type: 'URL',editable: 'true'},
];



export default class AccountManager extends LightningElement {

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

}