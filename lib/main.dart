import 'package:flutter/material.dart';
import 'package:product_card_challenge/notifiers/product_notifier.dart';
import 'package:product_card_challenge/theme/colors.dart';
import 'package:product_card_challenge/widgets/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProductCardChallengeApp());
}

class ProductCardChallengeApp extends StatelessWidget {
  const ProductCardChallengeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Product Card Challenge',
      theme: ThemeData(
        cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        )),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: AppColors.mineShaft,
          ),
          headline2: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColors.mineShaft,
          ),
          headline3: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: AppColors.mineShaft,
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.mineShaft,
          ),
          subtitle2: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            color: AppColors.mineShaft,
          ),
          bodyText1: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: AppColors.mineShaft,
          ),
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: AppColors.mineShaft,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: ChangeNotifierProvider(
          create: (context) => ProductNotifier(),
          child: const Center(child: ProductCard()),
        ),
      ),
    );
  }
}
