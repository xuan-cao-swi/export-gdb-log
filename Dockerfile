FROM ubuntu:24.04

RUN apt-get update && apt-get install -y gcc gdb

WORKDIR /var/app/
COPY . /var/app/

RUN mkdir /var/app/gdblog/
RUN gcc -g seg_fault.c -o segfault
# replace segfault with your funtion (bundle exec rake ...)
CMD gdb -ex "set logging file /var/app/gdblog/gdb.txt" -ex "set logging enabled on" -ex "set confirm off"  -ex "run" -ex "backtrace" -ex "quit" segfault