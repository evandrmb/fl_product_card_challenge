import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:product_card_challenge/notifiers/product_notifier.dart';
import 'package:product_card_challenge/widgets/widgets.dart';
import 'package:provider/provider.dart';
import 'package:product_card_challenge/extensions/extensions.dart';

class ProductDetailsContainer extends StatelessWidget {
  const ProductDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductNotifier>(
      builder: (context, notifier, child) => Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Nike Zoom KD 12',
                    style: context.theme.textTheme.headline2,
                  ),
                  const SizedBox(width: 8),
                  NewTextContainer(color: notifier.color.value),
                ],
              ),
              Text(
                "Men's Running Shows",
                style: context.theme.textTheme.subtitle2,
              ),
              const Divider(),
              Text(
                'Product Info',
                style: context.theme.textTheme.subtitle1,
              ),
              const Text(
                '''Ensure a comfortable running session by wearing this pair of cool running shoes from Nike.''',
              ),
              const Divider(),
              const Subtitle('Color'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ShoesColor.values
                    .map(
                      (color) => ProductColorRadioButton(
                        value: color,
                        groupValue: notifier.color,
                        onChanged: notifier.setColor,
                      ),
                    )
                    .toList(),
              ),
              const Divider(),
              const Subtitle('Size'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [7, 8, 9, 10, 11]
                    .map((size) => ShoesSizeButton(
                          groupValue: notifier.size,
                          value: size,
                          onChanged: notifier.setSize,
                          color: notifier.color.value,
                        ))
                    .toList(),
              ),
              const Divider(),
              const Spacer(),
              ButtonBar(
                buttonPadding: EdgeInsets.zero,
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(notifier.color.value),
                    ),
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {},
                    label: const Text('Add to Cart'),
                  ),
                  Text(
                    NumberFormat.currency(symbol: r'$').format(149.0),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
