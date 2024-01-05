set -ex

mkdir $SRC_DIR/stage

meson setup builddir          \
    ${MESON_ARGS}             \
    --prefix=$SRC_DIR/stage   \
    -Denable_tests=false      \
    --buildtype=release

meson compile -C builddir

meson install -C builddir --no-rebuild
