import { LightningElement , track , wire} from 'lwc';
import getAllAccounts from '@salesforce/apex/AccountSelector.getAllAccountsDetails';
import {refreshApex} from '@salesforce/apex';

const columnsdata =
    [

    { label: 'Name', fieldName: 'Name' },

    { label: 'Account Number', fieldName: 'AccountNumber' },

    { label: 'Phone', fieldName: 'Phone', type: 'phone' },

    { label: 'Website', fieldName: 'Website', type: 'url' },

    { label: 'Created Date', fieldName: 'CreatedDate', type: 'date', sortable: true }


    ];

export default class AccountDataTable extends LightningElement {
 @track data;
 @track columns = columnsdata;
 @track sortedBy = 'CreatedDate';
 @track sortedDirection = 'desc';

 refreshedData;
 isShowModal = false ;
 error;
 
 // Get all the accounts from database
 @wire(getAllAccounts)
  wiredAccounts(result)
  {
    this.refreshedData = result ;
    if(result.data)
    {

      this.data = result.data ;
      this.error = undefined;
      
    }
    else 
    {

      this.error = result.error ;
      this.data = undefined ;
    
    }
  }
  // On button click of new account
  handleClick(event){
     this.isShowModal = true ;
  }

  handlechildevent(event){

    return refreshApex(this.refreshedData);

  }


  handleSort(event) {
        const { fieldName: sortedBy, sortDirection } = event.detail;
        const cloneData = [...this.data];

        cloneData.sort((a, b) => {
            let valueA = a[sortedBy];
            let valueB = b[sortedBy];
            
            // Handle date comparison
            if (sortedBy === 'CreatedDate') {
                valueA = new Date(valueA);
                valueB = new Date(valueB);
            }

            let result = 0;
            if (valueA > valueB) {
                result = 1;
            } else if (valueA < valueB) {
                result = -1;
            }
            return sortDirection === 'desc' ? result : -result;
        });

        this.data = cloneData;
        this.sortedBy = sortedBy;
        this.sortedDirection = sortDirection;
  }



}