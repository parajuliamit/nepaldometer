import 'package:flutter/material.dart';

class DataTile extends StatelessWidget {
  const DataTile({
    Key? key,
    required this.text,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  final String text;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      height: 120,
      width: 120,
      decoration: BoxDecoration(color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(value), Text(text)],
          )
        ],
      ),
    );
  }
}
