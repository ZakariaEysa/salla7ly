import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../application_theme/theme_extention.dart';

class ScaffoldF extends StatelessWidget {
  const ScaffoldF({
    super.key,
    this.bottomNavigationBar,
    required this.body,
    this.appBar,
    this.actions,
    this.resizeToAvoidBottomInset,
  });
  final Widget? bottomNavigationBar;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final List<Widget>? actions;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).extension<GradientTheme>();
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
      appBar: appBar,
      bottomNavigationBar: bottomNavigationBar,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: theme?.backgroundGradient),
          child: body,
        ),
      ),
    );
  }
}
