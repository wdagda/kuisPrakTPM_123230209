import 'package:flutter/material.dart';
import 'loginpage.dart';
import '../models/listmenu.dart';
import 'orderpage.dart';
import 'FAQ.dart';

class HomePage extends StatelessWidget {
  final String username;

  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        backgroundColor: Colors.green,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text("Home Page")],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),

      body: Column(
        children: [
          Text(
            "Selamat Datang, $username !",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FAQ()),
              );
            },
            child: const Text(
              "Tekan untuk membuka FAQ",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 10),

          const Text(
            "Daftar Menu:",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: menuItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final menuItem = menuItems[index];

                return menu(
                  context,
                  menuItem.name,
                  menuItem.price,
                  "lib/assets/piring.jfif",
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget menu(BuildContext context, String name, int price, String imagee) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagee, height: 70),

          const SizedBox(height: 10),

          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),

          Text("Rp $price"),

          const SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OrderPage(name: name, price: price, imagee: imagee),
                ),
              );
            },
            child: const Text("Pesan"),
          ),
        ],
      ),
    );
  }
}
