import 'package:flutter/material.dart';
import 'package:levelx/theme/app_theme.dart';

class TabSelector extends StatefulWidget {
  final void Function(String selectedTab) onTabChanged;
  final String selectedTab;

  const TabSelector({super.key, required this.onTabChanged, required this.selectedTab});

  @override
  State<TabSelector> createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  final List<String> tabs = ['Trending', 'Relationship', 'Self Care'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: List.generate(tabs.length, (index) {
            final tab = tabs[index];
            final isSelected = tab == widget.selectedTab;
            return Padding(
              padding: const EdgeInsets.only(right: 12),
              child: GestureDetector(
                onTap: () => widget.onTabChanged(tab),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? appColor(context).primary : appColor(context).ternaryText,
                    borderRadius: BorderRadius.circular(9),
                  ),
                  child: Text(
                    tab,
                    style: TextStyle(fontWeight: FontWeight.w500, color: isSelected ? appColor(context).background : appColor(context).text),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
