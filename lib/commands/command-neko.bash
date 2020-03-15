#!/usr/bin/env bash

set -euo pipefail

HELP="
asdf haxe neko COMMAND

COMMANDS

   dylibs link   -   Link Neko's dynamic libraries on Haxe run-path.
   dylibs unlink -   Remove previously linked Neko dylibs.
   dylibs which  -   Shows the Neko version linked from current Haxe.
   dylibs help   -   Show help about why links are needed.

   help          -   Show this help
"

HELP_DYLIBS="
asdf haxe neko ln-dylibs

Link Neko's dynamic libraries on Haxe run-path.

CONTEXT.

On some platforms like Mac OS, Haxe executables targetting Neko can fail to run because they expect Neko's dynamic libraries to be relative to their executable.

For example, with \`haxelib\`:

dyld: Library not loaded: @rpath/libneko.2.dylib
  Referenced from: /vic/.asdf/installs/haxe/4.0.5/bin/./haxelib
  Reason: image not found
fish: './haxelib' terminated by signal SIGABRT (Abort)


NOTES.

This command will link the dynamic libraries of current Neko version into the currently selected version of Haxe. This means, that particular version of Haxe gets tied to the selected version of Neko.


env ASDF_NEKO_VERSION='XY' ASDF_HAXE_VERSION='AB' asdf haxe neko-dylibs-link

REFERENCES.

https://github.com/asdf-community/asdf-haxe/issues/4
https://github.com/HaxeFoundation/neko/issues/98
https://developer.apple.com/library/archive/documentation/DeveloperTools/Conceptual/DynamicLibraries/100-Articles/RunpathDependentLibraries.html

"

dylibs_link() {
  local haxe_path neko_path
  haxe_path=$(asdf where haxe)
  neko_path=$(asdf where neko)
  find "$neko_path/bin" -name "*.dylib" \
    -mindepth 1 -maxdepth 1 \
    -exec ln -sfv {} "$haxe_path/bin" \;
}

dylibs_unlink() {
  local haxe_path
  haxe_path=$(asdf where haxe)
  find "$haxe_path/bin" -type l -path "*neko*.dylib" \
    -mindepth 1 -maxdepth 1 \
    -exec rm -v {} \;
}

dylibs_which() {
  local haxe_path
  haxe_path=$(asdf where haxe)
  find "$haxe_path/bin" -type l -path "*neko*.dylib" \
    -mindepth 1 -maxdepth 1 | head -n 1 |
    xargs dirname | xargs dirname | xargs basename
}

case "$*" in
  'dylibs help')
    echo "$HELP_DYLIBS"
    exit 0
    ;;

  'dylibs link')
    dylibs_link
    ;;
  'dylibs unlink')
    dylibs_unlink
    ;;
  'dylibs which')
    dylibs_which
    ;;

  *)
    echo "$HELP"
    exit 0
    ;;
esac
