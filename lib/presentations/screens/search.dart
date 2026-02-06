import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  hint: Text(
                    "Search by title, gener, actor",
                    style: TextStyle(color: Colors.grey),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              onChanged: (value) {
                setState(() {
                  print(value);

                });
              },
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    ));
  }
}
