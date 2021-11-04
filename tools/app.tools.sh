bash_aliases() {
  if [[ "$1" = 'enable' &&  -f $ALIASES_DIR/available/$2.aliases.sh ]];
  then
    ln -s $ALIASES_DIR/available/$2.aliases.sh $ALIASES_DIR/enabled/$2.aliases.sh; source $ABASH_DIR/app.bash
  elif [[ "$1" = 'disable' &&  -f $ALIASES_DIR/enabled/$2.aliases.sh ]];
  then
   rm $ALIASES_DIR/enabled/$2.aliases.sh; source $HOME/.bashrc
    ln -s $PLUGINS_DIR/available/$2.aliases.sh $PLUGINS_DIR/enabled/$2.aliases.sh; source $ABASH_DIR/app.bash
  else
    echo "$2 not found in available $1"
  fi
}

bash_plugin() {
  if [[ "$1" = 'enable' &&  -f $PLUGINS_DIR/available/$2.plugin.sh ]];
  then
    ln -s $PLUGINS_DIR/available/$2.plugin.sh $PLUGINS_DIR/enabled/$2.plugin.sh; source $ABASH_DIR/app.bash
  elif [[ "$1" = 'disable' &&  -f $PLUGINS_DIR/enabled/$2.plugin.sh ]];
  then
    rm $PLUGINS_DIR/enabled/$2.plugin.sh; source $HOME/.bashrc
  else
    echo "$2 not found in enabled $1"
  fi
}

canUseColor() {
  # Set colorful PS1 only on colorful terminals.
  # dircolors --print-database uses its own built-in database
  # instead of using /etc/DIR_COLORS.  Try to use the external file
  # first to take advantage of user additions.  Use internal bash
  # globbing instead of external grep binary.
  safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
  match_lhs=""

  [[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
  [[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
  [[ -z ${match_lhs}    ]] \
    && type -P dircolors >/dev/null \
    && match_lhs=$(dircolors --print-database)

  if [[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]];
  then
    return true
  else
    return false
  fi
}
