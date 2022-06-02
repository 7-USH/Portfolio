// ignore_for_file: use_full_hex_values_for_flutter_colors, unnecessary_const, unused_element, prefer_const_literals_to_create_immutables, unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/constants/typos.dart';
import 'package:my_portfolio/dimension/responsive.dart';
import 'package:my_portfolio/widgets/circle.dart';

class MyAbout extends StatefulWidget {
  const MyAbout({Key? key}) : super(key: key);

  @override
  State<MyAbout> createState() => _MyAboutState();
}

class _MyAboutState extends State<MyAbout> {
  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

 Widget _buildBody(BuildContext context) {
    var child;

    if (ResponsiveLayout.isLargeScreen(context)) {
      child = _buildLargeScreenContent(context);
    } else if (ResponsiveLayout.isMediumScreen(context)) {
      child = _buildMediumScreenContent(context);
    } else if (ResponsiveLayout.isSmallScreen(context)) {
      child = _buildSmallScreenContent(context);
    }

    return child;
  }


  Widget _buildLargeScreenContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          right: size.width * 0.16,
          top: size.width * 0.10,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25,
            innerRadius: 8,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          right: size.width * 0.29,
          top: size.width * 0.12,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          right: size.width * 0.37,
          top: size.width * 0.10,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20,
            innerRadius: 4.0,
            circleColor: const Color(0xFF002ebf2),
          ),
        ),
        Center(
          child: SizedBox(
            width: size.width * 0.80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const CircleWidget(
                              width: 60,
                              height: 60,
                              outerRadius: 25,
                              innerRadius: 8,
                              circleColor: Color(0xff0098a6)),
                          const SizedBox(
                            width: 40,
                          ),
                          _buildAbout(size: size.width * 0.12),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: _buildSummary(size: size.width * 0.012),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: MediaQuery.of(context).size.width * 0.16,
          top: MediaQuery.of(context).size.width * 0.20,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width * 0.25,
          top: MediaQuery.of(context).size.width * 0.65,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.17),
          child: Center(
              child: Column(
            children: [
              _buildAbout(size: size.width * 0.23),
              SizedBox(
                height: size.height * 0.03,
              ),
              _buildSummary(size: size.width * 0.022, quarterTurns: 4)
            ],
          )),
        )
      ],
    );
  }

  Widget _buildSmallScreenContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
      child: Stack(
        children: [
          Positioned(
            left: MediaQuery.of(context).size.width * 0.70,
            top: MediaQuery.of(context).size.width * 0.30,
            child: const CircleWidget(
              width: 60,
              height: 60,
              outerRadius: 25.0,
              innerRadius: 8.0,
              circleColor: Color(0xFF0098a6),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.50,
            top: MediaQuery.of(context).size.width * 0.65,
            child: const CircleWidget(
              width: 40,
              height: 40,
              outerRadius: 15.0,
              innerRadius: 4.0,
              circleColor: Color(0xFF00bcd5),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * 0.25,
            top: MediaQuery.of(context).size.width * 1.4,
            child: const CircleWidget(
              width: 50,
              height: 50,
              outerRadius: 20.0,
              innerRadius: 4.0,
              circleColor: Color(0xFFb2ebf2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildAbout(
                      size: size.width * 0.23,
                    ),
                    SizedBox(height: size.height * 0.03),
                    _buildSummary(
                      quarterTurns: 4,
                      size: size.width * 0.035,
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildAbout({required double size}) {
    return RichText(
        text: TextSpan(
            text: Strings.about,
            style: bigText(
              color: Colors.white,
              size: size,
              weight: FontWeight.w700,
              letterspacing: -8,
              height: 1,
            ),
            children: [
          TextSpan(
            text: ":",
            style: bigText(
              color: const Color(0xFFff5353),
              size: size,
              weight: FontWeight.w700,
              letterspacing: -8,
              height: 1,
            ),
          )
        ]));
  }

  Widget _buildSummary({required double size, int quarterTurns = 3}) {
    return Text(
      Strings.summary,
      textAlign: TextAlign.justify,
      style: screenText(
          size: size,
          color: Colors.grey.shade400,
          weight: FontWeight.normal,
          lettspacing: 1,
          height: 2),
    );
  }

  Widget _buildDesign({required double size}) {
    return Center(
      child: Text(
        Strings.about,
        style: bigText(
          color: Colors.white,
          size: size,
          weight: FontWeight.w700,
          letterspacing: -8,
          height: 1,
        ),
      ),
    );
  }
}
