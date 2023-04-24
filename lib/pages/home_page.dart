// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_seller/cubit/app_cubit_states.dart';
import 'package:trip_seller/cubit/app_cubits.dart';
import 'package:trip_seller/misc/colors.dart';

import 'package:trip_seller/widgets/app_large_text.dart';
import 'package:trip_seller/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorklin.png": "Snorkling",
  };
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          var info = state.places;
          return Padding(
            padding: const EdgeInsets.only(top: 77, left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu text
                Container(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        size: 40,
                        color: Colors.black,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5)),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                // discover text
                AppLargeText(text: "Discover"),
                const SizedBox(height: 15),
                //tabbar
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(right: 20),
                      controller: tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "Inspirations"),
                        Tab(text: "Emotions"),
                      ]),
                ),
                SizedBox(
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<AppCubits>()
                                  .detailsPage(info[index]);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://mark.bslmeiyu.com/uploads/${info[index].img}"),
                                      fit: BoxFit.cover)),
                            ),
                          );
                        },
                      ),
                      const Text("There"),
                      const Text("Bye"),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(
                        text: "Explore More",
                        size: 22,
                      ),
                      AppText(
                        text: "See all",
                        color: AppColors.textColor1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 115,
                  width: double.maxFinite,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.indigo[50],
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "img/${images.keys.elementAt(index)}"),
                                      fit: BoxFit.contain)),
                            ),
                            const SizedBox(height: 10),
                            AppText(
                              text: images.values.elementAt(index),
                              color: AppColors.textColor2,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        (configuration.size!.width - 20) / 2 - radius / 2,
        configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
