#!/bin/sh
export PATH="/usr/sbin:$PATH"
exec /usr/sbin/lxd -d --group=lxd
