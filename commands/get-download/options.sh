# Generated by stubbs:add-option. Do not edit, if using stubbs.
# Created: Tue Nov 20 12:34:20 PST 2012
#
#/ usage: github:get-download [ --url <https://github.com>]  --owner <>  --repository <>  --file <> [ --output <>] 

# _rerun_options_parse_ - Parse the command arguments and set option variables.
#
#     rerun_options_parse "$@"
#
# Arguments:
#
# * the command options and their arguments
#
# Notes:
# 
# * Sets shell variables for any parsed options.
# * The "-?" help argument prints command usage and will exit 2.
# * Return 0 for successful option parse.
#
rerun_options_parse() {
    
    while [ "$#" -gt 0 ]; do
        OPT="$1"
        case "$OPT" in
            --url) rerun_option_check $# ; URL=$2 ; shift ;;
            --owner) rerun_option_check $# ; OWNER=$2 ; shift ;;
            --repository) rerun_option_check $# ; REPOSITORY=$2 ; shift ;;
            --file) rerun_option_check $# ; FILE=$2 ; shift ;;
            --output) rerun_option_check $# ; OUTPUT=$2 ; shift ;;
            # help option
            -?)
                rerun_option_usage
                exit 2
                ;;
            # end of options, just arguments left
            *)
              break
        esac
        shift
    done

    # Set defaultable options.
    [ -z "$URL" ] && URL="https://github.com"
    # Check required options are set
    [ -z "$OWNER" ] && { echo >&2 "missing required option: --owner" ; return 2 ; }
    [ -z "$REPOSITORY" ] && { echo >&2 "missing required option: --repository" ; return 2 ; }
    [ -z "$FILE" ] && { echo >&2 "missing required option: --file" ; return 2 ; }
    # If option variables are declared exportable, export them.

    #
    return 0
}


# Initialize the options variables to null.
URL=
OWNER=
REPOSITORY=
FILE=
OUTPUT=


