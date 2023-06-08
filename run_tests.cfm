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

<cfparam name="url.cacheclear" default="false" type="boolean">
<cfif url.cacheclear>
	<cfset api = createObject("Component", "cfide.adminapi.administrator")>
	<cfset api.login("commandbox")>
	<cfset service = createObject("component", "cfide.adminapi.runtime")>
	<cfset service.clearTrustedCache()>
	<cfoutput><p>Cleared the template cache</p></cfoutput>
</cfif>

<cfset start = getTickCount()>
<!--- Include the TestBox HTML Runner --->
<cfinclude template="/testbox/system/runners/HTMLRunner.cfm">
<cfset end = getTickCount()>

<cfset resultsFile = expandPath( "./results.csv" )>
<cfif !fileExists( resultsFile )>
	<cfset headings = '"cfengine","time","clearedcache","firstrun"'>
	<cffile action="write" file="#resultsFile#" attributes="normal" output="#headings#">
</cfif>

<!--- The second example appends to the file. --->
<cfset line = '"#server.coldfusion.productversion#",#end-start#,"#yesNoFormat(url.cacheclear)#","#yesNoFormat(!structKeyExists(application, "suiterun"))#"'>
<cffile action="append" file="#resultsFile#" attributes="normal" output="#line#">
<cfset application.suiterun = true>
<cfoutput>#resultsFile#</cfoutput>
