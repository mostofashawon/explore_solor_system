import 'package:explore_soloar_system/data/data.dart';
import 'package:explore_soloar_system/utills/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenSize = MediaQuery.of(context).size;
    print(screenSize);
    print(screenHeight);
    print(screenWidth);

    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor,gradientEndColor],
            begin:Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3,0.7]
          )
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
               padding: EdgeInsets.only(top: screenHeight*.032,left: screenWidth*.032),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Explore',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: screenHeight*0.05,
                        //  fontSize: 44,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Solar System',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        //  fontSize: 24,
                        fontSize: screenHeight*.03,
                        color: const Color(0x7cdbf1ff),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                height: screenHeight*.589,
               // padding: const EdgeInsets.only(left: 32),
                padding: EdgeInsets.only(top: screenHeight*.032,left: screenWidth*.032),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: screenWidth*.65,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                    DotSwiperPaginationBuilder(activeSize: 14, space: 6),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                                pageBuilder: (context, a, b) => DetailPage(
                                  planetInfo: planets[index],
                                )));
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(
                                //height: 100,
                                height: screenHeight*.11
                              ),
                              Card(
                                elevation: 8,
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                child: Padding(
                                 // padding: const EdgeInsets.all(32.0),
                                  padding: EdgeInsets.only(top: screenHeight*.083,left: screenWidth*.050),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                       // height: 100,
                                          height: screenHeight*.11
                                      ),
                                      Text(
                                        planets[index].name,
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                          //fontSize: 44,
                                          fontSize: screenHeight*0.05,
                                          color: const Color(0xff47455f),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                      Text(
                                        'Solar System',
                                        style: TextStyle(
                                          fontFamily: 'Avenir',
                                        //  fontSize: 23,
                                          fontSize: screenHeight*.03,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(
                                       //height: 32,
                                        height: screenHeight*.032,
                                      ),
                                      // Divider(
                                      //   color: C,
                                      // ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'More',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: screenHeight*.020,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(Icons.arrow_forward_ios,
                                              color: secondaryTextColor),
                                        ],
                                      ),
                                      SizedBox(
                                      height: screenHeight*.022,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Image.asset(planets[index].iconImage),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(screenWidth*.12)),
            color: navigationColor
        ),
        padding: const EdgeInsets.all(18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                icon: Image.asset('assets/menu_icon.png'), onPressed: () {}),
            IconButton(
                icon: Image.asset('assets/profile_icon.png'), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
