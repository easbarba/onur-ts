/*
 *  onur is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  onur is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with onur. If not, see <https://www.gnu.org/licenses/>.
 */

'use strict';

import { all } from './repository';

async function grab(): Promise<void> {
    try {
        await all().then((files) => {
            files.forEach((file) => {
                console.log(`- ${file}`);
            });
        });
    } catch (err) {
        console.error('Error list configurations: ', err);
    }
}

function backup(projects: string): void {
    console.log(`backin up: ${projects}`);
}

export { backup, grab };
