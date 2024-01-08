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

import fs, { promises } from 'fs';
import path from 'path';

import { onurHome } from './globals';

export async function all(): Promise<string[]> {
    let result: string[] = await promises.readdir(onurHome);

    result = result
        .filter((file) => {
            return path.extname(file).toLowerCase() === '.json';
        })
        .map((file) => {
            // adds absolute path
            return path.join(onurHome, file);
        })
        .filter((file) => fs.existsSync(file)) // filter unixistent files
        .filter((file) => fs.readFileSync(file).toString().length !== 0); // filter empty files

    return result;
}
