# openhab-blink
Control your Blink Cameras with Openhab2

##Disclaimer:
"Blink Wire-Free HS Home Monitoring & Alert Systems" is a trademark owned by Immedia Inc., see www.blinkforhome.com for more information. I am in no way affiliated with Blink, nor Immedia Inc.

Original protocol hacking by MattTW : https://github.com/MattTW/BlinkMonitorProtocol

Login API calls faster than 60 seconds is not recommended as it can overwhelm Blink's servers. Please use this module responsibly.


First check if the user openhab can use sudo with no password.
Adding the user openhab to the sudoers with no password should

```Shell
sudo visudo -f /etc/sudoers.d/010_pi-nopasswd
```
Adding following lines
```Shell
openhab ALL=(ALL) NOPASSWD: ALL
```
