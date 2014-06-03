on run argv
	set theHandle to item 1 of argv
	set theMessage to item 2 of argv
	set theRoom to item 3 of argv
	
	tell application "Messages"
		set theService to first service whose service type is iMessage
		set theChat to first chat of theService whose name is theRoom
		
		if theMessage ends with "jpg" then
			set theImagePath to "tmp.jpg"
			do shell script "curl -o " & theImagePath & " " & theMessage
			
			send POSIX file theImagePath to theChat
			do shell script "rm " & theImagePath
		else
			send theMessage to theChat
		end if
		
	end tell
end run