import 'package:flutter/material.dart';
import 'package:product_card_challenge/theme/colors.dart';

class ShoesSizeButton extends StatelessWidget {
  const ShoesSizeButton({
    Key? key,
    required this.groupValue,
    required this.value,
    required this.onChanged,
    required this.color,
  }) : super(key: key);

  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final isSelected = groupValue == value;
    const size = Size(24, 24);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: AnimatedContainer(
          decoration: BoxDecoration(
            color: isSelected ? color : AppColors.grey,
            borderRadius: BorderRadius.circular(6),
          ),
          height: size.height,
          width: size.width,
          duration: const Duration(milliseconds: 200),
          child: Center(
            child: Text(
              '$value',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.apply(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
