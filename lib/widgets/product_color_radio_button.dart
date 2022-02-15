import 'package:flutter/material.dart';
import 'package:product_card_challenge/notifiers/product_notifier.dart';
import 'package:product_card_challenge/theme/colors.dart';

class ProductColorRadioButton extends StatefulWidget {
  const ProductColorRadioButton({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final ShoesColor value;
  final ShoesColor groupValue;
  final ValueChanged<ShoesColor> onChanged;

  @override
  _ProductColorRadioButtonState createState() =>
      _ProductColorRadioButtonState();
}

class _ProductColorRadioButtonState extends State<ProductColorRadioButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = widget.groupValue == widget.value;
  }

  @override
  void didUpdateWidget(covariant ProductColorRadioButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      isSelected = widget.groupValue == widget.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final decoration = isSelected
        ? BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: AppColors.grey,
                blurRadius: 4,
                spreadRadius: 0.5,
              ),
            ],
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: AppColors.alto,
            ),
          )
        : const BoxDecoration();

    final padding = isSelected ? const EdgeInsets.all(4) : EdgeInsets.zero;
    final size = isSelected ? const Size(24, 24) : const Size(16, 16);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => widget.onChanged(widget.value),
        child: AnimatedContainer(
          height: size.height,
          width: size.height,
          padding: padding,
          duration: const Duration(milliseconds: 200),
          decoration: decoration,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: widget.value.value,
            ),
          ),
        ),
      ),
    );
  }
}
