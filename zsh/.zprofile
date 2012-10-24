### Development Environment Setup
[ -f "/app/dpc_dev/developer_env.sh" ] && source /app/dpc_dev/developer_env.sh
### Path
#### Superuser Paths
# A list of hostnames that you expect to grant you sudo.
HOSTS_WITH_SUDO=( macht savi euler wash liivuk )

# Add superuser paths to PATH on machines where we have sudo
for host in $HOSTS_WITH_SUDO; do
  if [[ "$host" == "${HOST%%.*}" ]]; then
    path=($path /usr/sbin /sbin /usr/local/sbin)
    break
  fi
done

# Best not let anyone else know where we have sudo, eh?
unset HOSTS_WITH_SUDO

#### User paths
# If path doesn't contain $HOME/bin, add it.  Be careful what you put there:
# It's earlier in the path search than any other directory!
if [ -f ~/.zprofile_local ]; then
    source ~/.zprofile_local
    PATH=$LOCALPATH:$PATH
fi
PATH=/usr/local/bin:$PATH
if [ -d ~/bin ]; then
  PATH=~/bin:$PATH
  MANPATH=~/man:$MANPATH
  INFOPATH=~/info:$INFOPATH
fi

if [ -d /opt/local/bin ]; then
  PATH=$PATH:/opt/local/bin:/opt/local/sbin
  MANPATH=$MANPATH:/opt/local/man
  INFOPATH=$INFOPATH:/opt/local/info
fi
