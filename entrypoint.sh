#!/bin/bash

echo "Connecting to remote FTP server $FTP_HOST ..."
if ! curlftpfs ${FTP_USER}:${FTP_PASSWORD}@${FTP_HOST} /ftp -o allow_other ; then
	echo "Error connecting to $FTP_HOST server"
	exit 1
fi

echo "Connected to remote FTP server"

vsftpd /etc/vsftpd/vsftpd.conf
