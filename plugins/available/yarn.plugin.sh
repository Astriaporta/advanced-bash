if [[ -z "$YARN_DIR" ]]; then
  export YARN_DIR="$HOME/.yarn" # Only for check if yarn is defined
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
