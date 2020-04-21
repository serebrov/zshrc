if [[ ! -d ~/.zsh/antigen ]]
then
  # Install package manager.
  # It keeps the installed packages under ~/.antigen
  git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen
fi
source ~/.zsh/antigen/antigen.zsh

# For brew
export PATH="/usr/local/bin:/usr/local/sbin:~/bin:$PATH"

# Zsh tips / usage
#
# Mass renaming: 
#     zmv (*).txt $1.html
#
# Path replacement:
#    /usr/bin $ cd bin lib
#    /usr/lib $ # we've replaced bin with lib in the current path
#
# Globbing: 
#    $ ls **/*.cpp # Recursively search and list CPP files.
#    $ wc **/*.md # Count words in markdown files.

# Summary of features / shortcuts from the setup below:
#
# - syntax highlighing
# - fish-like auto suggestions (complete with -> or End)
# - cpv - cp with progress (via rsync) (cp)
# - z dirname - jump to recently used directory
# - ctrg-g - fuzzy 'z' (fzf-z)
# - ctrl-p - search and edit file (zsh-fuzzy-search-and-edit)
# - cd ..(tab) - fuzzy completion for dir name (zsh-interactive-cd)
# - open files directly with ./filename (auto-do some kungfoo setup)
# - interactive git tools (ga, glo, gi, gd, grh, gcf, gss, gclean) (forgit)
# - some git aliases (gst, gpoh, glog)
# - ctrl-r to search shell history with fzf
# - l, la, lr, lt, ll, ldot, lS, lart, lrt (common aliases for ls)
# - vc - run vim in file manager mode
# - ctrl-z to put an app back forground (after putting it to background with ctrl-z)
# - mirror - run mplayer in "mirror" mode (show webcam picture)
# - fzf functions:
#   - cf - fuzzy cd from anywhere
#   - fshow - git commit browser
#   - fco - checkout git branch with fzf
#   - fcoc - checkout commit with fzf
#   - fcs - get commit sha
#   - fstash - git stash browser (ctrl-d show diff, ctrl-b checkout stash as branch)
# - fuck to correct command error after typo (thefuck)
# - codi to start vim codi extension
# - sd 25 - show calendar with 25th of each month highlighted


# To update bundles, use `antigen update`.
# Bundles are under `~/.antigen`.
#
# Note: antigen uses cache, after adding new plugins, run
#   `anigen reset`
# otherwise the new plugins might not be loaded in the new shell session
# (and manual source ~/.zshrc may be needed).

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle git-prompt
antigen bundle vi-mode
antigen bundle last-working-dir
antigen bundle ssh-agent
antigen bundle colored-man
antigen bundle common-alias
# cp - add cpv command (runs rsync with progress)
antigen bundle cp
antigen bundle pip
antigen bundle z
antigen bundle history-substring-search
# dotenv - Automatically load your project ENV variables from `.env` file when you `cd` into project root directory.
# antigen bundle dotenv
# antigen bundle tmux
# If the command is not found, but present in repositories, it
# will show extended info on how to install it.
antigen bundle command-not-found

# Syntax highlighting bundle, for example, highlight wrong command names in red.
antigen bundle zsh-users/zsh-syntax-highlighting

# Fish-like auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# npm autocompletion
antigen bundle akoenig/npm-run.plugin.zsh

# alias tips: show a tip when the command run has an alias
antigen bundle djui/alias-tips

# run fzf for cd
antigen bundle changyuheng/zsh-interactive-cd

# extension for z - ctrl-g or fzfz to run fzf-ed version of z
antigen bundle andrewferrier/fzf-z

# search for file and edit it with ctrl+p
antigen bundle mafredri/zsh-async
antigen bundle seletskiy/zsh-fuzzy-search-and-edit

antigen bundle sobolevn/wakatime-zsh-plugin

# interactive git tools:
# ga - git add selector
# glo - log viewer
# gi - git ignore generator
# gd - diff viewer
# grh - git reset HEAD <file> selector
# gcf - git checkout <file> selector
# gss - git stash viewer
# gclean - git clean selector
#
# Default keybindings:
#   Enter 	Confirm
#   Tab 	Toggle mark
#   ? 	Toggle preview window
#   Alt - W 	Toggle preview wrap
#   Ctrl - S 	Toggle sort
#   Ctrl - R 	Toggle selection
#   Ctrl - K / P 	Selection move up
#   Ctrl - J / N 	Selection move down
#   Alt - K / P 	Preview move up
#   Alt - J / N 	Preview move down
antigen bundle wfxr/forgit

# show execution time for long commands (>= 3 sec)
antigen bundle popstas/zsh-command-time

# Load the theme.
# antigen theme prose

# Tell Antigen that you're done.
antigen apply

# for seletskiy/zsh-fuzzy-search-and-edit
# search for file and edit it with ctrl+p
export EDITOR=nvim
bindkey '^P' fuzzy-search-and-edit

