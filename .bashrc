export SHELL

# Source the system-wide file.
source /etc/bashrc

# Adjust the prompt depending on whether we're in 'guix environment'.
if [ -n "$GUIX_ENVIRONMENT" ]
then
    PS1='\u@\h \w [env]\$ '
else
    PS1='\u@\h \w\$ '
fi

XDG_RUNTIME_DIR=/tmp/`id -u`/
export XDG_RUNTIME_DIR
if [ ! -e ${XDG_RUNTIME_DIR} ]
then
	mkdir "${XDG_RUNTIME_DIR}"
	chmod 0700 "${XDG_RUNTIME_DIR}"
fi
# nix pkgmgr
source /run/current-system/profile/etc/profile.d/nix.sh

# don't use dconf
GSETTINGS_BACKEND=keyfile
export GSETTINGS_BACKEND

# default editor
EDITOR=vi
export EDITOR
