#!/usr/bin/env bash
#
# Copyright (C) 2022 Open Source Robotics Foundation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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

source @CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_DATAROOTDIR@/gz/gz@PROJECT_MAJOR_VERSION@.completion

complete -F "_ign" "ign"
