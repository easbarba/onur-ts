<!--
Onur-Js is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Onur-Js is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Onur-Js. If not, see <https://www.gnu.org/licenses/>.
-->

# Onur

Easily manage multiple FLOSS repositories.

[go](https://github.com/easbarba/onur-js-go) - [rust](https://github.com/easbarba/onur-js-rust) - [python](https://github.com/easbarba/onur-js-python) - [php](https://github.com/easbarba/onur-js-php) - [java](https://github.com/easbarba/onur-js-java) 

## USAGE

`Onur` consumes configuration in the following manners:

By default it looks for configuration files at `$XDG_CONFIG/onur` or in the directory set in the `$ONUR_CONFIG_HOME` environment variable.

```shell
onur grab
onur archive nuxt,awesomewm,gitignore
onur help
```

## INSTALLATION

`Onur` requires a [C99](https://gcc.gnu.org/) compiler and [Meson](https://mesonbuild.com/), then just run `make clean all`, and executable file will be placed at `$PWD/.build/onur-js`.

Tip: A clean install without messing around your system is easily achievable with [GNU Guix](https://guix.gnu.org/manual/devel/en/html_node/Invoking-guix-shell.html): `guix shell --check`.

## CONFIGURATION FILE

A `onur` single configuration file:

```json
[
  {
    "name": "awesomewm",
    "branch": "dev",
    "url": "https://github.com/awesomeWM/awesome"
  },
  {
    "name": "nuxt",
    "branch": "main",
    "url": "https://github.com/nuxt/framework"
  }
]
```

More examples of configuration files are at `examples`.

## SETTINGS

```toml
single-branch = true
quiet = true
depth = 1
```

## TODO

### High

- validation of repository links 
- actions: --filter rust
- actions: --only rust,haskel,commonlisp
- actions: --exclude rust,haskel,commonlisp
- config: branch defaults to master

### Low

- config: move on these to a syntax check class
- cli: add single configuration file option: `--json`

## LICENSE

[GNU GENERAL PUBLIC LICENSE Version 3](https://www.gnu.org/licenses/gpl-3.0.en.html)
