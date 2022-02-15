import 'package:flutter/material.dart';
import 'package:product_card_challenge/notifiers/product_notifier.dart';
import 'package:product_card_challenge/widgets/product_details_container.dart';
import 'package:product_card_challenge/widgets/product_floating_image.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:product_card_challenge/theme/colors.dart';
import 'package:product_card_challenge/extensions/extensions.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with TickerProviderStateMixin {
  late DecorationTween decorationTween;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    lowerBound: 0,
    upperBound: 1,
    duration: const Duration(seconds: 1),
    reverseDuration: const Duration(microseconds: 1),
  );

  @override
  void initState() {
    super.initState();
    final notifier = context.read<ProductNotifier>();

    notifier.addListener(() {
      if (notifier.color != notifier.oldColor) {
        _controller
          ..reset()
          ..forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // log('Size: $size');
    final size = MediaQuery.of(context).size;

    return Consumer<ProductNotifier>(builder: (context, notifier, child) {
      final bannerConstraints = BoxConstraints(
        maxWidth: size.width,
        maxHeight: size.height * 0.3,
      );

      return Container(
        height: size.height * .8,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColors.grey,
              blurRadius: 8,
              spreadRadius: 4,
            ),
          ],
        ),
        child: Card(
          child: AnimatedBuilder(
            animation: notifier,
            builder: (context, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.centerLeft,
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      constraints: bannerConstraints,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6),
                          topRight: Radius.circular(6),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: notifier.oldColor.gradientColors,
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, _) => Container(
                        // duration: _controller.duration!,
                        constraints: bannerConstraints.copyWith(
                            maxWidth:
                                _controller.value * bannerConstraints.maxWidth),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: notifier.color.gradientColors,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      width: size.width * .2,
                      child: Image.asset(
                        'assets/images/logo.png',
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: Text(
                        'NIKE',
                        style: context.theme.textTheme.headline1?.apply(
                          fontSizeFactor: 4,
                          color: AppColors.alto.withOpacity(0.1),
                        ),
                      ),
                    ),
                    ProductFloatingImage(constraints: bannerConstraints),
                    Positioned(
                      right: 4,
                      top: 4,
                      child: IconButton(
                        onPressed: share,
                        icon: Icon(
                          Icons.share,
                          color: notifier.color.value,
                        ),
                      ),
                    )
                  ],
                ),
                const ProductDetailsContainer(),
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void share() {
    Share.share('check out my website https://example.com');
  }
}
