<cfscript>
root = getDirectoryFromPath( getBaseTemplatePath() );
directory = expandPath( "./testcases/packages/" );
files = directoryList( path=directory, recurse=true, type="file" );
classpaths = files.map( toDottedPath );

started = getTickCount();
for ( cfc in classpaths ) {
	x = tester(cfc);
	x();
}
ended = getTickCount();
duration = ended - started;
line = '"#now()#","#server.coldfusion.productversion#","#duration#"';

myfile = fileOpen( "#root#/results.csv", "write");
fileWriteLine( myfile, line );
fileClose( myfile );


writeOutput("#line#");



function toDottedPath( path ) {
	return path
		.replace( root, "" )
		.replace( "/", ".", "all" )
		.rereplaceNoCase( "\.cfc$", "" );
}


function tester( dottedpath ) {
	return () => getComponentMetadata( dottedpath );
}</cfscript>