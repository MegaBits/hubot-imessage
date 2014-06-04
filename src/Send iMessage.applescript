on run argv
	set theHandle to item 1 of argv
	set theMessage to item 2 of argv
	set theRoom to item 3 of argv
	
	if theMessage ends with "jpg" then
		set theImagePath to "tmp.jpg"
		set theImagePath to ((do shell script "curl -o " & theImagePath & " " & theMessage & "; pwd") & "/" & theImagePath)
		
		set theImage to (POSIX file theImagePath)
		set theContent to theImage
	else if theMessage ends with "gif" then
		set theImagePath to "tmp.gif"
		set theImagePath to ((do shell script "curl -o " & theImagePath & " " & theMessage & "; pwd") & "/" & theImagePath)
		
		set theImage to (POSIX file theImagePath)
		set theContent to theImage
	else if theMessage ends with "png" then
		set theImagePath to "tmp.jpg"
		set theImagePath to ((do shell script "curl -o " & theImagePath & " " & theMessage & "; pwd") & "/" & theImagePath)
		
		set theImage to (POSIX file theImagePath)
		set theContent to theImage
	else
		set theContent to theMessage
	end if
	
	#send theMessage to theChat
	
	tell application "Messages"
		set theService to first service whose service type is iMessage
		set theChat to first chat of theService whose name is theRoom
		
		send theContent to theChat
	end tell
end run
