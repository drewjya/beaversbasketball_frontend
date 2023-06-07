import 'package:beaverbasketball/src/src.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AchievementView extends HookConsumerWidget {
  const AchievementView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isActionEnabled = MediaQuery.of(context).size.width > 800;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: TitlePage(text: "ACHIEVEMENT")),
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                padding: EdgeInsets.symmetric(
                    horizontal: isActionEnabled ? 90.0 : 20, vertical: 20),
                child: StaggeredGrid.count(
                    mainAxisSpacing: isActionEnabled ? 60 : 20,
                    crossAxisSpacing: isActionEnabled ? 60 : 20,
                    crossAxisCount: 2,
                    children: List.generate(
                        10,
                        (index) => Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: NAVBAR,
                                ),
                                // borderRadius: BorderRadius.circular(10),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.all(8).copyWith(
                                      top: isActionEnabled ? 8 : 4,
                                      bottom: isActionEnabled ? 8 : 4,
                                    ),
                                    color: NAVBAR,
                                    child: Text(
                                      "28 MAY 2023",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Image.asset(AssetConstant.carousel3),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: BACKGROUND_CONTENT,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: FittedBox(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  DateTime.now().toString(),
                                                ),
                                                Text("KU $index"),
                                                ...List.generate(
                                                  index,
                                                  (index) => Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Badge(),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                            "Ini Nama event $index"),
                                                      ]),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))),
              ),
            ],
          ),
        ),

        // Padding(
        // padding: EdgeInsets.symmetric(
        //     horizontal: isActionEnabled ? 90.0 : 20, vertical: 20),
        //   child: GridView.builder(
        //     physics: NeverScrollableScrollPhysics(),
        //     shrinkWrap: true,
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 2,
        //       mainAxisSpacing: isActionEnabled ? 60 : 20,
        //       crossAxisSpacing: isActionEnabled ? 60 : 20,
        //       childAspectRatio: 0.7,
        //     ),
        //     itemBuilder: (context, index) {
        // return Column(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Expanded(
        //       flex: 2,
        //       child: Container(
        //         height: double.infinity,
        //         color: Colors.green,
        //         child: Stack(
        //           children: [
        //             Align(
        //               alignment: Alignment.bottomCenter,
        //               child: Container(
        //                 alignment: Alignment.centerLeft,
        //                 width: double.infinity,
        //                 height: isActionEnabled ? 60 : 20,
        //                 padding: EdgeInsets.all(8).copyWith(
        //                   top: isActionEnabled ? 8 : 4,
        //                   bottom: isActionEnabled ? 8 : 4,
        //                 ),
        //                 color: NAVBAR,
        //                 child: Text(
        //                   "28 MAY 2023",
        //                   style: TextStyle(
        //                     fontSize: 10,
        //                     color: Colors.black,
        //                     fontWeight: FontWeight.w700,
        //                   ),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     Expanded(
        //       flex: 1,
        //       child: Container(
        //         height: double.infinity,
        //         width: double.infinity,
        //         color: BACKGROUND_CONTENT,
        //         padding: EdgeInsets.all(8),
        //         child: Row(
        //           children: [
        //             Expanded(
        //               child: FittedBox(
        //                 child: Column(
        //                   crossAxisAlignment: CrossAxisAlignment.start,
        //                   children: [
        //                     Text(
        //                       DateTime.now().toString(),
        //                     ),
        //                     Text("KU $index"),
        //                     ...List.generate(
        //                       5,
        //                       (index) => Row(
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment.center,
        //                           children: [
        //                             Badge(),
        //                             SizedBox(
        //                               width: 10,
        //                             ),
        //                             Text("Ini Nama event $index"),
        //                           ]),
        //                     )
        //                   ],
        //                 ),
        //               ),
        //             ),
        //             Spacer(),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // );
        //     },
        //     itemCount: 5,
        //   ),
        // ),
        SliverToBoxAdapter(child: FooterWidget()),
      ],
    );
  }
}
