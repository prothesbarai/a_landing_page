import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class MemberCardGradiantBgColor extends StatelessWidget {
  final List<Color> colors;
  const MemberCardGradiantBgColor({
    super.key,
    required this.colors
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Container( /// >>> ============================ Drawer BackGround Gradient Start Here =========================
          decoration: BoxDecoration(
            gradient: SweepGradient(
              center: AlignmentDirectional(1, -1),
              colors: colors,
              stops: [0.0, 0.2, 0.2, 0.3, 0.3, 0.6],
              startAngle: 0.9,
              endAngle: 6,
            ),
          ),
        ),
        /// <<< ============================ Drawer BackGround Gradient End Here ===========================

        Container( /// >>> ============================ Overlay on top of Gradient Start Here ==============
            color: AppColor.primaryColor.withAlpha(51)
        ),
        /// <<< ============================ Overlay on top of Gradient End Here ==========================

      ],
    );
  }
}