# Disable bracketed paste to for emacs shell.
if [[ $TERM = dumb ]]; then
    unset zle_bracketed_paste
fi

# Use theme from file.
source $HOME/.zsh/themes/prose.zsh-theme

# no lag on normal / insert mode switch
# see http://dougblack.io/words/zsh-vi-mode.html
export KEYTIMEOUT=1

# z plugin - jump to most recent matching dir
# z foo         cd to most frecent dir matching foo
# z foo bar     cd to most frecent dir matching foo and bar
# z -r foo      cd to highest ranked dir matching foo
# z -t foo      cd to most recently accessed dir matching foo
# z -l foo      list all dirs matching foo (by frecency)

# common aliases (common-aliases plugin)
# ls, the common ones I use a lot shortened for rapid fire usage
# alias l='ls -lFh'     # size,show type,human readable
#                       Show type: / - dir, @ - symlink, * - exec, | - FIFO, = - socket, > - door.
#                       See: https://en.wikipedia.org/wiki/Unix_file_types
# alias la='ls -lAFh'   # long list,show almost all,show type,human readable
#                       # almost all - no `.` and `..`
# alias lr='ls -tRFh'   # sorted by date,recursive,show type,human readable
# alias lt='ls -ltFh'   # long list,sorted by date,show type,human readable
# alias ll='ls -l'      # long list
alias ll='ls -lAhp'    #long list, all, human, show type, add / for dirs
# alias ldot='ls -ld .*'
# alias lS='ls -1FSsh'
# alias lart='ls -1Fcart'
# alias lrt='ls -1Fcrt'

# alias zshrc='vim ~/.zshrc' # Quick access to the ~/.zshrc file

# alias grep='grep --color'
# alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# alias t='tail -f'

# # because typing 'cd' is A LOT of work!!
# alias ..='cd ../'
# alias ...='cd ../../'
# alias ....='cd ../../../'
# alias .....='cd ../../../../'

# # Command line head / tail shortcuts
# alias -g H='| head'
# alias -g T='| tail'
# alias -g G='| grep'
# alias -g L="| less"
# alias -g M="| most"
# alias -g LL="2>&1 | less"
# alias -g CA="2>&1 | cat -A"
# alias -g NE="2> /dev/null"
# alias -g NUL="> /dev/null 2>&1"
# alias -g P="2>&1| pygmentize -l pytb"

# alias dud='du -d 1 -h'
# alias duf='du -sh *'
# alias fd='find . -type d -name'
# alias ff='find . -type f -name'

# alias h='history'
# alias hgrep="fc -El 0 | grep"
# alias help='man'
# alias p='ps -f'
# alias sortnr='sort -n -r'
# alias unexport='unset'

# alias whereami=display_info

# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'

# Redefine ls aliases to exa
# https://the.exa.website/, https://github.com/ogham/exa
# alias ls='exa'                                                         # ls
# alias l='exa -lbF --git'                                               # list, size, type, git
# alias ll='exa -lbGF --git'                                             # long list
# alias llm='exa -lbGF --git --sort=modified'                            # long list, modified date sort
# alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
# alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
# 
# # speciality views
# alias lS='exa -1'			                                                  # one column, just names
# alias lt='exa --tree --level=2'                                         # tree

# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if [ ${ZSH_VERSION//\./} -ge 420 ]; then
    # note: 'alias -s' defines suffix alias to open the specified app for the file suffix 
    # open browser on urls
    _browser_fts=(htm html de org net com at cx nl se dk dk php)
    for ft in $_browser_fts ; do alias -s $ft=$BROWSER ; done

    _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex js ts py vue)
    for ft in $_editor_fts ; do alias -s $ft=$EDITOR ; done

    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts ; do alias -s $ft=$XIVIEWER; done

    _media_fts=(ape avi flv mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
    for ft in $_media_fts ; do alias -s $ft=mplayer ; done

    # read documents
    alias -s pdf=acroread
    alias -s ps=gv
    alias -s dvi=xdvi
    alias -s chm=xchm
    alias -s djvu=djview

    #list whats inside packed file
    alias -s zip="unzip -l"
    alias -s rar="unrar l"
    alias -s tar="tar tf"
    alias -s tar.gz="echo "
    alias -s ace="unace l"
fi


### git aliases (git plugin)
# g='git'
#
# ga='git add'
# gaa='git add --all'
# gapa='git add --patch'
# gau='git add --update'
#
# gst='git status'
# gl='git pull'
# gco='git checkout'
# gcm='git checkout master'
# gb='git branch'
# ga='git add'
#
# gup='git fetch && git rebase'
# gp='git push'
# gc='git commit -v'
# gca='git commit -v -a'
# gba='git branch -a'
# gcount='git shortlog -sn'
# gcp='git cherry-pick'
# glg='git log --stat --max-count=5'
# glgg='git log --graph --max-count=5'
# gss='git status -s'
# gm='git merge'
# grh='git reset HEAD'
# grhh='git reset HEAD --hard'
# ggpull='git pull origin $(current_branch)'
# ggpush='git push origin $(current_branch)'
# ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
alias -g puc='phpunit --colors'
alias -g gst='git status --short --branch'
alias gpoh='git push -u origin HEAD'
# View abbreviated SHA, description, history graph, time and author
alias glog='git log --color --graph --date=iso --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ci) %C(bold blue)<%an>%Creset" --abbrev-commit --'

# Ctrl-R to start incremental history search
bindkey "^R" history-incremental-search-backward

# Note: 'history' command is mapped to 'fc -l 1'
# this makes it not possible to pass in additional cmd keys,
# for example `history -i` results in error
# See: https://github.com/robbyrussell/oh-my-zsh/issues/739
# The workaround is to run in manually (the -i key displays timestamps for history items):
# fc -i -l 1

# Replaced with history-substring-search plugin
# http://unix.stackexchange.com/questions/16101/zsh-search-history-on-up-and-down-keys
# up-line-or-search-prefix () {
#   local CURSOR_before_search=$CURSOR
#   zle up-line-or-search "$LBUFFER"
#   CURSOR=$CURSOR_before_search
# }
# zle -N up-line-or-search-prefix
# down-line-or-search-prefix () {
#   local CURSOR_before_search=$CURSOR
#   zle down-line-or-search "$LBUFFER"
#   CURSOR=$CURSOR_before_search
# }
# zle -N down-line-or-search-prefix
## bindkey '^[[A' up-line-or-search-prefix
## bindkey '^[[B' down-line-or-search-prefix

# http://stackoverflow.com/questions/8343166/filemanager-for-vim
vc ()
{
    local TARGET='';

    [ -z "$@" ] && TARGET=. || TARGET="$@";
    vim \
    -c "set cursorline" \
    -c vsplit \
    -c "normal gh" \
    -c "let &titlestring=\"netrw\"" \
    -c "set acd" "$TARGET";

    return 0
}

# http://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/
# Ctrl-Z from vim to switch to sh and Ctrl-Z to go back
fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    fg
    zle redisplay
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

# https://twitter.com/climagic/status/551435572490010624
# same can be done using VLC => vlc v4l2:///dev/video0
# Use your webcam and mplayer as a mirror with this function.
mirror(){ mplayer -vf mirror -v tv:// -tv device=/dev/video0:driver=v4l2; }

# added by travis gem
[ -f /home/seb/.travis/travis.sh ] && source /home/seb/.travis/travis.sh
# gvm
#[[ -s "/home/seb/.gvm/scripts/gvm" ]] && source "/home/seb/.gvm/scripts/gvm"

# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/web
# [ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh

#export NVIM_TUI_ENABLE_TRUE_COLOR=1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -l -g ""'

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
  local file

  file="$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1)"

  if [[ -n $file ]]
  then
     if [[ -d $file ]]
     then
        cd -- $file
     else
        cd -- ${file:h}
     fi
  fi
}

# with ag - respects .agignore and .gitignore
alias ag_fzf='ag --nobreak --nonumbers --noheading . | fzf'

# http://junegunn.kr/2015/03/browsing-git-commits-with-fzf/
# fshow - git commit browser (enter for show, ctrl-s toggles sort)
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
# Note: fixes from here https://www.reddit.com/r/zsh/comments/5ogkbt/fzf_help/
fstash() {
  emulate -L sh  # fix
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    # mapfile -t out <<< "$out"  # fix
    out=( "${(@f)out}" )  # fix
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# like normal z when used with arguments but displays an fzf prompt when used without
unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf-tmux +s --tac --query "$*" | sed 's/^[0-9,.]* *//')"
}

# Node version manager, install from
# https://github.com/creationix/nvm/blob/master/README.md
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
# [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Fix for scrolling issue in neovim, 
# see https://github.com/neovim/neovim/issues/6802
export COLORTERM=gnome-terminal

# vim as man pager
# export MANPAGER="env MAN_PN=1 vim -M +MANPAGER -"

# Codi - vim plugin
# See: https://github.com/metakirby5/codi.vim
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# Sharing a tiny bash function I'd written, to look up day for a date. 
# Find it useful.
# https://twitter.com/curioman2/status/1021427844050649089/photo/1
# For example: sd 25 - highligh all 25th in every month
sd ()
{
 cal -y | GREP_COLORS="mt=07;32" \grep --color=always -EC 4 " $1 |^$1 " | GREP_COLORS="sl=11;33:mt=07;33" \grep --color=always -B2 -A6 '[A-Z][a-z] '
}

# for GNU global
export GTAGSLABEL=pygments

# rust
export PATH="$HOME/.cargo/bin:$PATH"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval $(thefuck --alias)

export UID=$UID
export GID=$GID
