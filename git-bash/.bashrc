### color stuff using tput

green="$(tput setaf 10)"
red="$(tput setaf 9)"
reset="$(tput sgr0)"

function gitcheck() {
  COL="${red}"
  BRANCH=$( git rev-parse --abbrev-ref HEAD 2>/dev/null )
  MOD=$(git status -s --untracked-files=no 2>/dev/null )

  if [ -z "${MOD}" ]; then
    COL="${green}"
  fi

  if [ ! -z "${BRANCH}" ] ; then
    echo -e "{\x01${COL}\x02${BRANCH}\x01${reset}\x02} "
  fi
}


### Git helpers and bindings

function h-git-fetch ()  {
  git fetch -a -p
}

function h-git-reset ()  {
  git reset origin/master --hard
}

function h-git-rebase () {
  git rebase -i origin master
}

function h-git-push ()   {
  BRANCH=$( git rev-parse --abbrev-ref HEAD 2>/dev/null )
  git push origin ${BRANCH}
}

bind -x '"\C-gf" : "h-git-fetch"'
bind -x '"\C-gr" : "h-git-reset"'
bind -x '"\C-gb" : "h-git-rebase"'
bind -x '"\C-gp" : "h-git-push"'

bind '"\C-gc":"\C-ugit commit -m \""'


export PS1='$(gitcheck)\u@\h:\w\$ '
