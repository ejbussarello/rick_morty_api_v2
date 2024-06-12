import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rick_morty_api_v2/models/character.model.dart';

const url = "https://rickandmortyapi.com/api";
const page = 1;

Future<Character> fetchCharacter(int page) async {
  final response = await http.get(Uri.parse('$url/character/?page=$page'));

  if (response.statusCode == 200) {
    return Character.fromMap(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load character');
  }
}
