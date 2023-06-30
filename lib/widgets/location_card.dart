import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final int trans;
  const LocationCard({required this.trans, super.key});

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              'assets/icons/map.png',
              width: 100,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.trans < 0 ? "Your Location" : "你的位置",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.trans < 0 ? "McMaster University" : "哈密尔顿，安大略",
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
