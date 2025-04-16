import 'package:flutter/material.dart';
import './ui_kit.dart' as U;

class NavigationBar extends StatelessWidget {
  //
  final int selectedIndex;

  final List<NavigationDestination> destinations;

  final void Function(int index) onDestinationChanged;

  const NavigationBar({
    super.key,
    required this.selectedIndex,
    required this.destinations,
    required this.onDestinationChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 76,
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(U.Theme.r15),
        ),
      ),
      child: Row(
        children: [
          ...destinations.asMap().entries.expand((element) {
            return [
              _NavigationDestination(
                title: element.value.title,
                icon: element.value.icon,
                isSelected: element.key == selectedIndex,
                onTap: () => onDestinationChanged(element.key),
              ),
              if (element.key != destinations.length - 1) const Spacer(),
            ];
          }),
        ],
      ),
    );
  }
}

class NavigationDestination {
  //
  final String title;

  final String icon;

  const NavigationDestination({
    required this.title,
    required this.icon,
  });
}

class _NavigationDestination extends StatelessWidget {
  //
  final String title;

  final String icon;

  final bool isSelected;

  final void Function() onTap;

  const _NavigationDestination({
    // super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            U.Image.icon(
              path: icon,
              color: isSelected ? U.Theme.primary : U.Theme.secondary,
            ),
            const SizedBox(height: 4),
            U.Text(
              title,
              size: U.TextSize.s14,
              color: isSelected ? U.Theme.primary : U.Theme.secondary,
            )
          ],
        ),
      ),
    );
  }
}
