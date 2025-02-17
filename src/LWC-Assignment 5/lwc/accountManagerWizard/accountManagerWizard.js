import { LightningElement, api, wire,track } from 'lwc';
import getAcccountDetails from '@salesforce/apex/AccountSelector.getAccountDetails';
import getAllContacts from '@salesforce/apex/ContactSelector.getAllContacts';
import getContacts from '@salesforce/apex/ContactService.filteredContacts';
import {refreshApex} from '@salesforce/apex';

const columnsdata =
    [

    { label: 'Name', fieldName: 'Name' },

    { label: 'Last Name', fieldName: 'LastName' },

    { label: 'Title', fieldName: 'Title' },

    { label: 'Phone', fieldName: 'Phone', type: 'phone' },

    { label: 'Email', fieldName: 'Email', type: 'email' }

    ];
export default class AccountManagerWizard extends LightningElement {

 @api recordId;

 name;

 owner;

 numberContacts;

 description;

 error;

 @track data;

 refreshedData;

 change = '';

 @track columns = columnsdata;

 straccName = '';

 isShowModal = false;

 @wire(getAcccountDetails,{recordId : '$recordId'})
 wiredgetDetails({error,data})
 {
    if(data)
    {

      this.name = data[0].Name;
      this.owner = data[0].Owner.Name;
      this.numberContacts = data[0].Number_Of_Contacts__c;
      this.description = data[0].Description;

    }

    else if(error)
    {

      this.error= error;

    }

 }
/*
 handleContactName(event)
 {

    this.straccName = event.detail.value;

 }
 */

 handleClick(event)
 {

    this.isShowModal = true;

 }
 
 handlechildevent(event)
 {

   this.isShowModal = event.detail.value;
   console.log('wire mthod in after refresh in handlecholdevent');

 }

 handlechildevent1(event)
 {

   this.isShowModal = event.detail.value;
   console.log('wire mthod in after refresh in handlecholdevent');
   this.change = event.detail.changevar;
   console.log(this.change);
   console.log('Inside justcall');
   return refreshApex(this.refreshedData);
  // this.justcall();

 }

 //justcall(){
  

   //console.log(this.change);
   //console.log('Inside justcall');
  // return refreshApex(this.data);
  
 //}

   /*
   @wire(getAllContacts, { recordId : '$recordId' , searchKey : '$straccName', change : '$change'})    
   wiredgetContacts({data,error})
   {

      console.log('wire mthod in after refresh');
      if(data)
      {
     
        console.log(this.change);

        console.log(data);
        //Call Service Class here
        //My First Approach with no any methods of javascript is used
///////////////////////////////////////////////////////////////////////////////////////////////

        if(this.straccName == undefined || this.straccName == '')
        this.data = data ;
        else
        {
          const arr = [];

          data.forEach(element => 
         {
            console.log(element.FirstName);
            if((element.LastName) !== undefined){
              if((element.LastName).includes(this.straccName))
                arr.push(element);
            }
            if((element.FirstName) !== undefined)
            {

              if((element.FirstName).includes(this.straccName))
              {

               console.log((element.LastName).includes(this.straccName));
               arr.push(element);

              }

            }
         }
        )
    
 ///////////////////////////////////////////////////////////////////////////////////////////////      
         

         this.data = arr;
         console.log(this.data);
         console.log(this.change);
        }
            
      }
      
            
        else if(error)
         {

            this.error = error ;

         } 

  }

*/


  //Another Approach using js methods of filter
  // Optimized Approach for search functionality
  @wire(getAllContacts, { recordId : '$recordId' })
  allContacts(result)
  { 
    //Here be cautious of using result to refresh the data
    //let obj =  {
    //  data1  : data,
     // error1 : error,
     //}
     
    this.refreshedData = result ;
    if(result.data)
    {

      this.data = result.data ;
      
    }
    else 
    {

      this.error = result.error ;
    
    }
  }

 handleContactName(event)
 {

  this.data = (this.data).filter(element => (element.Name).toLowerCase().includes(event.target.value.toLowerCase()));

 }

      
}