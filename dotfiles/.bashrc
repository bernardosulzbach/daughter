#!/usr/bin/env bash

export EDITOR=/usr/bin/vim

export HISTSIZE=-1
export HISTFILESIZE=-1

PATH="$PATH:$HOME/.local/bin"
PATH="$PATH:$HOME/.cargo/bin"
PATH="$PATH:$HOME/code/computer-manager"
PATH="$PATH:$HOME/code/computer-manager"
PATH="$PATH:$HOME/code/computer-manager/cloc"
PATH="$PATH:$HOME/code/computer-manager/executables"
PATH="$PATH:$HOME/code/computer-manager/scripts"
PATH="$PATH:$HOME/code/computer-manager/maven/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Add powerline.
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bash/powerline.sh

# Define my aliases and functions.
evaluate() {
	if [[ $# -ne 1 ]]; then
		echo "Evaluate expects a single argument."
		return 1
	fi
	python3 -c "from math import *; print($1)"
}

make-and-enter() {
	mkdir "$1" && cd "$1"
}

copy-to-clipboard() {
	cat "$1" | xclip -sel clipboard
}

copy-solution-to-clipboard() {
    # When you see the first "class Solution", start a block of commands:
    #   p     - print the line
    #   :loop - set a label named loop
    #   n     - get the next line
    #   p     - print the line
    #   /};/q - if the line matches /};/ then exit
    #   b     - jump to loop
    # Heavily inspired by https://stackoverflow.com/a/20943542/3271844
    cat "$1" | sed -n "/class Solution/{p; :loop n; p; /^};$/q; b loop}" | xclip -sel clipboard
}

open-watchlist-pages() {
	cd ~/code/wikipedia-scripts && python3 open-watchlist-pages.py "$1" && cd "$OLDPWD"
}

alias computer-manager='python3 ~/code/computer-manager/manager.py'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bernardo/google-cloud-sdk/path.bash.inc' ]; then . '/home/bernardo/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bernardo/google-cloud-sdk/completion.bash.inc' ]; then . '/home/bernardo/google-cloud-sdk/completion.bash.inc'; fi

# Add .NET Core SDK tools
export PATH="$PATH:/home/bernardo/.dotnet/tools"
