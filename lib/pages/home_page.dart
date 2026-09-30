import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import 'detail_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final String username;

  const HomePage({
    super.key,
    required this.username,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectedIndex = 0;

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

  
    final pages = [
      buildHome(),
      ProfilePage(username: widget.username),
    ];

    return Scaffold(

   
      body: pages[selectedIndex],

      // BottomNavigationBar untuk Home dan Profile.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: changePage,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Tampilan halaman Home.
  Widget buildHome() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pokemon List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView.builder(
        // Jumlah item mengikuti jumlah data Pokemon.
        itemCount: pokemonList.length,

        // Membuat setiap item Pokemon.
        itemBuilder: (context, index) {

          // Mengambil data Pokemon berdasarkan index.
          final pokemon = pokemonList[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),

            child: ListTile(

              // Gambar Pokemon.
              leading: Image.network(
                pokemon.image,
                width: 70,
                height: 70,
              ),

              // Nama Pokemon.
              title: Text(
                pokemon.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),

              // Menampilkan tipe Pokemon.
              subtitle: Text(
                pokemon.types.join(' • '),
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),

              // Ketika item diklik, buka Detail.
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PokemonDetailPage(
                      pokemon: pokemon,
                    ),
                  ),
                );

              },
            ),
          );
        },
      ),
    );
  }
}