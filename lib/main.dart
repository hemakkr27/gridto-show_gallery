import 'dart:async';

import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:gridviewtogallery/giffbox.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Material App Bar'),
            ),
            body: const MyHomePage()));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController pageController = pageController;
  int pagecount = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      print("page ${pageController.page}");
      double nextpage = pageController.page! + 1;
      if (pageController.page! >= pagecount - 1) {
        pageController.animateToPage(0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      } else {
        pageController.nextPage(
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: false,
      //   title: SizedBox(
      //     width: 100,
      //     child: Image.asset("assets/images/img5.jpeg"),
      //   ),
      // ),
      body: Container(
        child: ListView(children: [
          LimitedBox(
            maxHeight: 250,
            child: Stack(
              children: [
                PageView(
                    // controller: pageController,
                    children: [
                      InkWell(
                        child:
                            AdsSliderCard(slideimage: "assets/images/img1.jpg"),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage11()),
                          );
                        },
                      ),
                      const Text(
                        "data",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const AdsSliderCard(
                          slideimage: "assets/images/img2.jpeg"),
                      const AdsSliderCard(
                          slideimage: "assets/images/img3.jpeg"),
                    ]),
              ],
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            // physics: NeverScrollableScrollPhysics(),
            children: [
              Elevbtn("assets/images/img1.jpg", "image1", "gdfgfdgdfgdfgf",
                  context),
              Elevbtn("assets/images/img2.jpeg", "image1", "newimg", context),

              Elevbtn("assets/images/img3.jpeg", "image1", "newimg", context),
              Elevbtn("assets/images/img4.jpeg", "image1", "newimg", context),
              Elevbtn("assets/images/img5.jpeg", "image1", "newimg", context),

              // const MenuFeature(
              //   iconAssets: "assets/images/img1.jpg",
              //   name: "image1",
              // ),
            ],
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Trending Now",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: LimitedBox(
              maxHeight: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  TrendingCard(trandimg: "assets/images/img1.jpg"),
                  TrendingCard(trandimg: "assets/images/img2.jpeg"),
                  TrendingCard(trandimg: "assets/images/img3.jpeg"),
                  TrendingCard(trandimg: "assets/images/img4.jpeg"),
                  TrendingCard(trandimg: "assets/images/img5.jpeg"),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey[200],
            height: 8,
          ),
          const ParmoteshopCard(
            promotionimg: "assets/images/img3.jpeg",
          ),
          const ParmoteshopCard(
            promotionimg: "assets/images/img5.jpeg",
          ),
        ]),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.blue,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.local_atm),
      //     ),
      //   ],
      // ),
    );
  }
}

// class SliderIndicator extends StatelessWidget {
//   const SliderIndicator({Key? key, required this.pageController})
//       : super(key: key);
//   final PageController pageController;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: List<Widget>.generate(3, buildIndicator),
//     );
//   }

//   Widget buildIndicator(int, index) {
//     print("build $index $(pageController.page) ");

//     return Container(
//       child: Center(
//         child: Container(
//           color: Colors.red,
//           width: 20,
//           height: 5,
//         ),
//       ),
//     );
//   }
// }

// party 4  trending next paet ///

class ParmoteshopCard extends StatelessWidget {
  final String promotionimg;
  const ParmoteshopCard({Key? key, required this.promotionimg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width -
            MediaQuery.of(context).size.width / 3,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              promotionimg,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

//     part 3 //

class TrendingCard extends StatelessWidget {
  final String trandimg;
  //final String trandname;
  const TrendingCard({
    Key? key,
    required this.trandimg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 200,
        width: 200,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              trandimg,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}

// class MenuFeature extends StatelessWidget {
//   final String iconAssets;
//   final String name;
//   const MenuFeature({Key? key, required this.iconAssets, required this.name})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Column(
//           children: [
//             // Elevbtn("assets/images/img1.jpg", "Eating Food",
//             //     "This is a granny eating Food dialog box.", context),
//             ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.transparent,
//                   //   side: BorderSide(color: Colors.red, width: 5),
//                   textStyle: const TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                       fontStyle: FontStyle.normal),
//                 ),
//                 child: Image.asset(iconAssets),
//                 onPressed: () {
//                   showDialog(
//                       context: context,
//                       builder: (_) => NetworkGiffyDialog(
//                             //  key: keys[1],
//                             image: Image.network(
//                               "assets/images/img1.jpg",
//                               fit: BoxFit.cover,
//                             ),

//                             entryAnimation: EntryAnimation.TOP_LEFT,
//                             title: const Text(
//                               'Eating Food',
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 22.0, fontWeight: FontWeight.w600),
//                             ),
//                             description: const Text(
//                               'This is a granny eating Food dialog box. ',
//                               textAlign: TextAlign.center,
//                             ),
//                           ));
//                 }),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 name,
//                 style:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//       ],
//     ));
//   }
// }

// ignore: non_constant_identifier_names

//    part 1  //

class AdsSliderCard extends StatelessWidget {
  final String slideimage;
  const AdsSliderCard({Key? key, required this.slideimage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    slideimage,
                    fit: BoxFit.cover,
                  )))),
    );
  }
}

//             part 2 //

Widget Elevbtn(
    //String icon,
    String img,
    String text,
    String dsc,
    // String url,
    BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          //   side: BorderSide(color: Colors.red, width: 5),
          textStyle: const TextStyle(
              color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
        ),

        // style: ElevatedButton.styleFrom(
        //   primary: Colors.transparent,
        //   //   side: BorderSide(color: Colors.red, width: 5),
        //   textStyle: const TextStyle(
        //       color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
        // ),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => NetworkGiffyDialog(
                    //  key: keys[1],
                    image: Image.asset(
                      img,
                      fit: BoxFit.cover,
                    ),

                    entryAnimation: EntryAnimation.TOP_LEFT,
                    title: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.w600),
                    ),
                    description: Text(
                      dsc,
                      textAlign: TextAlign.center,
                    ),
                  ));
        }),
  );
}

/// https://www.pexels.com/photo/cooked-seafoods-699953/   food related image
///
///
/// //https://www.youtube.com/watch?v=UEe4C7C1Abw
