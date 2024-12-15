import 'package:flutter/material.dart';

class ItemRow extends StatelessWidget {
  final String name;
  final int price;
  final int quantity;
  final String satuan;

  const ItemRow({
    required this.name,
    required this.price,
    required this.quantity,
    required this.satuan,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 16.0),
            ),
            Text(
              'Subtotal Rp ${quantity * price}',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Rp $price'),
            Text('$quantity $satuan'),
          ],
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}