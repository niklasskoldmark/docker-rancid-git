#!/bin/sh
#################################################################
# Setup postfix
postconf -e relayhost="$POSTFIX_RELAY_PORT_25_TCP_ADDR"
#################################################################
# Run rancid-cvs to check for configuration changes
/var/lib/rancid/bin/rancid-cvs
#################################################################
# Run rancid-run
/var/lib/rancid/bin/rancid-run