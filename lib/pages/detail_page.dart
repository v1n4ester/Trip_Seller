import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_seller/cubit/app_cubit_states.dart';
import 'package:trip_seller/cubit/app_cubits.dart';
import 'package:trip_seller/misc/colors.dart';
import 'package:trip_seller/widgets/app_button.dart';
import 'package:trip_seller/widgets/app_large_text.dart';
import 'package:trip_seller/widgets/app_text.dart';
import 'package:trip_seller/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 3;
  int selectedIndex = 0;

  @override
  void initState() {
    DetailState state = context.read<AppCubits>().state as DetailState;
    gottenStars = state.place.stars - 1;
    selectedIndex = state.place.people;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        DetailState detail = state as DetailState;
        return Scaffold(
          body: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/${detail.place.img}"),
                        fit: BoxFit.fill,
                      )),
                    )),
                Positioned(
                    left: 20,
                    top: 60,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<AppCubits>().goHome();
                          },
                          icon: const Icon(Icons.menu),
                          color: Colors.white,
                        ),
                      ],
                    )),
                Positioned(
                  top: 300,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: detail.place.name,
                                color: Colors.black.withOpacity(0.8)),
                            AppLargeText(
                                text: "\$ ${detail.place.price}", color: AppColors.mainColor)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: AppColors.mainColor),
                            const SizedBox(width: 5),
                            AppText(
                              text: detail.place.location,
                              color: AppColors.textColor1,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                  5,
                                  (index) => Icon(Icons.star,
                                      color: index <= gottenStars
                                          ? AppColors.starColor
                                          : AppColors.textColor2)),
                            ),
                            const SizedBox(width: 10),
                            AppText(text: "(${detail.place.stars.toDouble()})", color: AppColors.textColor2)
                          ],
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                            text: "People",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        const SizedBox(height: 5),
                        AppText(
                            text: "Number of people in your gruop",
                            color: AppColors.mainTextColor),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  text: (index + 1).toString(),
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black.withOpacity(0.8)
                                      : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index
                                      ? Colors.black.withOpacity(0.8)
                                      : AppColors.buttonBackground,
                                  size: 50,
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        const SizedBox(height: 10),
                        AppText(
                            text:
                                detail.place.description,
                            color: AppColors.mainTextColor),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppButton(
                        color: AppColors.mainColor,
                        backgroundColor: Colors.white,
                        size: 60,
                        borderColor: AppColors.mainColor,
                        icon: Icons.favorite_border,
                      ),
                      const SizedBox(width: 20),
                      ResponsiveButton(
                        isResponsive: true,
                        text: "Book Trip Now",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
