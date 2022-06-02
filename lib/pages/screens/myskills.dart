// ignore_for_file: unused_element, unnecessary_string_interpolations, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/colors.dart';
import 'package:my_portfolio/constants/fonts.dart';
import 'package:my_portfolio/constants/typos.dart';
import 'package:my_portfolio/dimension/responsive.dart';
import 'package:my_portfolio/models/teaches.dart';
import 'package:my_portfolio/widgets/circle.dart';

class MySkills extends StatefulWidget {
  const  MySkills({Key? key}) : super(key: key);

  @override
  State<MySkills> createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills> {
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
      children: <Widget>[
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
          left: size.width * 0.16,
          top: size.width * 0.10,
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
          bottom: size.width * 0.13,
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
            width: size.width * 0.80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        EdgeInsets.only(bottom: 50.0, left: size.width * 0.06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        _buildSkillsList(context,
                            headingFontSize: size.width * 0.012),
                        SizedBox(height: size.height * 0.03),
                        _buildEducation(headingFontSize: size.width * 0.012),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      _buildSkills(size: size.width * 0.12),
                      const CircleWidget(
                        width: 60,
                        height: 60,
                        outerRadius: 25.0,
                        innerRadius: 8.0,
                        circleColor: Color(0xFF0098a6),
                      ),
                      const SizedBox(width: 30.0),
                    ],
                  ),
                ),
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
      children: <Widget>[
        Positioned(
          left: size.width * 0.40,
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
          padding: EdgeInsets.only(
            top: size.height * 0.20,
//            left: MediaQuery.of(context).size.height * 0.10,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.17),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSkills(size: size.width * 0.23),
                  SizedBox(height: size.height * 0.03),
                  _buildSkillsList(context,
                      headingFontSize: size.width * 0.022),
                  SizedBox(height: size.height * 0.03),
                  _buildEducation(headingFontSize: size.width * 0.022),
                ],
              ),
            ),
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
        children: <Widget>[
          Positioned(
            left: size.width * 0.20,
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
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSkills(size: size.width * 0.23),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    _buildEducation(headingFontSize: size.width * 0.25),
                    SizedBox(height: size.height * 0.03),
                    _buildSkillsList(context,
                        headingFontSize: size.width * 0.26),
                  ],
                ),
                SizedBox(height: size.height * 0.10),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDesign() {
    return Center(
      child: Text(
        Strings.skills,
        style: bigText(
            color: Colors.white,
            weight: FontWeight.w700,
            letterspacing: -8,
            height: 1,
            size: 200),
      ),
    );
  }

  Widget _buildSkills({required double size}) {
    return RichText(
        text: TextSpan(
            text: Strings.skills,
            style: bigText(
                color: Colors.white,
                weight: FontWeight.w700,
                letterspacing: -8,
                height: 1,
                size: size),
            children: [
          TextSpan(
              text: ":",
              style: bigText(
                  color: const Color(0xFFff5353),
                  weight: FontWeight.w700,
                  letterspacing: -8,
                  height: 1,
                  size: size))
        ]));
  }

  Widget _buildSkillsList(BuildContext context,
      {required double headingFontSize}) {
    final List<Widget> widgets = Strings.skillsList
        .map((skill) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: _buildSkillChip(context, skill),
            ))
        .toList();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSkillsContainerHeading(fontSize: headingFontSize),
        const SizedBox(height: 8.0),
        Wrap(
          runSpacing: 10,
          children: widgets),
      ],
    );
  }

  Widget _buildSkillsContainerHeading({required double fontSize}) {
    return Text(
      Strings.skills_i_have,
      style: screenText(
          size: fontSize,
          color: bgTextColor2,
          weight: FontWeight.normal,
          lettspacing: 1,
          height: 2),
    );
  }

  Widget _buildSkillChip(BuildContext context, String label) {
    return Chip(
      label: Text(label,
          style: screenText(
              color: bgColor,
              weight: FontWeight.normal,
              lettspacing: 1,
              size: ResponsiveLayout.isSmallScreen(context) ? 10.0 : 11.0)),
    );
  }

  Widget _buildEducation({required double headingFontSize}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildEducationContainerHeading(fontSize: headingFontSize),
        const SizedBox(height: 8.0),
        _buildEducationSummary(),
        const SizedBox(height: 8.0),
        _buildEducationTimeline(headingFontSize: headingFontSize)
      ],
    );
  }

  Widget _buildEducationContainerHeading({required double fontSize}) {
    return Text(
      Strings.experience,
      style: screenText(
          size: fontSize,
          color: bgTextColor2,
          weight: FontWeight.normal,
          lettspacing: 1,
          height: 2),
    );
  }

  Widget _buildEducationSummary() {
    return Text(
      'Working as in Intern and as a Developer.',
      style: screenText(
          size: 15,
          color: Colors.white,
          weight: FontWeight.normal,
          lettspacing: 1,
          height: 2),
    );
  }

  Widget _buildEducationTimeline({required double headingFontSize}) {
    final widgets = Strings.educationList
        .map(
          (education) => _buildEducationTile(
            education: education,
            headingFontSize: headingFontSize,
          ),
        )
        .toList();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: widgets,
    );
  }

  Widget _buildEducationTile(
      {required Education education, required double headingFontSize}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('${education.post}',
              style: screenText(
                  size: 20,
                  color: Colors.white,
                  weight: FontWeight.normal,
                  lettspacing: 1,
                  height: 2)),
          Text(
            '${education.organization}',
            style: screenText(
                size: 12,
                color: bgTextColor2,
                weight: FontWeight.normal,
                lettspacing: 1,
                height: 2),
          ),
          Text(
            '${education.from}-${education.to}',
            style: screenText(
                size: 12,
                color: bgTextColor2,
                weight: FontWeight.normal,
                lettspacing: 1,
                height: 2),
          ),
        ],
      ),
    );
  }
}
