<cfsetting showDebugOutput="false" enablecfoutputonly="true" requesttimeout="36000">

<cfparam name="url.reporter" default="simple">
<cfparam name="url.directory" default="testcases">
<cfparam name="url.recurse" default="true" type="boolean">
<cfparam name="url.bundles" default="">
<cfparam name="url.labels" default="">
<cfparam name="url.excludes" default="">
<cfparam name="url.reportpath" default="#GetDirectoryFromPath(getCurrentTemplatePath())#">
<cfparam name="url.propertiesFilename" default="TEST.properties">
<cfparam name="url.propertiesSummary" default="false" type="boolean">

<cfparam name="url.coverageEnabled" default="false" type="boolean">
<cfparam name="url.coverageSonarQubeXMLOutputPath" default="">
<cfparam name="url.coveragePathToCapture" default="#expandPath( '../../../' )#">
<cfparam name="url.coverageWhitelist" default="/org/**.cfc,/survey/**.cfc">
<cfparam name="url.coverageBlacklist" default="Application.cfc,/org/any3/deployment/migrations/versions/**,/survey/reports/controllers/**.cfc">
<cfparam name="url.coverageBrowserOutputDir" default="#GetDirectoryFromPath(getCurrentTemplatePath())#coveragereport">

<!--- Include the TestBox HTML Runner --->
<cfinclude template="/testbox/system/runners/HTMLRunner.cfm">
