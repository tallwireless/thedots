### Development Environment Setup
[ -f "/app/dpc_dev/developer_env.sh" ] && source /app/dpc_dev/developer_env.sh
### Path
#### Superuser Paths
# A list of hostnames that you expect to grant you sudo.
HOSTS_WITH_SUDO=( velke YellowBrick drahtlos wireless)

# Add superuser paths to PATH on machines where we have sudo
for host in $HOSTS_WITH_SUDO; do
  if [[ "$host" == "${HOST%%.*}" ]]; then
    echo "You have SUDO on this host."
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

### Dealing with SSH-AGENT
function setup-keychain {
    echo -ne "No SSH Agent...Starting SSH Agent"
    if [ ! -f ~/.keychain ]; then
        touch ~/.keychain
        chmod 600 ~/.keychain
    fi
    #Let's start up an SSH Agent and snag it's information
    ssh-agent > ~/.keychain

    #let's load the ssh-agent we just started
    . ~/.keychain
    echo "....SSH Agent Loaded"
    echo "Adding Keys..."
    #let's add some keys to it
    ssh-add
}

function check-for-running-agent {
    ps auxww | grep -v grep | grep $SSH_AGENT_PID > /dev/null
    return $?
}

if [ $SSH_AGENT_PID ]; then 
    echo "We have an SSH_AGENT_PID"
    if [ ! check-for-running-agent ]; then
        #the agent is dead; maybe start a new one?
        setup-keychain
    fi
    if [ ! check-for-running-agent ]; then
        echo "Problems with SSH agent. Please investigate."
    fi
else
    echo "We don't have an SSH_AGENT_PID"
    if [ -f ~/.keychain ]; then
        . ~/.keychain
        if [ ! check-for-running-agent ]; then
            echo "Found ~/.keychain file, but the agent seems to be dead. Restarting..."
            setup-keychain
            if [ ! check-for-running-agent ]; then
                echo "Problems with SSH agent. Please investigate."
            fi
        fi
    else
        setup-keychain
        if [ ! check-for-running-agent ]; then
            echo "Problems with SSH agent. Please investigate."
        fi
    fi
fi
