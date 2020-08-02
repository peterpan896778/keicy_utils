/*
 * Copyright 2018, 2019, 2020 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License version 3 (LGPL-V3), as published by
 * the Free Software Foundation.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with Flutter-Sound.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'dart:io';

import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:path_provider/path_provider.dart';

class KeicyStaticFunctions {
  /// Creates an path to a temporary file.
  static Future<String> tempFile({String fileName, String ext}) async {
    if (fileName == null) {
      var uuid = Uuid();
      fileName = uuid.v4();
    }

    if (ext != null) {
      fileName += '.$ext';
    }

    var tmpDir = await getTemporaryDirectory();
    var path = join(tmpDir.path, fileName);
    var parent = dirname(path);
    Directory(parent).createSync(recursive: true);

    return path;
  }
}
