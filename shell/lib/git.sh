#!/bin/bash

is_git_repository() {
  git rev-parse &> /dev/null
  [ $? == 0 ] \
    && return 0 \
    || return 1
}

in_git_work_tree() {
  [ "$(git rev-parse --is-inside-git-dir)" == "true" ] \
    && return 1 \
    || return 0
}

get_git_repository_details() {
  local branch="$(get_git_branch_name)"
  local status="$(get_git_branch_status)"

  printf "${branch}${status}"
}

get_git_branch_name() {
  is_git_repository || return

  printf "$( git rev-parse --abbrev-ref HEAD 2> /dev/null \
    || git rev-parse --short HEAD 2> /dev/null \
    || printf "unknown" )" | tr -d "\n"
}

get_git_branch_status() {
  in_git_work_tree || return

  local remoteStatus="$(get_git_branch_remote_status)"
  local localStatus="$(get_git_branch_local_status)"

  printf "${remoteStatus}|${localStatus}"
}

get_git_branch_remote_status() {
  local remoteStatus=''
  local gitStatus="$(git status --porcelain --branch | grep '^##' | grep -o '\[.\+\]$')"
  local commitsAhead="$(printf "$gitStatus" | grep -o 'ahead [[:digit:]]\+' | grep -o '[[:digit:]]\+')"
  local commitsBehind="$(printf "$gitStatus" | grep -o 'behind [[:digit:]]\+' | grep -o '[[:digit:]]\+')"

  [ -n "$commitsAhead"  ] && remoteStatus="${remoteStatus}↑${commitsAhead}"
  [ -n "$commitsBehind" ] && remoteStatus="${remoteStatus}↓${commitsBehind}"

  printf "${remoteStatus}"
}

get_git_branch_local_status() {
  local localStatus=''
  local gitStatus="$(git diff --name-status 2>&1)"
  local stageStatus="$(git diff --staged --name-status)"
  local conflicts="$(printf "$stageStatus" | egrep -c "^U")"
  local stagedFiles="$((`printf "$stageStatus" | grep -v "^$" | wc -l` - $conflicts))"
  local unstagedFiles="$((`printf "$gitStatus" | grep -v "^$" | wc -l` - `printf "$gitStatus" | egrep -c "^U"`))"
  local untrackedFiles="$(git ls-files --others --exclude-standard $(git rev-parse --show-cdup) | wc -l)"
  local stashes="$(git stash list | wc -l)"

  [ $stashes        -gt 0 ] && localStatus="${localStatus}⚑${stashes}"
  [ $stagedFiles    -gt 0 ] && localStatus="${localStatus}•${stagedFiles}"
  [ $conflicts      -gt 0 ] && localStatus="${localStatus}×${conflicts}"
  [ $unstagedFiles  -gt 0 ] && localStatus="${localStatus}+${unstagedFiles}"
  [ $untrackedFiles -gt 0 ] && localStatus="${localStatus}…${untrackedFiles}"
  [ -z "$localStatus"     ] && localStatus="${localStatus}✔"

  printf "${localStatus}"
}
