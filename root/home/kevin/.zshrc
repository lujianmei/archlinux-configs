# Path to your oh-my-zsh installation.
export ZSH=/home/kevin/.oh-my-zsh
export Anaconda3=/home/kevin/Programe/anaconda3/bin
export IDEA_HOME=/home/kevin/software/develop/idea-IU-139.659.2/
export JETTY_HOME=/home/kevin/software/develop/jetty-distribution-9.3.1.v20150714/

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="muse"
#ZSH_THEME="avit"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump emacs github)

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/kevin/archlinux-config/shell/:$Anaconda3:$IDEA_HOME/bin/:$JETTY_HOME/bin/"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"



# move from .bashrc
 # Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
export QMAKESPEC=/usr/share/qt4/mkspecs/linux-g++

#export EDITOR=/usr/bin/ec
#export CHEATCOLORS=true
#RUBY=/home/kevin/.gem/ruby/2.1.0/bin



MANPATH=/usr/share/texmf-dist/doc/man:$MANPATH
export MANPATH
INFOPATH=/usr/texmf-dist/doc/info:$INFOPATH
export INFOPATH


# User specific environment and startup programs

GRADLE_HOME=/home/kevin/software/develop/android/gradle-1.12
SVN_EDITOR=/usr/bin/kwrite
REQUEST_METHOD=GET

MY_SHELL=/home/kevin/sync/mysheel
RUBY=/home/kevin/.gem/ruby/2.2.0/bin

ANDROID_HOME=/home/kevin/software/develop/android/android-sdk-linux
ANDROID_NDK_HOME=/home/kevin/software/develop/android-ndk-r10c/
ANT_HOME=/home/kevin/software/develop/apache-ant-1.9.4/

CASK=/home/kevin/.cask/bin
EDITOR=emacsclient
# JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
JAVA_HOME=/home/kevin/software/jdk-8u51-linux-x64/jdk1.8.0_51/
alias grep="/usr/bin/grep $GREP_OPTIONS"


LD_LIBRARY_PATH=/usr/local/lib
export SVN_EDITOR REQUEST_METHOD LD_LIBRARY_PATH CASK EDITOR GREP_OPTION JAVA_HOME

MAVEN=/home/kevin/software/tools/apache-maven-3.2.3/bin/
export PATH=$PATH:$GRADLE_HOME/bin:$MY_SHELL/:$MAVEN:$RUBY:$CASK:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools:$ANDROID_NDK_HOME:$ANT_HOME\bin:$JAVA_HOME\bin
export PATH=$PATH:.

unset GREP_OPTIONS

#quick cd config
alias cdfront='cd ~/workspace/javascript-frameworks/project-front-end-framework'
alias cdapp='cd ~/workspace/javascript-frameworks/project-app-front-end-framework'
alias cdnotes='cd ~/workspace/github/work-notes'
alias cdpublish='cd ~/workspace/github/publish-works'
alias cdzhoushan='cd ~/workspace/phonegap/mobileappzhoushannews'
alias cddangan='cd ~/workspace/phonegap/hangzhoudangan-mobile'
alias cdemacs='cd ~/.emacs.d/users/kevin/'
alias cdpure='cd ~/workspace/javascript-frameworks/frames/pure'


# User specific aliases and functions
alias rm='trash'
alias rl='trashlist'
alias ur='undelfile'
alias ct='cleartrash'
alias rmyes='rmyes'
alias ll='lsal'
alias myproxy='mproxy'
alias ec='memacs'
alias e='memacs_quick'


