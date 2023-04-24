import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_seller/cubit/app_cubits.dart';
import 'package:trip_seller/widgets/app_text.dart';
import 'package:trip_seller/widgets/responsive_button.dart';

import '../misc/colors.dart';
import '../widgets/app_large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img/welcome-one.png",
    "img/welcome-two.png",
    "img/welcome-three.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite, // максимальна ширина екрану
            height: double.maxFinite / 2,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images[index]),
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Trips"),
                      AppText(text: "Mountain", size: 30),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 250,
                        child: AppText(
                          text:
                              "Mountain hikes give you incredible sense of freedom along with endurance test",
                          color: AppColors.textColor2,
                          size: 14,
                        ),
                      ),
                      const SizedBox(height: 40),
                      GestureDetector(
                        onTap: () => context.read<AppCubits>().getData(),
                        child: SizedBox(
                          width: 200,
                          child: ResponsiveButton(width: 120),
                        ),
                      )
                    ],
                  ),
                  Column(
                      children: List.generate(3, (indexDots) {
                    return Container(
                      width: 8,
                      height: index == indexDots ? 25 : 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == indexDots
                            ? AppColors.mainColor
                            : AppColors.mainColor.withOpacity(0.3),
                      ),
                      margin: const EdgeInsets.only(bottom: 2),
                    );
                  }))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
