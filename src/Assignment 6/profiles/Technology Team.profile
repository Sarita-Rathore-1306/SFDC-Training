<?xml version="1.0" encoding="UTF-8"?>
<Profile xmlns="http://soap.sforce.com/2006/04/metadata">
    <custom>true</custom>
    <fieldPermissions>
        <editable>true</editable>
        <field>Attendee__c.Email__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Attendee__c.Phone__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Attendee__c.Training_Session_lookup__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Feedback__c.Comments__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Feedback__c.Rating__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Feedback__c.Session_lookup__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Training_Session__c.Average_Rating__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Training_Session__c.Events__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Training_Session__c.Location__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Training_Session__c.No_Of_Attendees__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Training_Session__c.No_of_Feedback__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>true</editable>
        <field>Training_Session__c.Session_Date__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <fieldPermissions>
        <editable>false</editable>
        <field>Training_Session__c.Total_Rating__c</field>
        <readable>true</readable>
    </fieldPermissions>
    <layoutAssignments>
        <layout>Attendee__c-Attendee Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Contact-Service Provider Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Contact-Service Provider Layout</layout>
        <recordType>Contact.Customer</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Contact-Service Provider Layout</layout>
        <recordType>Contact.Service_Provider</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Feedback__c-Feedback Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Training_Session__c-Training Session Layout</layout>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Training_Session__c-Webinar Page Layout</layout>
        <recordType>Training_Session__c.Webinar</recordType>
    </layoutAssignments>
    <layoutAssignments>
        <layout>Training_Session__c-Workshop Page Layout</layout>
        <recordType>Training_Session__c.Workshop</recordType>
    </layoutAssignments>
    <recordTypeVisibilities>
        <default>false</default>
        <recordType>Contact.Customer</recordType>
        <visible>false</visible>
    </recordTypeVisibilities>
    <recordTypeVisibilities>
        <default>true</default>
        <personAccountDefault>true</personAccountDefault>
        <recordType>Contact.Service_Provider</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <recordTypeVisibilities>
        <default>true</default>
        <recordType>Training_Session__c.Webinar</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <recordTypeVisibilities>
        <default>false</default>
        <recordType>Training_Session__c.Workshop</recordType>
        <visible>true</visible>
    </recordTypeVisibilities>
    <userLicense>Salesforce</userLicense>
    <userPermissions>
        <enabled>true</enabled>
        <name>AIViewInsightObjects</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ActivitiesAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AddDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowUniversalSearch</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AllowViewKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApexRestServices</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ApiEnabled</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AssignPermissionSets</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AssignTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>AuthorApex</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CanAccessCE</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CanInsertFeedSystemFields</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CanUseNewDashboardBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CanVerifyComment</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChangeDashboardColors</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterEditOwnPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterEditOwnRecordPost</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterFileLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInternalUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterInviteExternalUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ChatterOwnGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ClientSecretRotation</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ConnectOrgToEnvironmentHub</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ConsentApiUpdate</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ContentAdministrator</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ContentWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateCustomizeReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateDashboardFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateLtngTempFolder</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateReportFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CreateWorkspaces</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>CustomizeApplication</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DataExport</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DecisionTableExecUserAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DelegatedTwoFactor</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DeleteTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>DistributeFromPersWksp</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditBillingInfo</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditBrandTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditEvent</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditMyDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditMyReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditOppLineItemUnitPrice</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditPublicFilters</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditPublicTemplates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditReadonlyFields</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTask</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EditTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailMass</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EmailSingle</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableCommunityAppLauncher</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>EnableNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExportReport</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExternalClientAppAdmin</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExternalClientAppDeveloper</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ExternalClientAppViewer</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>FreezeUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>GiveRecognitionBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ImportCustomObjects</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>LightningConsoleAllowedForUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>LightningExperienceUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ListEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageAnalyticSnapshots</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageAuthProviders</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageBusinessHourHolidays</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageC360AConnections</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCMS</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCallCenters</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCategories</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCertificates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageContentPermissions</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageContentProperties</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageContentTypes</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCustomDomains</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCustomPermissions</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageCustomReportTypes</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageDashbdsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageDataCategories</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageDataIntegrations</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageDataMaskPolicies</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageDynamicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageEmailClientConfig</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageEntitlements</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageExchangeConfig</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageHubConnections</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageInteraction</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageInternalUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageIpAddresses</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageKnowledge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageKnowledgeImportExport</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageLoginAccessPolicies</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageMobile</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageNetworks</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageOrchInstsAndWorkItems</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManagePackageLicenses</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManagePasswordPolicies</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageProfilesPermissionsets</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManagePropositions</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManagePvtRptsAndDashbds</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageRecommendationStrategies</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageReleaseUpdates</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageRemoteAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageReportsInPubFolders</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageRoles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageSearchPromotionRules</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageSharing</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageSubscriptions</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageSynonyms</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageUnlistedGroups</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ManageUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>MassInlineEdit</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>MergeTopics</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ModerateChatter</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ModifyDataClassification</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ModifyMetadata</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>MonitorLoginHistory</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>NewReportBuilder</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>OmnichannelInventorySync</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>Packaging2</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>Packaging2Delete</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>PrivacyDataAccess</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RemoveDirectMessageMembers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ResetPasswords</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>RunReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ScheduleReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SelectFilesFromSalesforce</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SendCustomNotifications</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SendSitRequests</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ShareInternalArticles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ShowCompanyNameAsUserBadge</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubmitMacrosAllowed</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeDashboardRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeDashboardToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeReportRolesGrps</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeReportToOtherUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeReportsRunAsUser</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeToLightningDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>SubscribeToLightningReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>TransactionalEmailSend</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>TransferAnyEntity</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseFulfillmentAPIs</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseOmnichannelInventoryAPIs</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseRegisterGuestBuyerAPI</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseReturnOrder</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseReturnOrderAPIs</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseTeamReassignWizards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>UseWebLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewAllProfiles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewAllUsers</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewClientSecret</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewDataAssessment</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewDataCategories</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewDataLeakageEvents</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewDeveloperName</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewEventLogFiles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewFlowUsageAndFlowEventData</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewHealthCheck</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewHelpLink</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewMLModels</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewMyTeamsDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewPlatformEvents</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewPublicDashboards</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewPublicReports</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewRoles</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewSetup</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>ViewUserPII</name>
    </userPermissions>
    <userPermissions>
        <enabled>true</enabled>
        <name>WorkCalibrationUser</name>
    </userPermissions>
</Profile>
