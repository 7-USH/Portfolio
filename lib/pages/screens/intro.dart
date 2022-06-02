// ignore_for_file: unused_element, depend_on_referenced_packages, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/constants/typos.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/dimension/responsive.dart';
import 'package:my_portfolio/utils/screen_utils.dart';
import 'package:my_portfolio/widgets/circle.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
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
        ResponsiveLayout.isLargeScreen(context)
            ? _buildDesign()
            : const SizedBox.shrink(),
        _buildAppBar(context),
        Positioned(
          right: size.width * 0.16,
          top: size.width * 0.10,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: size.width * 0.29,
          top: size.width * 0.15,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          left: size.width * 0.37,
          bottom: size.width * 0.10,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Center(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      const SizedBox(width: 30.0),
                      const CircleWidget(
                        width: 60,
                        height: 60,
                        outerRadius: 25.0,
                        innerRadius: 8.0,
                        circleColor: Color(0xFF0098a6),
                      ),
                      const SizedBox(width: 40.0),
                      _buildAboutMe(size: size.width * 0.015),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50.0),
                  child: _buildHello(size: size.width * 0.12),
                ),
              ]),
        ),
      ],
    );
  }

  Widget _buildMediumScreenContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildAppBar(context),
        Positioned(
          left: size.width * 0.70,
          top: size.width * 0.30,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: size.width * 0.65,
          top: size.width * 0.65,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          right: size.width * 0.30,
          top: size.width * 1.1,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHello(size: size.width * 0.23),
                SizedBox(
                  height: size.height * 0.03,
                ),
                _buildAboutMe(size: size.width * 0.030, quarterTurns: 4)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSmallScreenContent(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _buildAppBar(context),
        Positioned(
          left: size.width * 0.70,
          top: size.width * 0.30,
          child: const CircleWidget(
            width: 60,
            height: 60,
            outerRadius: 25.0,
            innerRadius: 8.0,
            circleColor: Color(0xFF0098a6),
          ),
        ),
        Positioned(
          left: size.width * 0.65,
          top: size.width * 0.65,
          child: const CircleWidget(
            width: 40,
            height: 40,
            outerRadius: 15.0,
            innerRadius: 4.0,
            circleColor: Color(0xFF00bcd5),
          ),
        ),
        Positioned(
          right: size.width * 0.30,
          top: size.width * 1.2,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHello(size: size.width * 0.23),
                SizedBox(
                  height: size.height * 0.03,
                ),
                _buildAboutMe(size: size.width * 0.035, quarterTurns: 4)
              ],
            ),
            SizedBox(
              height: size.height * 0.10,
            ),
            _buildCookies(),
            SizedBox(
              height: size.height * 0.10,
            )
          ]),
        )
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: (ScreenUtil.getInstance().setWidth(40)),
        vertical: (ScreenUtil.getInstance().setWidth(20)),
      ),
      child: AppBar(
        titleSpacing: 0.0,
        title: _buildTitle(),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
    );
  }

  Widget _buildTitle() {
    return Row(
      children: <Widget>[
        _buildPortfolio(),
        SizedBox(
          width: ResponsiveLayout.isSmallScreen(context)
              ? MediaQuery.of(context).size.width * 0.10
              : ResponsiveLayout.isMediumScreen(context)
                  ? MediaQuery.of(context).size.width * 0.05
                  : MediaQuery.of(context).size.width * 0.20,
        ),
        ResponsiveLayout.isSmallScreen(context)
            ? const SizedBox.shrink()
            : _buildCookies(),
      ],
    );
  }

  Widget _buildPortfolio() {
    return Text(
      Strings.portfolio,
      style: GoogleFonts.dancingScript(
          color: Colors.white70, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildCookies() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.cookie,
          size: 40,
          color: Colors.white,
        ),
        const SizedBox(
          width: 12.0,
        ),
        RichText(
          text: TextSpan(
              children: [
                TextSpan(
                    text: Strings.this_web,
                    style: screenText(
                        size: 12,
                        color: bgTextColor2,
                        weight: FontWeight.w500)),
                TextSpan(
                    text: Strings.cookies,
                    style: screenText(
                        size: 12,
                        color: Colors.white,
                        weight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough))
              ],
              style: screenText(
                  size: 12, color: bgTextColor2, weight: FontWeight.w500)),
        )
      ],
    );
  }

  Widget _buildDesign() {
    return Center(
      child: Text(
        Strings.design,
        style: bigText(
            size: MediaQuery.of(context).size.width * 0.27,
            color: bgTextColor,
            height: 1.2,
            weight: FontWeight.w900,
            letterspacing: 1),
      ),
    );
  }

  Widget _buildAboutMe({int quarterTurns = 3, required double size}) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: Text(
        Strings.mobile_dev,
        style: screenText(
            size: size,
            lettspacing: 2,
            height: 2,
            color: bgTextColor2,
            weight: FontWeight.normal),
      ),
    );
  }

  Widget _buildHello({required double size}) {
    return RichText(
        text: TextSpan(
            text: Strings.hello,
            style: bigText(
                color: Colors.white,
                weight: FontWeight.w700,
                letterspacing: -8,
                height: 1,
                size: size),
            children: [
          TextSpan(
            text: '.',
            style: bigText(
                color: const Color(0xFFff5353),
                weight: FontWeight.w700,
                letterspacing: -8,
                height: 1,
                size: size),
          ),
          TextSpan(
            text: Strings.i_am_tushar,
            style: bigText(
                color: Colors.white,
                weight: FontWeight.w700,
                letterspacing: -8,
                height: 1,
                size: size),
          )
        ]));
  }
}
