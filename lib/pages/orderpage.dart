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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
