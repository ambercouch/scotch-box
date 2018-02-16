#!/bin/bash
# declare STRING variable
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PUBLIC="/public"
CONTENT="/public/wp-content"
THEME="/public/wp-content/themes/ac_timber"

alias acv="cd $DIR"
alias acp="cd $DIR$PUBLIC"
alias acc="cd $DIR$CONTENT"
alias act="cd $DIR$THEME"
cd $DIR$THEME