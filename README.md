# asdf-haxe

[Haxe](https://haxe.org) plugin for asdf version manager

## Installation

```bash
asdf plugin-add haxe https://github.com/asdf-community/asdf-haxe.git
```

## Usage

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to
install & manage versions.

#### Troubleshooting

- `@rpath/libneko.2.dylib` not being loaded by `haxelib`

Haxe executables expect Neko's dynamic libraries to be found relative to the
executable file.

An error like the following is produced:

```shell
$ haxelib
dyld: Library not loaded: @rpath/libneko.2.dylib
  Referenced from: /vic/.asdf/installs/haxe/4.0.5/bin/./haxelib
  Reason: image not found
fish: './haxelib' terminated by signal SIGABRT (Abort)
```

To fix this install a compatible NekoVM version using
[asdf-neko](https://github.com/asdf-community/asdf-neko) and then execute:

```shell
asdf current haxe # should display your selected haxe version
asdf current neko # should display your selected haxe version

asdf haxe neko dylibs link # link neko dylibs

haxelib # this should work now.
```

## License

Licensed under the
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
