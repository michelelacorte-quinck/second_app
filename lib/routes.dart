import 'package:flutter/material.dart';
import 'favorite_screen.dart';

Map<String, Widget Function(BuildContext)> appRoutes = <String, WidgetBuilder>{
  FavoriteScreen.routeName: (ctx) => const FavoriteScreen(),
};