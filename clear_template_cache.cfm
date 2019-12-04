<cfscript>
api = createObject("Component", "cfide.adminapi.administrator");
api.login("commandbox");
service = createObject("component", "cfide.adminapi.runtime");
service.clearTrustedCache();
</cfscript>

DONE. <a href="/">Back</a>