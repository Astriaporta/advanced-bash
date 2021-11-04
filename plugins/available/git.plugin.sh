getCurrentBranch() {
  if $(git log -n 1 2>/dev/null >/dev/null 2>&1);
  then
    echo "($(git branch --show-current))"
  fi
}
