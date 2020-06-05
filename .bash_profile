export PATH_WORKSPACE="${HOME}/Documents/workspace"

export PATH_DART="${HOME}/.pub-cache/bin"
export PATH_TOOLS="${PATH_WORKSPACE}/tools"
export PATH_FLUTTER="${PATH_TOOLS}/flutter/bin"

export PATH="${PATH}:${PATH_DART}:${PATH_TOOLS}"

export GOPATH="${HOME}/go"
export GRAILS_HOME="${PATH_TOOLS}/grails-4.0.0"
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"

nvm use 10.16.3

alias docker_rm_all='docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q)'
alias serve_dir='python -m SimpleHTTPServer 5555'
alias shrug='echo "¯\_(ツ)_/¯" | pbcopy'
alias work="cd ${PATH_WORKSPACE}"

echo "--- aliases ---" && alias | sed 's/^\(.*\)=.*$/\1/'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('${HOME}/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "${HOME}/miniconda3/etc/profile.d/conda.sh" ]; then
        . "${HOME}/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="${HOME}/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

