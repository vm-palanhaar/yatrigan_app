import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum AppIcon {
  profile(icon: Icons.person),
  feedback(icon: Icons.feedback),
  help(icon: Icons.help);

  const AppIcon({
    required this.icon,
  });

  final IconData icon;
}

enum IrIcon {
  railStation(icon: FontAwesomeIcons.landmarkFlag),
  train(icon: FontAwesomeIcons.train),
  spotTrain(icon: Icons.calendar_month),
  trainSchedule(icon: Icons.access_time),
  trainAmenities(icon: Icons.accessibility),
  stationStalls(icon: FontAwesomeIcons.store),
  stationAmenities(icon: Icons.info);

  const IrIcon({
    required this.icon,
  });

  final IconData icon;
}

enum ShopIcon {
  shop(icon: FontAwesomeIcons.store),
  inventory(icon: Icons.shopping_cart_rounded),
  info(icon: Icons.info);

  const ShopIcon({
    required this.icon,
  });

  final IconData icon;
}
