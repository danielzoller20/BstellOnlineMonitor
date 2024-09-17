# librenms in docker
workflow based on [LibreNMS & docker-compose](https://blog.danielisz.org/2021/11/24/librenms-docker-compose/)

needs to add user!
```sudo adduser librenms --disabled-password --home /home/librenms --no-create-home --gecos ''```


hide user librenms from login screen by locking the password
```sudo passwd -l librenms```

acpi needs to be installed on host for monitoring of battery-stats
```sudo apt -y install acpi```


docker image of librenms was altered:
- Dockerfile based on librenms/librenms:latest is used
- openssh, sshpass and expect are installed
- docker-compose is changed to use image from local dockerfile

custom monitor-plugins were created:
- check_PrinterSNMP to query specified OIDs (hardcoded).
- Hostname (-H) is specified in librenms by "Remote Host".
- Version (-v) and community (-c) must be specified.
```check_PrinterSNMP -H 192.168.1.190 -v 2c -c public```

- check_BatteryState to get infos of battery.
- Script works with SSH, needs to be enabled on Host.
- Hostname (-H) is specified in librenms by "Remote Host".
- Password (-P) and Username (-U) must be specified.
```check_BatteryState -H 192.168.1.2 -P Password -U Username```
