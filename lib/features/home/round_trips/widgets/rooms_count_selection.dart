import 'package:flutter/material.dart';

class RoomsSelection extends StatefulWidget {
  final String itemName;
  final double roomPrice;
  const RoomsSelection({
    super.key,
    required this.itemName,
    required this.roomPrice
  });

  @override
  State<RoomsSelection> createState() => _RoomsSelectionState();
}

class _RoomsSelectionState extends State<RoomsSelection> {

  int itemCount = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.itemName,
              style: const TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
             Text(
              '\$${widget.roomPrice.toString()}', // Replace with actual price
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (itemCount > 0) {
                    itemCount--;
                  }
                });
              },
            ),
            Text(
              itemCount.toString(),
              style: const TextStyle(fontSize: 18.0),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  itemCount++;
                });
              },
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}