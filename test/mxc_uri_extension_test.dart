/*
 * Copyright (c) 2019 Zender & Kurtz GbR.
 *
 * Authors:
 *   Christian Pauly <krille@famedly.com>
 *   Marcel Radzio <mtrnord@famedly.com>
 *
 * This file is part of famedlysdk.
 *
 * famedlysdk is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * famedlysdk is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with famedlysdk.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:test/test.dart';
import 'package:famedlysdk/src/client.dart';
import 'package:famedlysdk/src/utils/uri_extension.dart';

import 'fake_matrix_api.dart';

void main() {
  /// All Tests related to the MxContent
  group('MxContent', () {
    test('Formatting', () async {
      var client = Client('testclient');
      client.httpClient = FakeMatrixApi();
      await client.checkServer('https://fakeserver.notexisting');
      final mxc = 'mxc://exampleserver.abc/abcdefghijklmn';
      final content = Uri.parse(mxc);
      expect(content.isScheme('mxc'), true);

      expect(content.getDownloadLink(client),
          '${client.homeserver}/_matrix/media/r0/download/exampleserver.abc/abcdefghijklmn');
      expect(content.getThumbnail(client, width: 50, height: 50),
          '${client.homeserver}/_matrix/media/r0/thumbnail/exampleserver.abc/abcdefghijklmn?width=50&height=50&method=crop');
      expect(
          content.getThumbnail(client,
              width: 50, height: 50, method: ThumbnailMethod.scale),
          '${client.homeserver}/_matrix/media/r0/thumbnail/exampleserver.abc/abcdefghijklmn?width=50&height=50&method=scale');
    });
  });
}