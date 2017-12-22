#!/bin/sh
#  @author:       Deviousway
#  @description:  MIRROR DISTANT FOLDER TO LOCAL FOLDER VIA FTP
#
# FTP LOGIN
HOST='$host'
USER='$user'
PASSWORD='$password'

# DISTANT DIRECTORY
REMOTE_DIR='$REMOTE_DIR'

#LOCAL DIRECTORY
LOCAL_DIR='$LOCAL_DIR'

# RUNTIME!
echo
echo "Starting download $REMOTE_DIR from $HOST to $LOCAL_DIR"
date

lftp -u "$USER","$PASSWORD" $HOST <<EOF
# the next 3 lines put you in ftpes mode. Uncomment if you are having trouble connecting.
# set ftp:ssl-force true
# set ftp:ssl-protect-data true
# set ssl:verify-certificate no
# transfer starts now...
mirror --use-pget-n=10 $REMOTE_DIR $LOCAL_DIR;
exit
EOF
echo
echo "Transfer finished"
date
