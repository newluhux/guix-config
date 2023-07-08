# Honor system-wide environment variables
source /etc/profile

# Merge search-paths from multiple profiles, the order matters.
eval "$(guix package --search-paths \
-p $HOME/.config/guix/current \
-p $HOME/.guix-home/profile \
-p $HOME/.guix-profile \
-p /run/current-system/profile)"

# local config
if [ -e ${HOME}/.zshrc ]
then
	source ${HOME}/.zshrc
fi

# Prepend setuid programs.
export PATH=/run/setuid-programs:$PATH
