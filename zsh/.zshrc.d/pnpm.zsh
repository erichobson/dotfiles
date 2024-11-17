# !/bin/zsh

if (( $+commands[pnpm] )); then
    export PNPM_HOME="/Users/eric/Library/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac

else
    echo "pnpm not found in PATH. Please ensure it is installed."
    return -1
fi

