# ign bash completion

function _ign
{
  local prev cur cmd opts
  local ign="$1"
  COMPREPLY=()
  cur="$2"
  prev="$3"

  # searching for the command
  for ((i=1; $i<=$COMP_CWORD; i++)); do
    if [[ ${COMPWORDS[i]} != -* ]]; then
      cmd="${COMP_WORDS[i]}"
      break
    fi
  done

  if [[ "$cur" == -* ]] || [[ "$prev" != "ign" ]]; then

    if [[ "$cmd" == "help" ]]; then
      opts=$(ign --commands)
    else
      COMPREPLY=($(compgen -f  -- "${COMP_WORDS[${COMP_CWORD}]}" ))
      complete -o filenames -o nospace -F "_ign" "ign"
      return
    fi

  else
    opts=$(ign --commands)
  fi

  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F "_ign" "ign"
