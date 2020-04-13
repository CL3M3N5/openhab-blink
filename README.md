# openhab-blink
Control your Blink Cameras with Openhab2

First check if the user openhab can use sudo with no password.
Adding the user openhab to the sudoers with no password should

```Shell
sudo visudo -f /etc/sudoers.d/010_pi-nopasswd
```
Adding following lines
```Shell
openhab ALL=(ALL) NOPASSWD: ALL
```
