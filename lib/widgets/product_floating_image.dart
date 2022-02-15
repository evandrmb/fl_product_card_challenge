import 'package:flutter/material.dart';
import 'package:product_card_challenge/notifiers/product_notifier.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class ProductFloatingImage extends StatefulWidget {
  const ProductFloatingImage({Key? key, required this.constraints})
      : super(key: key);

  final BoxConstraints constraints;

  @override
  State<ProductFloatingImage> createState() => _ProductFloatingImageState();
}

class _ProductFloatingImageState extends State<ProductFloatingImage>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    lowerBound: 10,
    upperBound: 20,
    duration: const Duration(
      seconds: 1,
      milliseconds: 500,
    ),
  )..repeat(reverse: true);

  late BoxConstraints constraints;

  @override
  void initState() {
    super.initState();
    constraints = widget.constraints;
  }

  @override
  void didUpdateWidget(covariant ProductFloatingImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    constraints = widget.constraints;
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<ProductNotifier>();

    late double imageHeight;

    if (constraints.maxWidth <= 300) {
      imageHeight = constraints.maxHeight * .85;
    } else if (constraints.maxWidth >= 1024) {
      imageHeight = constraints.maxHeight * .75;
    } else {
      imageHeight = constraints.maxHeight;
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          height: imageHeight,
          right: 8,
          top: _controller.value,
          child: Transform.rotate(
            angle: -math.pi / 8.33,
            child: Image.asset(
              notifier.color.assetImage,
              filterQuality: FilterQuality.high,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
