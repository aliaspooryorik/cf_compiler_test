<cfset path = getDirectoryFromPath(GetCurrentTemplatePath()) & "classTemplates/">
<cfloop
    index = "i"
    from = "1"
    to = "10000" >
	<!--- Create  component instance. --->
	<cfobject component="classTemplates/#i#" name="tellTimeObj">
	<!--- Invoke the methods. --->
	<cfinvoke component="#tellTimeObj#" method="getLocalTime" returnvariable="localTime">
	<cfinvoke component="#tellTimeObj#" method="getUTCTime" returnvariable="UTCTime">
	<!--- Display the results. --->
	<h3>Time Display Page</h3>
	<cfoutput>
		Server's Local Time: #localTime#<br>
		Calculated UTC Time: #UTCTime#
	</cfoutput>
</cfloop>
<cfoutput> Invoked all files. This generates cfclass files </cfoutput>