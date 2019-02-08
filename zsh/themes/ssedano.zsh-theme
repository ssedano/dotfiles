# My theme, optimized number of calls to git
autoload -U colors && colors

autoload -Uz vcs_info

GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[cyan]%}↑%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[red]%}↓%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_NSTAGED="%{$fg_bold[cyan]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
GIT_PROMPT_BOTH="%{$fg_bold[magenta]%}●%{$reset_color%}"
GIT_PROMPT_STASH="%{$fg_bold[blue]%}⚑%{$reset_color%}"
GIT_PROMPT_DELETE="%{$fg_bold[green]%}⚑%{$reset_color%}"
GIT_PROMPT_NDELETE="%{$fg_bold[red]%}⚑%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {
  local GIT_STATE=""
  local GIT_PROMPT_BRANCH="%B%F{green}"
  local BRANCH="$1"
  BRANCH="${BRANCH#(refs/heads/|tags/)}"

  # When merging don't bother
  if test -r .git/MERGE_HEAD; then
    GIT_PROMPT_BRANCH="%B%F{red}"
    BRANCH="($BRANCH|MERGING)"$GIT_PROMPT_MERGING
  else
    local DIFF_COM_NUMS="$(git rev-list --count --left-right origin/$BRANCH...$BRANCH 2> /dev/null)"

    typeset -a DIFF_COM
    DIFF_COM=( ${=DIFF_COM_NUMS} )

    local NUM_BEHIND=$DIFF_COM[1]
    if [ "$NUM_BEHIND" -gt 0 ]; then
      GIT_PROMPT_BRANCH="%B%F{blue}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_BEHIND$NUM_BEHIND
    fi

    local NUM_AHEAD=$DIFF_COM[2]
    if [ "$NUM_AHEAD" -gt 0 ]; then
      GIT_PROMPT_BRANCH="%B%F{blue}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_AHEAD$NUM_AHEAD
    fi
    # L is used as a padding since there is no status code L and ' A' is not the same as 'A '
    local STAT="$(git status --porcelain 2> /dev/null | cut -c 1-2 | sort | tr ' ' 'L' | uniq -c)"
    typeset -A STATE_MAP
    STATE_MAP=( ${(Oa)=STAT} )

    local NUM_ADD=$STATE_MAP[??]
    if [[ -n $NUM_ADD ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED$NUM_ADD
    fi

    ((NUM=STATE_MAP[LM] + STATE_MAP[MM]))
    if [[ "$NUM" -gt 0 ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED$NUM
    fi

    local NUM_BOTH=$STATE_MAP[UU]
    if [[ -n $NUM_BOTH ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_BOTH$NUM_BOTH
    fi

    ((NUM_SG=STATE_MAP[ML] + STATE_MAP[MM]))
    if [[ "$NUM_SG" -gt 0 ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED$NUM_SG
    fi

    local NUM_NG=$STATE_MAP[AL]
    if [[ -n $NUM_NG ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_NSTAGED$NUM_NG
    fi

    local NUM_DEL=$STATE_MAP[DL]
    if [[ -n $NUM_DEL ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_DELETE$NUM_DEL
    fi

    local NUM_NDEL=$STATE_MAP[LD]
    if [[ -n $NUM_NDEL ]]; then
      GIT_PROMPT_BRANCH="%B%F{yellow}"
      GIT_STATE=$GIT_STATE$GIT_PROMPT_NDELETE$NUM_NDEL
    fi

    if [[ -f ".git/logs/refs/stash" ]]; then
      local LIST=${=$(wc -l < ".git/logs/refs/stash")}
      if [[ "$LIST" -gt 0 ]]; then
        GIT_STATE=$GIT_STATE$GIT_PROMPT_STASH$LIST
      fi
    fi
  fi

  local PROMPT="$GIT_PROMPT_PREFIX"
  if [[ -n $GIT_STATE ]]; then
    PROMPT="$PROMPT$GIT_STATE$GIT_PROMPT_SUFFIX$GIT_PROMPT_PREFIX"
  fi
  echo "$PROMPT$GIT_PROMPT_BRANCH$BRANCH$GIT_PROMPT_SUFFIX"

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_state $git_where) "
}

setopt prompt_subst
PROMPT='[%B%F{yello}%n%{$reset_color%}@%B%F{yellow}%m %B%F{magenta}%2~ $(git_prompt_string)%{$reset_color%}%b%{$reset_color%}%% '
RPROMPT=''
