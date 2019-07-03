import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:z_components/config/z-platform.dart';

class ZNavigationBar extends StatelessWidget with PreferredSizeWidget {
  Widget _zNavigationBar;

  final Key key;
  final BuildContext context;
  final Widget leading;
  final bool automaticallyImplyLeading;
  final bool automaticallyImplyMiddle;
  final String previousPageTitle;
  final Widget middle;
  final Widget trailing;
  final Color backgroundColor;
  final EdgeInsetsDirectional padding;
  final Border border;
  final Color actionsForegroundColor;
  final bool transitionBetweenRoutes;
  final Widget title;
  final ShapeBorder shape;
  final List<Widget> actions;
  final Widget flexibleSpace;
  final PreferredSizeWidget bottom;
  final double elevation;
  final Brightness brightness;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final TextTheme textTheme;
  final bool primary;
  final bool centerTitle;
  final double titleSpacing;
  final double toolbarOpacity;
  final double bottomOpacity;

  ZNavigationBar({
    this.context,
    this.key,
    this.leading,
    this.bottom,
    this.flexibleSpace,
    this.actions,
    this.brightness,
    this.iconTheme,
    this.actionsIconTheme,
    this.elevation,
    this.automaticallyImplyLeading = true,
    this.automaticallyImplyMiddle = true,
    this.previousPageTitle,
    this.middle,
    this.trailing,
    this.border,
    this.backgroundColor = Colors.teal,
    this.padding,
    this.actionsForegroundColor,
    this.transitionBetweenRoutes = true,
    this.title,
    this.shape,
    this.bottomOpacity = 1.0,
    this.toolbarOpacity = 1.0,
    this.titleSpacing = NavigationToolbar.kMiddleSpacing,
    this.centerTitle,
    this.primary = true,
    this.textTheme,
  }) : super(key: key) {
    _zNavigationBar = new CupertinoNavigationBar(
      automaticallyImplyLeading: this.automaticallyImplyLeading,
      actionsForegroundColor: this.actionsForegroundColor,
      automaticallyImplyMiddle: this.automaticallyImplyMiddle,
      previousPageTitle: this.previousPageTitle,
      transitionBetweenRoutes: this.transitionBetweenRoutes,
      key: this.key,
      backgroundColor: this.backgroundColor,
      leading: new Container(child: leading,padding: EdgeInsets.only(left: 16.0)),
      middle: this.middle,
      trailing: new Container(child: trailing,padding: EdgeInsets.only(right: 16.0)),
      border: this.border,
      padding: this.padding ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return _zNavigationBar;
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
