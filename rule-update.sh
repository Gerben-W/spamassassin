#!/bin/bash
set -m

while true; do
    sleep 1m
    su -s /bin/bash -c 'sa-update' debian-spamd && kill -HUP `cat /var/run/spamd.pid`
    sleep 1d
done
