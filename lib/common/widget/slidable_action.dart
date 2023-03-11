import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class SlidableActions extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final WidgetRef ref;
  final IconData icon;
  final Color backGroundColor;
  const SlidableActions(
      {super.key,
      required this.ref,
      required this.onTap,
      required this.label,
      required this.icon,
      required this.backGroundColor});

  @override
  Widget build(BuildContext context) {
    return SlidableAction(
      onPressed: (context) => onTap,
      backgroundColor: backGroundColor,
      icon: icon,
      borderRadius: BorderRadius.circular(20),
      label: label,
    );
  }
}
