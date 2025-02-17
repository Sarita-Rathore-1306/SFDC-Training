import { LightningElement , track ,wire} from 'lwc';
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { getPicklistValues } from "lightning/uiObjectInfoApi";


export default class GenericPicklistComponent extends LightningElement {
 inputObject ;
 @track options;
 fieldapi = ' ';
 name ;
 @track optionspicklistvalues;
 wiredObject;
 wiredvalues;
 @track value ;
 handleInputChange(event)
 {

    this.inputObject = event.detail.value;
    

 }
//This wire method basically displays all the picklist fields of an object.
@wire(getObjectInfo ,{ objectApiName: '$inputObject' })
objectInfo(result)
{
  const {data , error} = result;
  this.wiredObject = result ;
  if(data)
  {
    console.log('Hey');
    console.log(data);
    let arr = [];
    console.log('Below');
    console.log(data.fields);
    for(let key in (data.fields)){
        console.log('Inside the for loop');
        if(Object.is(data.fields[key].dataType,"Picklist")){
             console.log('Inside the if block');
             arr.push(data.fields[key]);
        }      
    }
    this.options = arr.map(item =>({
          label : item.label,
          value : item.apiName
    }))
      console.log('data apiname ' + data.apiName);
      this.name = data.apiName + '.';
  }
  else if(error)
  {

    console.log('Comes in Error Block');

  }

}



handleChange(event){
    console.log(event.target.value);
      console.log('before assignment ' + this.fieldapi);
    this.fieldapi = this.name + event.target.value;
    console.log('after assignment ' + this.fieldapi);

}
handleChange1(event){
  
    this.value = event.detail.value;
    
}
//This wire method basically displays all the values of the selected picklist..
@wire(getPicklistValues, { recordTypeId: "012000000000000AAA", fieldApiName: "$fieldapi" })
picklistResults(result){
    const {data , error} = result;

    this.wiredvalues = result;
    if(data)
    {

      let arr2 = [];
      console.log('@@@@' + JSON.stringify(data.values));
      data.values.map(item =>(
        arr2.push({
          value : item.value,
          label : item.label
          

          
    })) )
       this.optionspicklistvalues = arr2 ;
    }

    else if(error)
    {

    console.log('Comes in Error Block for Plicklist values');
    console.log(error);

    }
} 


}