#!/bin/bash

SCRIPT=$(basename "$0")

function display_help {
    echo ""
    echo "${SCRIPT}"
    echo ""
    echo "<operation>"
    ##HELP##

    echo "  --suffix,-su <value> - set suffix string after each line"
    echo "  --prefix,-pr <value> - set prefix string before each line"
    echo "  --suffix-mode,-sm <value> - set suffix mode - for now java-sout,js-console-log"
    echo "  --padding,-p <value> - set padding length before and after the string"
    echo "  --length,-l <value> - set full length of frame"
    echo "  --mode,-m <value> - set predefined mode - for now bash,sql,vim"
    echo "  --fill-char,-fc <value> - set character inside the frame"
    echo "  --character,-c <value> - set character outside the frame"
    echo "  --string,-s <value> - add string to print in frame - can be multiple"
}

CHARACTER="#"
MODE="short"
LENGTH=""
PADDING=10
FILL_CHAR=" "
COMMENT=""

STRING=()
# STRING="(default text with padding: $PADDING and character: $CHARACTER)"

while [ "$1" != "" ]; do
    case $1 in 
        --string|-s)
            STRING+=("$2")
            shift
            ;;
        --character|-c)
            CHARACTER="$2"
            shift
            ;;
        --fill-char|-fc)
            FILL_CHAR="$2"
            shift
            ;;
        --mode|-m) # full, short, down, up, comment
            MODE="$2"
            shift
            ;;
        --length|-l)
            LENGTH="$2"
            shift
            ;;
        --padding|-p)
            PADDING="$2"
            shift
            ;;
        --prefix|-pr)
            PREFIX="$2"
            shift
            ;;
        --suffix|-su)
            SUFFIX="$2"
            shift
            ;;
        --suffix-mode|-sm)
            SUFFIX_MODE="$2"
            shift
            ;;
        *)
            echo "Incorrect argument passed $1"
            ##HELP_FUNCTION##
            display_help
            exit 1
    esac
    shift
done

# function calculate_length_and_padding {
    
# }

function _print_prefix {
    if [ "$PREFIX" != "" ]; then
        printf -- "$PREFIX"
    fi
}

function _print_suffix {
    if [ "$SUFFIX" != "" ]; then
        printf -- "$SUFFIX"
    fi
}

function _print_frame {
    _print_prefix
    printf "%${LENGTH}s" |tr " " "$CHARACTER"
    _print_suffix
    printf "\n" 
}

function _print_empty_row {
    _print_prefix
    printf "$CHARACTER"
    printf "%$((LENGTH-2))s"|tr " " "$FILL_CHAR"
    printf "$CHARACTER"
    _print_suffix
    printf "\n"
}

function _print_text {
    _print_prefix

    TEXT=$1
    if [ $((($LENGTH - ${#TEXT}) % 2)) -eq 1 ]; then
        TEXT="${TEXT} "
    fi

    if [ $LENGTH -lt $((${#TEXT} + 4)) ]; then
        PADDING=1
    else
        PADDING=$(((LENGTH - ${#TEXT})/2 - 1))
    fi

    printf "$CHARACTER"
    printf "%$((PADDING))s"|tr " " "$FILL_CHAR"
    printf '%s' "$TEXT"
    printf "%$((PADDING))s"|tr " " "$FILL_CHAR"
    printf "$CHARACTER"
    _print_suffix
    printf '\n'
}

function _check_predefined_suffix_modes {
    if [ "$SUFFIX_MODE" = "java-sout" ]; then
        PREFIX="System.out.println(\""
        SUFFIX="\");"
    elif [ "$SUFFIX_MODE" = "js-console-log" ]; then
        PREFIX="console.log('"
        SUFFIX="');"
    fi
}

function _check_predefined_modes {
    if [ "$MODE" = "bash" ]; then
        LENGTH=100
        CHARACTER="#"
        MODE="short"
    elif [ "$MODE" = "sql" ]; then
        LENGTH=100
        if [ "$CHARACTER" = "#" ]; then
            CHARACTER="*"
        fi
        MODE="short"
        PREFIX="-- "
    elif [ "$MODE" = "vim" ]; then
        LENGTH=100
        CHARACTER="\""
        MODE="short"
    fi
}

function _calculate_length {

    if [ "$LENGTH" = "" ]; then
        LENGTH=0
        for INDEX in "${!STRING[@]}"; do 
             TEXT=${STRING[$INDEX]}
             if [ $LENGTH -lt $((PADDING + PADDING + ${#TEXT} + 2)) ]; then
                LENGTH=$((PADDING + PADDING + ${#TEXT} + 2))
             fi
        done
    else
        for INDEX in "${!STRING[@]}"; do 
            TEXT=${STRING[$INDEX]}
            if [ $LENGTH -lt $((${#TEXT} + 4)) ]; then
                LENGTH=$((${#TEXT} + 4))
            fi
        done
    fi
}

function _frame {

    _check_predefined_modes
    _check_predefined_suffix_modes
    _calculate_length

    if [ "$MODE" = "full" ] || [ "$MODE" = "up" ] || [ "$MODE" = "short" ]; then
        _print_frame
    fi

    if [ "$MODE" = "full" ]; then
        _print_empty_row
    fi

    for INDEX in "${!STRING[@]}"; do 
         TEXT=${STRING[$INDEX]}
         _print_text "$TEXT"
    done
    # _print_text "$STRING"

    if [ "$MODE" = "full" ]; then
        _print_empty_row
    fi
    
    if [ "$MODE" = "full" ] || [ "$MODE" = "down" ] || [ "$MODE" = "short" ]; then
        _print_frame
    fi
}

if [ ${#STRING[@]} -eq 0 ]; then
     STRING+=("(default text with padding: $PADDING and character: $CHARACTER)")
fi

_frame
