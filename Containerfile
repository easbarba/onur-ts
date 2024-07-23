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

FROM docker.io/oven/bun:1 AS base
WORKDIR /deps

FROM base AS install
COPY package.json bun.lockb .
RUN bun install --frozen-lockfile

FROM base
MAINTAINER EAS Barbosa <easbarba@outlook.com>
LABEL version=$ONUR_VERSION
LABEL description="Easily manage multiple FLOSS repositories."

ENV USERNAME easbarba
ENV APP_HOME /home/$USERNAME/app
WORKDIR $APP_HOME

RUN groupadd -r $USERNAME && useradd -r -g $USERNAME -d /home/$USERNAME -m -s /bin/bash $USERNAME
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

COPY --from=install /deps/node_modules node_modules
COPY . .
RUN ./prepare.bash

CMD [ "bun", "run", "tests" ]
