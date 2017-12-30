<#
.SYNOPSIS
    Sends push notifications to devices through Pushover.net.
	NOTE: This script requires an account at http://www.pushover.net
.DESCRIPTION
    A scriptable interface to send notifications to any device using the
	Pushover.net API.
.PARAMETER UserKey
    Your Pushover.net user key for messaging.
.PARAMETER ApiKey
    The API Key from Pushover.net to use for messaging.
.PARAMETER Message
    Body of the message to send. Supports HTML formatting.
.PARAMETER Title
    Title of the message to send.
.PARAMETER Device
    Comma seperated list of devices to receive message. If no device is specified
	the message is sent to all devices.
.PARAMETER Url
    A supplementary URL to show with your message.
.PARAMETER UrlTitle
    A title for your supplementary URL, otherwise just the URL is shown.
.PARAMETER Priority
	The message priority.
	
	Possible values:
	-2 - no notification/alert
	-1 - quiet notification
	 0 - normal priority
	 1 - high-priority and bypass the user's quiet hours
	 2 - require confirmation from the user
.PARAMETER Sound
    the name of one of the sounds supported by device clients to override
	the user's default sound choice.
	
	Possible values:
		pushover - Pushover (default)
		bike - Bike
		bugle - Bugle
		cashregister - Cash Register
		classical - Classical
		cosmic - Cosmic
		falling - Falling
		gamelan - Gamelan
		incoming - Incoming
		intermission - Intermission
		magic - Magic
		mechanical - Mechanical
		pianobar - Piano Bar
		siren - Siren
		spacealarm - Space Alarm
		tugboat - Tug Boat
		alien - Alien Alarm (long)
		climb - Climb (long)
		persistent - Persistent (long)
		echo - Pushover Echo (long)
		updown - Up Down (long)
		none - None (silent)
.EXAMPLE
    C:\PS> Send-Pushover token key -Message "This is a test"
    Sends a simple "This is a test" message to all devices.
.EXAMPLE
	C:\PS> Send-Pushover token key -Message "This is a test" -Title "Test Title"
    Sends a simple "This is a test" message with the title "Test Title" to all devices.
.EXAMPLE
    C:\PS> Send-Pushover token key -Message "This is a test" -Device Phone
	Sends a simple "This is a test" message to the device named "Phone".
.EXAMPLE
    C:\PS> Send-Pushover token key -Message "This is a test" -Url "http://www.google.com" -UrlTitle Google
	Sends a simple "This is a test" message to all devices that contains a link to www.google.com titled "Google".
.EXAMPLE
    C:\PS> Send-Pushover token key -Message "This is a test" -Priority 1
	Sends a simple "This is a test" high priority message to all devices.
.EXAMPLE
    C:\PS> Send-Pushover token key -Message "This is a test" -Sound bike
	Sends a simple "This is a test" message to all devices that uses the sound of a bike bell as the notification sound.
.NOTES
    Author: Nathan Martini
    Date:   September 25, 2015    
#>

[CmdletBinding()]
Param(
	[Parameter(Mandatory=$True, Position=1)]
	[string]$UserKey,
	
	[Parameter(Mandatory=$True, Position=2)]
	[string]$ApiKey,
	
	[Parameter(Mandatory=$True)]
	[string]$Message,
	
	[Parameter(Mandatory=$False)]
	[string]$Device,
	
	[Parameter(Mandatory=$False)]
	[string]$Title,
	
	[Parameter(Mandatory=$False)]
	[string]$Url,
	
	[Parameter(Mandatory=$False)]
	[string]$UrlTitle,
	
	[Parameter(Mandatory=$False)]
	[int]$Priority,
	
	[Parameter(Mandatory=$False)]
	[string]$Sound
)

$data = @{
	token = "$ApiKey";
	user = "$UserKey";
	message = "$Message"
}

if ($Device) { $data.Add("device", "$Device") }
if ($Title) { $data.Add("title", "$Title") }
if ($Url) { $data.Add("url", "$Url") }
if ($UrlTitle) { $data.Add("url_title", "$UrlTitle") }
if ($Priority) { $data.Add("priority", $Priority) }
if ($Sound) { $data.Add("sound", "$Sound") }

Invoke-RestMethod -Method Post -Uri "https://api.pushover.net/1/messages.json" -Body $data | Out-Null