## Export gdb debug log

Build docker image
```
docker build . -t seg-fault-container:latest --no-cache
```

Run docker container
```
docker run -it --rm --name seg-fault-container-1 -v $(pwd)/gdblog/:/var/app/gdblog/ seg-fault-container:latest
```

## Setup for solarwinds_apm

If you need to load liboboe debug symbols, you need to put the .debug file in the same directory as liboboe. Then use gdb command read the core dump.
https://agent-binaries.cloud.solarwinds.com/index.html?prefix=apm/c-lib/
You need to find the exact version of liboboe debug file. It is located in the debug folder of each version

Steps:
```bash
gem env # go to INSTALLATION DIRECTORY
cd /var/lib/gems/3.2.0/
cd extensions/ # check what is available for the current system (e.g. either aarch64 or amd64 or other)
cd aarch64-linux-gnu/3.2.0/solarwinds_apm-6.0.2/
# example of full path: /var/lib/gems/3.2.0/extensions/aarch64-linux-gnu/3.2.0/solarwinds_apm-6.0.2

# install wget and browse https://agent-binaries.cloud.solarwinds.com/index.html?prefix=apm/c-lib/ for right version, for example:
wget https://ssp-prod-global-agent-binaries.s3.amazonaws.com/apm/c-lib/15.0.1/debug/liboboe-1.0-aarch64.so.debug
```

