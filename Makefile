# Onur-Js is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Onur-Js is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Onur-Js. If not, see <https://www.gnu.org/licenses/>.

# DEPS: GNU Bash, GNU awk, fzf, podman

NAME := onur
VERSION := $(shell awk '/version/ {line=substr($$2, 2,5); print line}' ./package.json)
RUNNER ?= podman
BUNJS_IMAGE := oven/bun:1
ONUR_IMAGE := ${USER}/${NAME}:${VERSION}

commands:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} \
		bash -c './prepare.bash && $(shell cat ./container-commands | fzf)'

tests:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} \
		bash -c './prepare.bash && bun run tests'

repl:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} bash

build:
	${RUNNER} build --file ./Containerfile --tag ${ONUR_IMAGE}

.PHONY: commands build repl tests
.DEFAULT_GOAL := tests
