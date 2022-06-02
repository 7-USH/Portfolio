// ignore_for_file: unused_field, prefer_final_fields, unused_element, avoid_web_libraries_in_flutter, prefer_typing_uninitialized_variables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/constants/typos.dart';
import 'package:my_portfolio/dimension/responsive.dart';
import 'package:my_portfolio/hover/hovering.dart';
import 'dart:html' as html;

import 'package:my_portfolio/widgets/circle.dart';

class Hire extends StatefulWidget {
  const Hire({Key? key}) : super(key: key);

  @override
  State<Hire> createState() => _HireState();
}

class _HireState extends State<Hire> {
  bool _isHovering = false;

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
            ? _buildHire()
            : const SizedBox.shrink(),
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
          left: size.width * 0.45,
          bottom: size.width * 0.12,
          child: const CircleWidget(
            width: 50,
            height: 50,
            outerRadius: 20.0,
            innerRadius: 4.0,
            circleColor: Color(0xFFb2ebf2),
          ),
        ),
        Center(
          child: SizedBox(
            width: size.width * 0.65,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 120.0),
                      child: Wrap(
                        children: [
                          const SizedBox(
                            width: 30.0,
                          ),
                          const CircleWidget(
                            width: 60,
                            height: 60,
                            outerRadius: 25.0,
                            innerRadius: 8.0,
                            circleColor: Color(0xFF0098a6),
                          ),
                          const SizedBox(width: 40.0),
                          _buildHireSummary(size: size.width * 0.06)
                        ],
                      ),
                    ))
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.17),
            child: Center(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildHireSummary(size: size.width * 0.10)],
            )),
          ),
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
              width: 0,
              height: 50,
              outerRadius: 20.0,
              innerRadius: 4.0,
              circleColor: Color(0xFFb2ebf2),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height * 0.20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHireSummary(size: size.width * 0.10),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.10,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHire() {
    return Center(
      child: Text(
        Strings.hire,
        style: bigText(
            size: 500,
            color: bgTextColor,
            height: 1.2,
            weight: FontWeight.w900,
            letterspacing: 1),
      ),
    );
  }

  Widget _buildHireSummary({required double size}) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (e) {
        setState(() {
          _isHovering = false;
        });
      },
      child: RichText(
        text: TextSpan(
            text: Strings.always_interested,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                html.window.open(Strings.menu_mail_link, Strings.menu_mail);
              },
            style: bigText(
                color: Colors.white,
                weight: FontWeight.w700,
                letterspacing: -4,
                height: 1.5,
                size: size),
            children: [
              TextSpan(
                  text: Strings.lets_talk,
                  recognizer: TapGestureRecognizer()
              ..onTap = () {
                html.window.open(Strings.menu_mail_link, Strings.menu_mail);
              },
                  style: bigText(
                      color: const Color(0xFFff5353),
                      weight: FontWeight.w700,
                      letterspacing: -4,
                      height: 1.5,
                      decoration: _isHovering
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                      size: size))
            ]),
      ),
    );
  }
}
