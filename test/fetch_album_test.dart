import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:testing/fetch_album.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("fetchAlbum success and failure ", () {
    late MockClient mockClient;
    setUp(() {
      mockClient = MockClient();
    });
    test("FetchAlbum get method called once", () {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          '{"userId": 1 , "id" : 2 , "title" : "Test Album"}',
          200,
        ),
      );
      fetchAlbum(mockClient);
      verify(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).called(1);
    });

    test('fetchAlbum returns an Album if http call was successful', () async {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer(
        (_) async =>
            http.Response('{"userId": 1, "id": 2, "title": "Test Album"}', 200),
      );
      final value = await fetchAlbum(mockClient);
      debugPrint('Fetched Album: $value');
      expect(
        value,
        isA<Album>()
            .having((album) => album.id, "id", 2)
            .having((album) => album.userId, 'user id', 1)
            .having((album) => album.title, 'album title', 'Test Album'),
      );
    });

    test('fetchAlbum throws an exception if http call failed', () async {
      when(
        mockClient.get(
          Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
        ),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(mockClient), throwsException);
    });
  });
}
