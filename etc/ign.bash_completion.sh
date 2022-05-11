#!/usr/bin/env bash

# ign bash completion

function _ign
{
  local prev cur cmd opts
  local ign="$1"
  cur="$2"
  prev="$3"

  # Return value
  COMPREPLY=()

  # Look for the first command that is not an option (-*)
  # COMP_WORDS: array of words in current command line COMP_LINE
  # COMP_CWORD: index of word containing current cursur location
  # COMP_LINE: line entered so far
  for ((i=1; $i<=$COMP_CWORD; i++)); do
    if [[ ${COMP_WORDS[i]} != -* ]]; then
      cmd="${COMP_WORDS[i]}"
      break
    fi
  done

  # On a word after top-level command ign. It may be an option (-*)
  if [[ "$cur" == -* ]] || [[ "$prev" != "ign" ]]; then

    # Subcommand is help
    if [[ "$cmd" == "help" ]]; then
      opts=$(ign --commands)

    # Subcommand is a library name or an option (-*)
    else
      # Complete subcommands
      # If subcommand completion function exists (defined by corresponding
      # library), call it.
      func="_gz_$cmd"
      if [[ "$(type -t $func)" == 'function' ]]; then
        $func
      else
        # Use bash default auto-complete
        COMPREPLY=($(compgen -o default -- "${COMP_WORDS[COMP_CWORD]}"))
      fi
      return
    fi

  # on first word, top-level command (ign)
  else
    opts="$(ign --commands) help"
  fi

  COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F "_ign" "ign"
