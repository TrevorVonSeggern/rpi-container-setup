Docker container that creates a SMB share.

## Run

```
./build_image.sh
./start.sh
```

This example will bind `smbd` to docker host ip address

## Connecting
You'll want to expose enough ports to make the server discoverable.
The example above should be enough to get you moving.

`smb://<docker_host_ip>`

Enter login and password. Default is "pi" and "raspberry". You should change this in the start.sh file.
