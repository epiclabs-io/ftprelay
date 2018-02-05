# FTP Relayer

Tool to share a single-user FTP account among multiple users

## How to use

### Configuration

Create a directory in the host to keep per-user configuration files, for example `/etc/ftprelay/`. This directory will have the `ftp.passwd` file and one file per user.

In `/etc/ftprelay/`, create the password file and add the first user:

```
htpasswd -cd /etc/ftprelay/ftpd.passwd user1
```

To add subsequent users:

```
htpasswd -d /etc/ftprelay/ftpd.passwd user2
```

Create one file per user in `/etc/ftprelay/`. The minimum content of this file must be the remote FTP directory where they will be allowed to work, with `/ftp` prepended:

For example: `/etc/ftprelay/user1`:

```
local_root=/ftp/testdir
```

The above will allow the user to work on the remote FTP server `testdir` directory.


### Running

```
docker run --name testftp -e FTP_USER=user -e FTP_PASSWORD=password -e FTP_HOST=ftpserver.com --privileged -p 20:20 -p 21:21 -it --rm -v $PWD/userconf.d/:/etc/vsftpd/userconf.d/ testftp
```

## Contact

Questions, comments? email Javier Peletier [jm@epiclabs.io](mailto:jm@epiclabs.io)