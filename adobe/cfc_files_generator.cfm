<cfset path = getDirectoryFromPath(GetCurrentTemplatePath()) & "classTemplates/">
<cfloop
    index = "i"
    from = "1"
    to = "10000" >

<cffile
    action = "write"
    file = "#getDirectoryFromPath(GetCurrentTemplatePath())##i#.cfc"
    output = '<cfcomponent>
    <cffunction name="getLocalTime" access="remote">
        <cfreturn TimeFormat(now())>
    </cffunction>
    <cffunction name="getUTCTime" access="remote">
        <cfscript>
            serverTime=now();
            utcTime=GetTimeZoneInfo();
            utcStruct=structNew();
            utcStruct.Hour=DatePart("h", serverTime);
            utcStruct.Minute=DatePart("n", serverTime);
            utcStruct.Hour=utcStruct.Hour + utcTime.utcHourOffSet;
            utcStruct.Minute=utcStruct.Minute + utcTime.utcMinuteOffSet;
            if (utcStruct.Minute LT 10) utcStruct.Minute = "0" & utcStruct.Minute;
        </cfscript>
        <cfreturn utcStruct.Hour & ":" & utcStruct.Minute>
    </cffunction>
	</cfcomponent>'
    addNewLine = "yes"
    attributes = "normal"
   >
</cfloop>
<cfoutput> Created CFC files to invoke from class_file_generator.cfm </cfoutput>