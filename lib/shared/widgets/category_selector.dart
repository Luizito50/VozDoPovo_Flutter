import 'package:flutter/material.dart';
import '../../features/report/domain/report.dart';

class CategorySelector extends StatelessWidget {
  final ReportCategory? selected;
  final void Function(ReportCategory) onSelected;

  const CategorySelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: ReportCategory.values.map((cat) {
        final isSelected = cat == selected;
        return ChoiceChip(
          label: Text('${cat.emoji} ${cat.label}'),
          selected: isSelected,
          onSelected: (_) => onSelected(cat),
          selectedColor: cs.primaryContainer,
          labelStyle: TextStyle(
            color: isSelected ? cs.onPrimaryContainer : cs.onSurface,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
          side: BorderSide(
            color: isSelected ? cs.primary : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
          backgroundColor: cs.surface,
          showCheckmark: false,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        );
      }).toList(),
    );
  }
}
