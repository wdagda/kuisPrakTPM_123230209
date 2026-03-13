import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String name;
  final int price;
  final String imagee;

  const OrderPage({
    super.key,
    required this.name,
    required this.price,
    required this.imagee,
  });

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController jumlahController = TextEditingController();

  int total = 0;

  void hitung() {
    int jumlah = int.tryParse(jumlahController.text) ?? 0;

    setState(() {
      total = jumlah * widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Order"),
        backgroundColor: Colors.green,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset(widget.imagee, height: 150),

            const SizedBox(height: 10),

            Text(
              widget.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Text("Harga: Rp ${widget.price}"),

            const SizedBox(height: 20),

            TextField(
              controller: jumlahController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Masukkan Jumlah",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: hitung,
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Total Harga: Rp $total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
