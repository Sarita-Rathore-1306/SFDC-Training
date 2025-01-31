import { LightningElement,wire } from 'lwc';
import demoMessageChannel from '@salesforce/messageChannel/demoMessageChannel__c';
import demoMessageChannel1 from '@salesforce/messageChannel/demoMessageChannel1__c';
import {MessageContext,publish,subscribe,unsubscribe} from 'lightning/messageService' ;

export default class MessangerA extends LightningElement {
    receivedMessageFromB ;
    @wire(MessageContext)
    messageContext;

    handleinput(event){
        let payload = {value : event.detail.value};
        this.publish = publish(this.messageContext, demoMessageChannel1, payload);
    }
    subscription = null ;
    connectedCallback(){
        this.subscription = subscribe(this.messageContext ,demoMessageChannel, (message) => {
         this.receivedMessageFromB = message.enteredvalue ;
        } );
    }

    disconnectedCallback(){
        unsubscribe(this.subscription);
    }

}