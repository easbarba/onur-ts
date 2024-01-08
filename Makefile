# Onur is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Onur is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with Onur. If not, see <https://www.gnu.org/licenses/>.

# DEPS: GNU Bash, GNU awk, fzf, podman

.DEFAULT_GOAL := tests

NAME := onur-ts
VERSION := $(shell awk '/version/ {line=substr($$2, 2,5); print line}' ./package.json)

RUNNER ?= podman
GITLAB_REGISTRY=registry.gitlab.com
ONUR_IMAGE=${GITLAB_REGISTRY}/${USER}/${NAME}:${VERSION}

.PHONY: commands
commands:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} \
		bash -c '$(shell cat ./container-commands | fzf)'

.PHONY: tests
tests:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} \
		bash -c 'bun run tests'

.PHONY: image.repl
image.repl:
	${RUNNER} run --rm -it \
		--volume ${PWD}:/app:Z \
		--workdir /app \
		${ONUR_IMAGE} bash

.PHONY: image.build
image.build:
	${RUNNER} build --file ./Containerfile --tag ${ONUR_IMAGE} --env ONUR_VERSION=${VERSION}

.PHONY: image.publish
image.publish:
	${RUNNER} push ${ONUR_IMAGE}
