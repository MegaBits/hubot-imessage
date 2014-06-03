on envVar(varName)
	return do shell script "source ~/.bash_profile; echo $" & varName
end envVar

on run argv
	set theHandle to item 1 of argv
	set theMessage to item 2 of argv
	set theRoom to item 3 of argv
	
	set imageOutputFile to (envVar("HUBOT_NAME") & "/porygon_img.jpg")
	set imageResult to (do shell script "curl -o " & imageOutputFile & " http://26.media.tumblr.com/tumblr_ltee8lg9wd1qb08qmo1_500.jpg -w %{http_code}")
	
	tell application "Messages"
		set theService to first service whose service type is iMessage
		set theChat to first chat of theService whose name is theRoom
		#send theMessage to theChat
		send POSIX file imageOutputFile to theChat
	end tell
end run