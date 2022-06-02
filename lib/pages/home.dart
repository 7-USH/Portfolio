// ignore_for_file: unused_element, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/constants/typos.dart';
import 'package:my_portfolio/dimension/responsive.dart';
import 'package:my_portfolio/hover/hoverButton.dart';
import 'package:my_portfolio/hover/hovering.dart';
import 'package:my_portfolio/pages/screens/hire.dart';
import 'package:my_portfolio/pages/screens/intro.dart';
import 'package:my_portfolio/pages/screens/myabout.dart';
import 'package:my_portfolio/pages/screens/myskills.dart';
import 'package:my_portfolio/utils/screen_utils.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSmall = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                _buildBackground(),
                _buildBody(context, constraints),
                _buildMadeWith(
                    alignment: ResponsiveLayout.isSmallScreen(context)
                        ? Alignment.topLeft
                        : Alignment.bottomLeft),
                isSmall ? const SizedBox.shrink() : _buildSocialButtons(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider(),
        _buildVerticalDivider()
      ],
    );
  }

  Widget _buildVerticalDivider() {
    return Container(
      width: 2,
      height: double.maxFinite,
      color: Colors.black26,
      child: const VerticalDivider(
        color: Colors.black26,
      ),
    );
  }

  Widget _buildSocialButtons({
    int quarterTurns = 3,
    Axis axis = Axis.vertical,
    alignment = Alignment.centerRight,
  }) {
    return Align(
      alignment: alignment,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        direction: axis,
        children: <Widget>[
          _buildMenuItem(
              quarterTurns, Strings.menu_github_link, Strings.menu_github),
          _buildMenuItem(quarterTurns, Strings.menu_linked_in_link,
              Strings.menu_linked_in),
          _buildMenuItem(
              quarterTurns, Strings.menu_twitter_link, Strings.menu_twitter),
          _buildMenuItem(
              quarterTurns, Strings.menu_facebook_link, Strings.menu_facebook),
          _buildMenuItem(quarterTurns, Strings.menu_insta_link, Strings.menu_insta)
        ],
      ),
    );
  }

  Widget _buildMenuItem(int quarterTurns, String link, String title) {
    return RotatedBox(
      quarterTurns: quarterTurns,
      child: InkWell(
          onTap: () {
            html.window.open(link, title);
          },
          child: HoverButton(text: title)),
    );
  }

  Widget _buildBody(BuildContext context, BoxConstraints constraints) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(children: [
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: constraints.maxWidth, minHeight: constraints.maxHeight),
          child: ResponsiveLayout(
              largeScreen: _buildLargeScreen(context),
              mediumScreen: _buildMediumScreen(context),
              smallScreen: _buildSmallScreen(context),
              onSmallScreen: () {
                if (!isSmall) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmall = true;
                    });
                  });
                }
              },
              onMediumScreen: () {
                if (isSmall) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmall = false;
                    });
                  });
                }
              },
              onLargeScreen: () {
                if (isSmall) {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      isSmall = false;
                    });
                  });
                }
              }),
        ),
      ]),
    );
  }

  Widget _buildLargeScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Column(
            children: const [
              Expanded(flex: 1, child: Intro()),
              Expanded(flex: 1, child: MyAbout()),
              Expanded(flex: 1, child: MySkills()),
              Expanded(flex: 1, child: Hire())
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildMediumScreen(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: IntrinsicHeight(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            Intro(),
            MyAbout(),
            MySkills(),
            Hire(),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallScreen(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Intro(),
          const MyAbout(),
          const MySkills(),
          const Hire(),
          _buildSocialButtons(
              axis: Axis.horizontal,
              quarterTurns: 4,
              alignment: Alignment.center)
        ],
      ),
    );
  }

  Widget _buildMadeWith({Alignment alignment = Alignment.bottomLeft}) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 50.0,
        left: (ScreenUtil.getInstance().setWidth(40)),
      ),
      child: Align(
        alignment: alignment,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          color: const Color(0xFF1e1e1e),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.in_flutter,
                  style: screenText(
                      color: Colors.white70,
                      weight: FontWeight.normal,
                      lettspacing: 5,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(Strings.heart,
                    style: screenText(
                        color: Colors.white,
                        weight: FontWeight.normal,
                        lettspacing: 5,
                        decoration: TextDecoration.none)),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Text(
                  Strings.made_with,
                  style: screenText(
                      color: Colors.white70,
                      weight: FontWeight.normal,
                      lettspacing: 5,
                      decoration: TextDecoration.lineThrough),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
