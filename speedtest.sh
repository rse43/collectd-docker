#!/bin/sh

HOSTNAME="${COLLECTD_HOSTNAME:-localhost}"
INTERVAL="${COLLECTD_INTERVAL:-1800}"

speedtest() {
	/usr/bin/speedtest-cli --simple
}

while sleep "$INTERVAL"; do
	LOG=$(speedtest)
	PING=`echo "$LOG" | egrep "^Ping:" | egrep -o "[0-9]+\.[0-9]+"`
	DOWNLOAD=`echo "$LOG" | egrep "^Download:" | egrep -o "[0-9]+\.[0-9]+"`
	UPLOAD=`echo "$LOG" | egrep "^Upload:" | egrep -o "[0-9]+\.[0-9]+"`
	if [[ ! -z "$PING" ]]; then
		echo "PUTVAL \"$HOSTNAME/exec-speedtest/gauge-ping_ms\" interval=$INTERVAL N:$PING"
	fi

	if [[ ! -z "$DOWNLOAD" ]]; then
		echo "PUTVAL \"$HOSTNAME/exec-speedtest/gauge-download_mbps\" interval=$INTERVAL N:$DOWNLOAD"
	fi

	if [[ ! -z "$UPLOAD" ]]; then
		echo "PUTVAL \"$HOSTNAME/exec-speedtest/gauge-upload_mbps\" interval=$INTERVAL N:$UPLOAD"
	fi
done