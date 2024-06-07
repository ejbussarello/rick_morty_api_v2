import 'package:flutter/material.dart';
import 'package:rick_morty_api_v2/api_services/services.dart';
import 'package:rick_morty_api_v2/models/character.model.dart';
import 'package:rick_morty_api_v2/views/components/card_custom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late Future<Character> futureCharacter;

  @override
  void initState() {
    super.initState();
    futureCharacter = fetchCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_left,
              size: 40,
            ),
            tooltip: "Página anterior",
            color: Colors.lightBlue,
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_right,
                size: 40,
              ),
              tooltip: "Próxima Página",
              color: Colors.lightBlue,
            )
          ],
          title: const TextField(
            decoration: InputDecoration(
              hintText: 'Pesquise algum personagem...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(
                  color: Colors.green,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                borderSide: BorderSide(
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder<Character>(
            future: futureCharacter,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                Character characters = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemCount: characters.results.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CardCustom(
                        characters: characters,
                        index: index,
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ),
      ),
    );
  }
}
