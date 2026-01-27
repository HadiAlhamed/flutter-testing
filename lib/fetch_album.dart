import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  // Simulate a network delay
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums/1'),
  );
  if (response.statusCode == 200) {
    return Album.fromJson(
      Map<String, dynamic>.from(jsonDecode(response.body) as Map),
    );
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
  @override
  String toString() => 'Album(userId: $userId, id: $id, title: $title)';
}
