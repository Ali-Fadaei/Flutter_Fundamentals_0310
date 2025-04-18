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
        vertical: 8,
        horizontal: 18,
      ),
      decoration: BoxDecoration(
        color: U.Theme.surface,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(U.Theme.r15),
        ),
        boxShadow: [
          BoxShadow(
            color: U.Theme.outline,
            offset: Offset(2, -5),
            blurRadius: 15,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          const Spacer(),
          ...destinations.asMap().entries.expand(
            (element) {
              return [
                _NavigationDestination(
                  title: element.value.title,
                  icon: element.value.icon,
                  isSelected: element.key == selectedIndex,
                  onTap: () => onDestinationChanged(element.key),
                ),
                const Spacer(),
              ];
            },
          ),
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
    return SizedBox(
      height: 65,
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(
          U.Theme.r15,
        ),
        child: InkWell(
          onTap: onTap,
          // color
          borderRadius: BorderRadius.circular(
            U.Theme.r15,
          ),
          child: Padding(
            padding: const EdgeInsets.all(6),
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
                  font: U.TextFont.iranSans,
                  color: isSelected ? U.Theme.primary : U.Theme.secondary,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
