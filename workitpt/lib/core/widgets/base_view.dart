import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  final String? titleText;
  final Color? appBarColor;
  final Color? color;
  final bool resizeToAvoidBottomInset;
  final bool hideAppBar;
  final WillPopCallback? onBackCallback;
  final List<Widget> actions;
  final EdgeInsets padding;
  final Widget? bottomSheet;
  final Widget? titleWidget;
  final Widget? bottomNavigationBar;
  final Widget? leading;
  final PreferredSizeWidget? bottomWidget;
  final double elevation;
  final bool automaticallyImplyiLeading;
  final Widget? floatingActionButton;

  const BaseView({
    super.key,
    this.automaticallyImplyiLeading = true,
    this.titleText,
    this.titleWidget,
    required this.body,
    this.appBarColor,
    this.color,
    this.resizeToAvoidBottomInset = true,
    this.onBackCallback,
    this.bottomSheet,
    this.padding = const EdgeInsets.all(16),
    this.actions = const [],
    this.bottomNavigationBar,
    this.bottomWidget,
    this.elevation = 2,
    this.leading,
    this.floatingActionButton,
    this.hideAppBar = false,
  });

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
          backgroundColor: color,
          extendBody: true,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: hideAppBar ? null : toolbar(context),
          body: Padding(padding: padding, child: body),
          floatingActionButton: floatingActionButton,
        ),
        onWillPop: onBackCallback,
      );

  PreferredSize toolbar(BuildContext context) => PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: automaticallyImplyiLeading,
          centerTitle: true,
          leading: leading,
          actions: actions,
          elevation: elevation,
          title:titleWidget?? Text(
            titleText ?? '',
          ),
          backgroundColor: appBarColor,
          bottom: bottomWidget,
        ),
        preferredSize: Size.fromHeight(bottomWidget != null
            ? 140.0
            : titleText != null
                ? 56.0
                : 0.0),
      );
}
