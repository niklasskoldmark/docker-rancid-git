#!/bin/sh

# Replace the original rancid.conf with a file that includes all files in /root/configs which is exposed as a volume by docker
# Some mandatory settings required for the container to work are then applied
cat << 'EOF' > /etc/rancid/rancid.conf
for config in /root/configs/* ; do
  if [ -f "$config" ] ; then
    . "$config"
  fi
done

# Setup environment
TERM=network;export TERM
PATH=/usr/lib/rancid/bin:/usr/bin:/usr/sbin:/bin:.:/usr/local/bin:/usr/bin; export PATH
LC_COLLATE="POSIX"; export LC_COLLATE
umask 000
BASEDIR=/var/lib/rancid/data; export BASEDIR
TMPDIR=/var/lib/rancid/tmp; export TMPDIR
LOGDIR=/var/lib/rancid/logs; export LOGDIR
CVSROOT=$BASEDIR/CVS; export CVSROOT
RCSSYS=git; export RCSSYS
EOF


# This part is to create a world readable cloginrc (rancid doesnt like that)
# The original .cloginrc is interpreted by TCL and includes all files in /root/secrets which is exposed as a volume by docker
cat << 'EOF' > /root/.cloginrc
foreach script [glob [file join /root/secrets *]] {
  source $script
}
EOF

# Set restrictive permissions for the hidden .cloginrc
chmod 700 /root/.cloginrc
