#!/bin/sh
set -e
slate install net/openssl
slate install lib/zlib
slate install net/openssh
echo '#!/bin/sh

PIDFILE=/run/sshd.pid
SSHD=/usr/sbin/sshd

case "$1" in
    start)
        if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
            echo "sshd is already running."
            exit 0
        fi
        mkdir -p /run /var/empty
        id sshd >/dev/null 2>&1 || exit 1
        ssh-keygen -A || exit 1
        echo "Starting sshd..."
        "$SSHD" -o PidFile="$PIDFILE"
        ;;
    stop)
        if [ -f "$PIDFILE" ]; then
            echo "Stopping sshd..."
            kill "$(cat "$PIDFILE")"
            rm -f "$PIDFILE"
        else
            echo "sshd is not running."
        fi
        ;;
    restart)
        "$0" stop
        "$0" start
        ;;
    status)
        if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
            echo "sshd is running."
        else
            echo "sshd is not running."
            exit 1
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac' > /etc/init.d/sshd

chmod +x /etc/init.d/sshd
