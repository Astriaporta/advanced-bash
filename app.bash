if [[ -z "$ABASH_DIR" ]];
then
  ABASH_DIR=$HOME/.advanced_bash
fi

if [[ -z "$ALIASES_DIR" ]];
then
  ALIASES_DIR=$ABASH_DIR/aliases
fi

if [[ -z "$PLUGINS_DIR" ]];
then
  PLUGINS_DIR=$ABASH_DIR/plugins
fi

# Add bash tools.
if [[ -d $ABASH_DIR/tools/ ]];
then
    source <(cat $ABASH_DIR/tools/*.tools.sh)
fi

# Add bash aliases.
if [[ -d $ALIASES_DIR/enabled && $(ls $ALIASES_DIR/enabled/) ]];
then
    source <(cat $ALIASES_DIR/enabled/*.aliases.sh)
fi

# Add bash plugins
if [[ -d $PLUGINS_DIR/enabled && $(ls $PLUGINS_DIR/enabled/) ]] ;
then
  source <(cat $PLUGINS_DIR/enabled/*.plugin.sh)
fi

# WIP
# CURRENT_THEME="omegazl"
#
# if [[ -f $ABASH_DIR/themes/${$CURRENT_THEME}.theme.sh ]];
# then
#   source $ABASH_DIR/themes/${$CURRENT_THEME}.theme.sh
# else
#     PS1='\u@\h \w \$ '
# fi
