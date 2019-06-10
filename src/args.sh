
PARAM_TITLEPREFIX=
PARAM_PREFIX=
PARAM_INDENT=
PARAM_BEFORE=
PARAM_AFTER=
PARAM_FILES=(:)

ticat:args:parse() {
    local argdef=(
        "s:PARAM_TITLEPREFIX:-t"
        "s:PARAM_PREFIX:-p"
        "b:PARAM_INDENT:-i"
        "n:PARAM_BEFORE:-B"
        "n:PARAM_AFTER:-A"
        "b:DEBUG_mode:--debug"
    )

    args:parse argdef PARAM_FILES "$@"

    ticat:args:process_params
}

ticat:args:process_params() {
    local sed_pats=(:)
    # Separator string for sed patterns
    # To cater to most eventualities, use a non-printing byte
    local s=$'\001'

    if [[ -n "${PARAM_PREFIX:-}" ]]; then
        sed_pats+=("s$s^${s}$PARAM_PREFIX${s}")
    fi

    if [[ -n "${PARAM_INDENT:-}" ]]; then
        sed_pats+=("s$s^$s    $s")
    fi

    SED_PATTERNS="$(strings:join ' ; ' "${sed_pats[@]:1}")"

    debug:print "SED_PATTERNS='${SED_PATTERNS//$s/|}'"
}

