import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing/fetch_album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('fetchAlbum returns an Album if http call was successful', () async {
    MockClient mockClient = MockClient();

    when(
      mockClient.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
      ),
    ).thenAnswer(
      (_) async =>
          http.Response('{"userId": 1, "id": 1, "title": "Test Album"}', 200),
    );
    final value = await fetchAlbum(mockClient);
    debugPrint('Fetched Album: $value');
    expect(value, isA<Album>());
  });
}
