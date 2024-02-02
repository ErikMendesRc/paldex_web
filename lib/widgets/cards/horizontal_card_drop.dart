import 'package:flutter/material.dart';
import 'package:paldex/utils/colors/colors.dart';
import 'package:paldex/utils/items_icons.dart';
import 'package:provider/provider.dart';
import '../../models/obtained_item.dart';
import '../../models/pal.dart';
import '../../provider/pal_provider.dart';
import '../my_clipper_icons.dart';

class CardDropItems extends StatelessWidget {
  final int palID;

  const CardDropItems({
    required this.palID,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palProvider = Provider.of<PalProvider>(context, listen: false);
    return FutureBuilder<Pal>(
      future: palProvider.getPalById(palID),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('No data available'),
          );
        }
        final Pal pal = snapshot.data!;
        final List<ObtainedItem> obtainedItems = pal.obtainedItems;

        final int itemsLength = obtainedItems.length;
        final int firstRowItemCount = (itemsLength / 2).ceil();
        final List<ObtainedItem> firstRowItems = obtainedItems.sublist(0, firstRowItemCount);
        final List<ObtainedItem> secondRowItems = obtainedItems.sublist(firstRowItemCount);

        return Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 12,
            child: Container(
              color: const Color.fromARGB(255, 55, 77, 116),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (firstRowItems.isNotEmpty) _buildRow(context, firstRowItems),
                  const SizedBox(height: 16),
                  if (secondRowItems.isNotEmpty) _buildRow(context, secondRowItems),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildRow(BuildContext context, List<ObtainedItem> items) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      children: items.map((item) {
        return Tooltip(
          decoration: const BoxDecoration(
            color: AppColors.background
          ),
          message: item.itemName,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 8,
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    clipper: MyClipperIcons(),
                    child: ItemsIcons(items: [item]),
                  ),
                  const SizedBox(height: 4),
                  _buildFlag('Chance: ${(item.dropChance * 100)}%', Colors.blue),
                  const SizedBox(width: 8.0),
                  Column(
                    children: [
                      _buildFlag('Drop: ${item.dropQuantity}', Colors.orange),
                      const SizedBox(height: 8),
                      if (item.bossOnly) _buildFlag('BOSS', Colors.red),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFlag(String value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}