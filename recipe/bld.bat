@echo on

mkdir %SRC_DIR%\stage
if errorlevel 1 exit 1

meson setup builddir           ^
    %MESON_ARGS%               ^
    --prefix=%SRC_DIR%\stage   ^
    -Denable_tests=false       ^
    --buildtype=release
if errorlevel 1 exit 1

meson compile -C builddir
if errorlevel 1 exit 1

meson install -C builddir --no-rebuild
if errorlevel 1 exit 1
