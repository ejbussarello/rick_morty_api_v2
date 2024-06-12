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
  int page = 1;

  bool _isExpanded = false;
  final TextEditingController _searchController = TextEditingController();

  void _Pesquisar() {
    setState(() {
      _isExpanded = !_isExpanded;
      futureCharacter = fetchCharacter(page);
    });
  }

  @override
  void initState() {
    super.initState();
    futureCharacter = fetchCharacter(page);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: const Icon(Icons.arrow_back),
              onTap: () {
                if (page >= 2) {
                  page--;
                  fetchCharacter(page);
                  _Pesquisar();
                }
              },
            ),
            label: "Ant.",
          ),
          BottomNavigationBarItem(
              icon: GestureDetector(
                child: const Icon(Icons.arrow_forward),
                onTap: () {
                  page++;
                  fetchCharacter(page);
                  _Pesquisar();
                },
              ),
              label: "Próx."),
        ]),
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
        floatingActionButton: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: _isExpanded ? 300.0 : 56.0,
          height: 56.0,
          decoration: BoxDecoration(
            color: Colors.blue[200],
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              if (_isExpanded)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      controller: _searchController,
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              IconButton(
                icon: Icon(_isExpanded ? Icons.search : Icons.search),
                color: Colors.white,
                onPressed: () {
                  if (_isExpanded) {
                    // Recarregar a página com o filtro aplicado
                    //${_searchController.text}
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