memacs(){
/bin/emacsclient -c -a "" $@ &
}
#$@可以是直接给emacs传参，如
#启动eshell: e -f eshell
memacs_quick(){
#/bin/emacs --quick $@ &
/bin/emacsclient -t -a "" $@
}
mproxy(){
/home/kevin/study-material/mysheel/mproxy.sh
}
lsal()
{
/bin/ls -al
}
rmyes()
{
/bin/rm -fr $@
}
trash()
{
 mv $@ ~/.trash/
}
trashlist()
{
 echo -e "==== Garbage Lists in ~/.trash/ ===="
 echo -e "----Usage------"
 echo -e "Use 'cleartrash' to clear all garbages in ~/.trash!!!"
 echo -e "Use 'ur' to mv the file in garbages to current dir!!!"
 ls -al ~/.trash
}
undelfile()
{
 mv -i ~/.trash/$@ ./
}
cleartrash()
{
 echo -ne "!!!Clear all garbages in ~/.trash, Sure?[y/n]"
 read confirm
 if [ $confirm == 'y' -o $confirm == 'Y' ] ;then
 /bin/rm -rf ~/.trash/*
 /bin/rm -rf ~/.trash/.* 2>/dev/null
 fi
}
alias emacs="export LC_CTYPE=zh_CN.UTF-8;emacs"

#Productivity
alias ls="ls --color=auto -al"
alias ll="ls --color -al"
alias grep='grep --color=auto'
mcd() { mkdir -p "$1"; cd "$1";}
cls() { cd "$1"; ls;}
backup() { cp "$1"{,.bak};}
md5check() { md5sum "$1" | grep "$2";}
alias makescript="fc -rnl | head -1 >"
alias genpasswd="strings /dev/urandom | grep -o '[[:alnum:]]' | head -n 30 | tr -d '\n'; echo"
alias c="clear"
alias histg="history | grep"
alias ..='cd ..'
alias ...='cd ../..'
extract() {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

#System info
alias cmount="mount | column -t"
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
sbs(){ du -b --max-depth 1 | sort -nr | perl -pe 's{([0-9]+)}{sprintf "%.1f%s", $1>=2**30? ($1/2**30, "G"): $1>=2**20? ($1/2**20, "M"): $1>=2**10? ($1/2**10, "K"): ($1, "")}e';}
alias intercept="sudo strace -ff -e trace=write -e write=1,2 -p"
alias meminfo='free -m -l -t'
#alias ps?="ps aux | grep"
alias volume="amixer get Master | sed '1,4 d' | cut -d [ -f 2 | cut -d ] -f 1"

#Funny
kernelgraph() { lsmod | perl -e 'print "digraph \"lsmod\" {";<>;while(<>){@_=split/\s+/; print "\"$_[0]\" -> \"$_\"\n" for split/,/,$_[3]}print "}"' | dot -Tpng | display -;}
alias busy="cat /dev/urandom | hexdump -C | grep 'ca fe'"

#Network
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias listen="lsof -P -i -n"
alias port='netstat -tulanp'
getlocation() { lynx -dump http://www.ip-adress.com/ip_tracer/?QRY=$1|grep address|egrep 'city|state|country'|awk '{print $3,$4,$5,$6,$7,$8}'|sed 's\ip address flag \\'|sed 's\My\\';}
alias ipinfo="curl ifconfig.me && curl ifconfig.me/host"

# Pacman - https://wiki.archlinux.org/index.php/Pacman_Tips
alias pacupg='sudo pacman -Syu'        # Synchronize with repositories before upgrading packages that are out of date on the local system.
alias pacin='sudo pacman -S'           # Install specific package(s) from the repositories
alias pacins='sudo pacman -U'          # Install specific package not from the repositories but from a file
alias pacre='sudo pacman -R'           # Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'        # Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'              # Display information about a given package in the repositories
alias pacreps='pacman -Ss'             # Search for package(s) in the repositories
alias pacloc='pacman -Qi'              # Display information about a given package in the local database
alias paclocs='pacman -Qs'             # Search for package(s) in the local database
# Additional pacman alias examples
if [[ -x `which abs` && -x `which aur` ]]; then
  alias pacupd='sudo pacman -Sy && sudo abs && sudo aur'  # Update and refresh the local package, ABS and AUR databases against repositories
elif [[ -x `which abs` ]]; then
  alias pacupd='sudo pacman -Sy && sudo abs'              # Update and refresh the local package and ABS databases against repositories
elif [[ -x `which aur` ]]; then
  alias pacupd='sudo pacman -Sy && sudo aur'              # Update and refresh the local package and AUR databases against repositories
else
  alias pacupd='sudo pacman -Sy'     # Update and refresh the local package database against repositories
fi
alias pacinsd='sudo pacman -S --asdeps'        # Install given package(s) as dependencies of another package
alias pacmir='sudo pacman -Syy'                # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

# https://bbs.archlinux.org/viewtopic.php?id=93683
paclist() {
  sudo pacman -Qei $(pacman -Qu|cut -d" " -f 1)|awk ' BEGIN {FS=":"}/^Name/{printf("\033[1;36m%s\033[1;37m", $2)}/^Description/{print $2}'
}

alias paclsorphans='sudo pacman -Qdt'
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'

pacdisowned() {
  tmp=${TMPDIR-/tmp}/pacman-disowned-$UID-$$
  db=$tmp/db
  fs=$tmp/fs

  mkdir "$tmp"
  trap  'rm -rf "$tmp"' EXIT

  pacman -Qlq | sort -u > "$db"

  find /bin /etc /lib /sbin /usr \
      ! -name lost+found \
        \( -type d -printf '%p/\n' -o -print \) | sort > "$fs"

  comm -23 "$fs" "$db"
}

pacmanallkeys() {
  # Get all keys for developers and trusted users
  curl https://www.archlinux.org/{developers,trustedusers}/ |
  awk -F\" '(/pgp.mit.edu/) {sub(/.*search=0x/,"");print $1}' |
  xargs sudo pacman-key --recv-keys
}

pacmansignkeys() {
  for key in $*; do
    sudo pacman-key --recv-keys $key
    sudo pacman-key --lsign-key $key
    printf 'trust\n3\n' | sudo gpg --homedir /etc/pacman.d/gnupg \
      --no-permission-warning --command-fd 0 --edit-key $key
  done
}
export MOZILLA_FIVE_HOME=/usr/lib/mozilla
