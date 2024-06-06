import 'package:flutter/material.dart';
import 'package:rick_morty_api_v2/models/character.model.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({
    super.key,
    required this.characters,
    required this.index,
  });

  final Character characters;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(100), bottomLeft: Radius.circular(100))),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.width * 0.3,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 140,
                  height: 150,
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(characters.results[index].image),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        characters.results[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.place_outlined,
                            size: 20,
                            color: Colors.purple[800],
                          ),
                          const SizedBox(width: 5),
                          Text(characters.results[index].location.name),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            characters.results[index].status,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(" - "),
                          Text(
                            characters.results[index].species,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: characters.results[index].status == "Alive"
                              ? Colors.green
                              : Colors.grey,
                          //color: Colors.green,
                          borderRadius: BorderRadius.circular(50)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
