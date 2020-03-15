<div align="center">
<h1>asdf-haxe</h1>
<span><a href="https://haxe.org">Haxe</a> plugin for asdf version manager</span>
</div>
<hr />

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/asdf-community/asdf-haxe/Main%20workflow?style=flat-square)](https://github.com/asdf-community/asdf-haxe/actions)
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![License](https://img.shields.io/github/license/asdf-community/asdf-haxe?style=flat-square&color=brightgreen)](https://github.com/asdf-community/asdf-haxe/blob/master/LICENSE)

## Installation

```bash
asdf plugin-add haxe https://github.com/asdf-community/asdf-haxe.git
```

## Usage

Check [asdf](https://github.com/asdf-vm/asdf) readme for instructions on how to
install & manage versions.

#### Troubleshooting

- `@rpath/libneko.2.dylib` not being loaded by `haxelib`

Haxe executables expect Neko's dynamic libraries to be
found relative to the executable file.

An error like the following is produced:

```shell
$ haxelib
dyld: Library not loaded: @rpath/libneko.2.dylib
  Referenced from: /vic/.asdf/installs/haxe/4.0.5/bin/./haxelib
  Reason: image not found
fish: './haxelib' terminated by signal SIGABRT (Abort)
```

To fix this install a compatible NekoVM version using 
(asdf-neko)[https://github.com/asdf-community/asdf-neko] and
then execute:

```shell
asdf current haxe # should display your selected haxe version
asdf current neko # should display your selected haxe version

asdf haxe neko dylibs link # link neko dylibs

haxelib # this should work now.
```

## Contributors

Thanks goes to these wonderful people
([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://bsky.moe"><img src="https://avatars3.githubusercontent.com/u/38746192?v=4" width="100px;" alt=""/><br /><sub><b>BSKY</b></sub></a><br /><a href="https://github.com/asdf-community/asdf-haxe/commits?author=imbsky" title="Code">💻</a> <a href="https://github.com/asdf-community/asdf-haxe/commits?author=imbsky" title="Documentation">📖</a> <a href="#maintenance-imbsky" title="Maintenance">🚧</a> <a href="#infra-imbsky" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a></td>
    <td align="center"><a href="https://keybase.io/oeiuwq"><img src="https://avatars3.githubusercontent.com/u/331?v=4" width="100px;" alt=""/><br /><sub><b>Victor Borja</b></sub></a><br /><a href="https://github.com/asdf-community/asdf-haxe/commits?author=vic" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-enable -->
<!-- prettier-ignore-end -->
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the
[all-contributors](https://github.com/all-contributors/all-contributors)
specification. Contributions of any kind welcome!

## License

Licensed under the
[Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0).
