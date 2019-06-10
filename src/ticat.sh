#!/usr/bin/env bash

### ticat [OPTIONS ...] FILES ... Usage:help
#
# -t TITLEPREFIX
#   String to prefix titles with
# 
# -p PREFIX
#   Line prefix (applied after indent)
#
# -i
#   Indent by 4 spaces
#
# -B NUM
#   Add NUM blank lines before title
#
# -A NUM
#   Add NUM blank lines after title
#
###/doc

#%include std/autohelp.sh
#%include std/args.sh
#%include std/syntax-extensions.sh
#%include std/debug.sh

#%include args.sh

$%function ticat:print_spaces(num) {
    [[ -n "$num" ]] || return 0

    for ((i=0; i<$num; i++)); do
        echo
    done
}

$%function ticat:process(filename) {
    ticat:print_spaces "${PARAM_BEFORE}"
    echo "${PARAM_TITLEPREFIX:-}$filename"
    ticat:print_spaces "${PARAM_AFTER}"

    sed "${SED_PATTERNS:-}" "$filename"
}

ticat:main() {
    autohelp:check-or-null "$@"
    ticat:args:parse "$@"

    for _file in "${PARAM_FILES[@]}"; do
        ticat:process "$_file"
    done
}

ticat:main "$@"
