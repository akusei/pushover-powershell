# Pushover Bash Script
A PowerShell script to send pushover notifications. A [Pushover account](https://pushover.net/) is required to use this script. 

## Usage

```
usage: Send-Pushover.ps1 <apikey> <userkey> <-Message message> [options]

  -ApiKey   APIKEY     The pushover.net API key for your application
  -UserKey  USERKEY    Your pushover.net user key
  -Message  MESSAGE    The message to send; supports HTML formatting
  -Title    TITLE      Title of the message
  -Device   NAME       Comma seperated list of devices to receive message
  -Url      URL        URL to send with message
  -UrlTitle URLTITLE   Title of the URL
  -Priority PRIORITY   Priority of the message
                         -2 - no notification/alert
                         -1 - quiet notification
                          0 - normal priority
                          1 - bypass the user's quiet hours
                          2 - require confirmation from the user
  -Sound	SOUND      Notification sound to play with message
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
```

## TODO
* Turn into PS Module
* Add script to manage default settings and user override settings

## Examples
Send a simple "This is a test" message to all devices using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test"
```

Send a simple "This is a test" message with the title "Test Title" to all devices using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test" -Title "Test Title"
```

Send a simple "This is a test" message to the devices named "Phone" and "Home Desktop" using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test" -Device "Phone,Home Desktop"
```

Send a simple "This is a test" message to all devices that contains a link to www.google.com titled "Google" using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test" -Url "http://www.google.com" -UrlTitle Google
```

Send a simple "This is a test" high priority message to all devices using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test" -Priority 1
```

Send a simple "This is a test" message to all devices that uses the sound of a bike bell as the notification sound using the specified API key and user key

```
Send-Pushover.ps1 api-key user-key -Message "This is a test" -Sound bike
```

