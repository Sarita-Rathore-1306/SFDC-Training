<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Discount_Aprroved_Action</fullName>
        <description>Discount Aprroved Action</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Discount_Approved</template>
    </alerts>
    <fieldUpdates>
        <fullName>Check_The_approved_Checkbox</fullName>
        <field>Discount_Approved__c</field>
        <literalValue>1</literalValue>
        <name>Check The approved Checkbox</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
</Workflow>
