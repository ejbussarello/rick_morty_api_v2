import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty_api_v2/models/character.model.dart';

const url = "https://rickandmortyapi.com/api";

Future<Character> fetchCharacter() async {
  final response = await http.get(Uri.parse('$url/character'));

  if (response.statusCode == 200) {
    return Character.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load character');
  }
}
