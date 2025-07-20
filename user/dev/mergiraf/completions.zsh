#compdef mergiraf

autoload -U is-at-least

_mergiraf() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_mergiraf_commands" \
"*::: :->mergiraf" \
&& ret=0
    case $state in
    (mergiraf)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:mergiraf-command-$line[1]:"
        case $line[1] in
            (merge)
_arguments "${_arguments_options[@]}" : \
'-d+[Write debug files to a particular directory to analyze the internal aspects of the merge]:DEBUG_DIR:_files' \
'--debug=[Write debug files to a particular directory to analyze the internal aspects of the merge]:DEBUG_DIR:_files' \
'-c+[Display compact conflicts, breaking down lines]' \
'--compact=[Display compact conflicts, breaking down lines]' \
'-l+[Length of conflict markers]:CONFLICT_MARKER_SIZE:_default' \
'--conflict-marker-size=[Length of conflict markers]:CONFLICT_MARKER_SIZE:_default' \
'-L+[Override automatic language detection]:LANGUAGE:_default' \
'--language=[Override automatic language detection]:LANGUAGE:_default' \
'(-g --git)-o+[The path to the file to write the merge result to]:OUTPUT:_files' \
'(-g --git)--output=[The path to the file to write the merge result to]:OUTPUT:_files' \
'-p+[Final path in which the merged result will be stored. It is used to detect the language of the files using the file extension]:PATH_NAME:_files' \
'--path-name=[Final path in which the merged result will be stored. It is used to detect the language of the files using the file extension]:PATH_NAME:_files' \
'-s+[Name to use for the base revision in conflict markers]:BASE_NAME:_default' \
'--base-name=[Name to use for the base revision in conflict markers]:BASE_NAME:_default' \
'-x+[Name to use for the left revision in conflict markers]:LEFT_NAME:_default' \
'--left-name=[Name to use for the left revision in conflict markers]:LEFT_NAME:_default' \
'-y+[Name to use for the right revision in conflict markers]:RIGHT_NAME:_default' \
'--right-name=[Name to use for the right revision in conflict markers]:RIGHT_NAME:_default' \
'-t+[Maximum number of milliseconds to try doing the merging for, after which we fall back on git'\''s own algorithm. Set to 0 to disable this limit]:TIMEOUT:_default' \
'--timeout=[Maximum number of milliseconds to try doing the merging for, after which we fall back on git'\''s own algorithm. Set to 0 to disable this limit]:TIMEOUT:_default' \
'--fast[Only attempt to merge the files by solving textual conflicts, without doing a full structured merge from the ground up]' \
'-g[Behave as a git merge driver\: overwrite the left revision]' \
'--git[Behave as a git merge driver\: overwrite the left revision]' \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':base -- Path to the file containing the base revision:_files' \
':left -- Path to the file containing the left revision:_files' \
':right -- Path to the file containing the right revision:_files' \
&& ret=0
;;
(solve)
_arguments "${_arguments_options[@]}" : \
'-d+[Write debug files to a particular directory to analyze the internal aspects of the merge]:DEBUG_DIR:_files' \
'--debug=[Write debug files to a particular directory to analyze the internal aspects of the merge]:DEBUG_DIR:_files' \
'-c+[Display compact conflicts, breaking down lines]' \
'--compact=[Display compact conflicts, breaking down lines]' \
'-l+[Length of conflict markers]:CONFLICT_MARKER_SIZE:_default' \
'--conflict-marker-size=[Length of conflict markers]:CONFLICT_MARKER_SIZE:_default' \
'-L+[Override automatic language detection]:LANGUAGE:_default' \
'--language=[Override automatic language detection]:LANGUAGE:_default' \
'(-p --stdout)--keep-backup=[Create a copy of the original file by adding the \`.orig\` suffix to it]' \
'-p[Keep file untouched and show the results of resolution on standard output instead]' \
'--stdout[Keep file untouched and show the results of resolution on standard output instead]' \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':conflicts -- Path to the file containing merge conflicts:_files' \
&& ret=0
;;
(review)
_arguments "${_arguments_options[@]}" : \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':merge_id -- Identifier of the merge case:_default' \
&& ret=0
;;
(report)
_arguments "${_arguments_options[@]}" : \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':merge_id_or_file -- Identifier of the merge case (if it did not return conflicts) or path to file with merge conflicts:_default' \
&& ret=0
;;
(languages)
_arguments "${_arguments_options[@]}" : \
'--gitattributes[Print the list in a format suitable for inclusion in gitattributes]' \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
'--shell=[Shell to create completions for]:SHELL:(bash elvish fish powershell zsh)' \
'-v[Verbosity]' \
'--verbose[Verbosity]' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_mergiraf__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:mergiraf-help-command-$line[1]:"
        case $line[1] in
            (merge)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(solve)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(review)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(report)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(languages)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completions)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_mergiraf_commands] )) ||
_mergiraf_commands() {
    local commands; commands=(
'merge:Do a three-way merge' \
'solve:Solve the conflicts in a merged file' \
'review:Review the resolution of a merge by showing the differences with a line-based merge' \
'report:Create a bug report for a bad merge' \
'languages:Show the supported languages' \
'completions:Create shell completions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'mergiraf commands' commands "$@"
}
(( $+functions[_mergiraf__completions_commands] )) ||
_mergiraf__completions_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf completions commands' commands "$@"
}
(( $+functions[_mergiraf__help_commands] )) ||
_mergiraf__help_commands() {
    local commands; commands=(
'merge:Do a three-way merge' \
'solve:Solve the conflicts in a merged file' \
'review:Review the resolution of a merge by showing the differences with a line-based merge' \
'report:Create a bug report for a bad merge' \
'languages:Show the supported languages' \
'completions:Create shell completions' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'mergiraf help commands' commands "$@"
}
(( $+functions[_mergiraf__help__completions_commands] )) ||
_mergiraf__help__completions_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help completions commands' commands "$@"
}
(( $+functions[_mergiraf__help__help_commands] )) ||
_mergiraf__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help help commands' commands "$@"
}
(( $+functions[_mergiraf__help__languages_commands] )) ||
_mergiraf__help__languages_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help languages commands' commands "$@"
}
(( $+functions[_mergiraf__help__merge_commands] )) ||
_mergiraf__help__merge_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help merge commands' commands "$@"
}
(( $+functions[_mergiraf__help__report_commands] )) ||
_mergiraf__help__report_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help report commands' commands "$@"
}
(( $+functions[_mergiraf__help__review_commands] )) ||
_mergiraf__help__review_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help review commands' commands "$@"
}
(( $+functions[_mergiraf__help__solve_commands] )) ||
_mergiraf__help__solve_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf help solve commands' commands "$@"
}
(( $+functions[_mergiraf__languages_commands] )) ||
_mergiraf__languages_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf languages commands' commands "$@"
}
(( $+functions[_mergiraf__merge_commands] )) ||
_mergiraf__merge_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf merge commands' commands "$@"
}
(( $+functions[_mergiraf__report_commands] )) ||
_mergiraf__report_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf report commands' commands "$@"
}
(( $+functions[_mergiraf__review_commands] )) ||
_mergiraf__review_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf review commands' commands "$@"
}
(( $+functions[_mergiraf__solve_commands] )) ||
_mergiraf__solve_commands() {
    local commands; commands=()
    _describe -t commands 'mergiraf solve commands' commands "$@"
}

if [ "$funcstack[1]" = "_mergiraf" ]; then
    _mergiraf "$@"
else
    compdef _mergiraf mergiraf
fi
