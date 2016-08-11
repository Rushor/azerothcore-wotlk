CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_PATH/../../bash_shared/includes.sh"

AC_PATH_COMPILER="$AC_PATH_BIN/compiler"

if [ -f "$AC_PATH_COMPILER/config.sh"  ]; then
    source "$AC_PATH_COMPILER/config.sh" # should overwrite previous
fi

function azth_on_after_build() {
    # move the run engine
    cp -rvf "$AC_PATH_BIN/runners/"* "$INSTALL_PATH/bin/"
}

registerHooks "ON_AFTER_BUILD" azth_on_after_build

source "$AC_PATH_COMPILER/includes/defines.sh"

source "$AC_PATH_COMPILER/includes/functions.sh"

mkdir -p $BUILDPATH
mkdir -p $BINPATH
