# onur-js is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# onur-js is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with onur-js. If not, see <https://www.gnu.org/licenses/>.

FROM oven/bun:1 AS base
WORKDIR /deps
COPY package.json bun.lockb .
RUN bun install --frozen-lockfile

FROM base
MAINTAINER EAS Barbosa <easbarba@outlook.com>
WORKDIR /app
COPY --from=base /deps/node_modules node_modules
COPY . .
CMD ["bun", "run", "test:unit"]
