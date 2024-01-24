import 'package:flutter/material.dart';
class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('order page'),
    );
  }
}
