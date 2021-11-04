# WIP
# Set up once, and then reuse. This way it supports user overrides after the
# plugin is loaded.
typeset -AHg less_termcap

# bold & blinking mode
less_termcap[mb]=$'\e[1;32m'
less_termcap[md]=$'\e[1;32m'
less_termcap[me]=$'\e[0m'
# standout mode
less_termcap[so]=$'\e[01;33m'
less_termcap[se]=$'\e[0m'
# underlining
less_termcap[us]=$'\e[1;4;31m'
less_termcap[ue]=$'\e[0m'

function colored() {
  local -a environment

  # Convert associative array to plain array of NAME=VALUE items.
  local k v
  for k v in "${(@kv)less_termcap}"; do
    environment+=( "LESS_TERMCAP_${k}=${v}" )
  done

  # Prefer `less` whenever available, since we specifically configured
  # environment for it.
  environment+=( PAGER="${commands[less]:-$PAGER}" )

  # See ./nroff script.
  if [[ "$OSTYPE" = solaris* ]]; then
    environment+=( PATH="${__colored_man_pages_dir}:$PATH" )
  fi

  command env $environment "$@"
}
function man {
  colored $0 "$@"
}
