import 'package:flutter/material.dart';

class AppComponestsSizes {
  
  final BuildContext context;

  final double currentDevelopmentDeviceWidth = 360.0;

  final double currentDevelopmentDeviceHeight = 716.0;

  AppComponestsSizes(this.context);

// these two methods allow for visulal consistncy across devices of different screen sizes means the placement of elements as apperaing visually in dev mode
// will appera at same places visually in differnt devices in production

  double runningDeviceDimensionAdjustedWidth(
      double devDeviceElementsPlacementWidth) {
    final double widthOfActualRunningDEvice = MediaQuery.of(context).size.width;
    final double adjustedWidth =
        (widthOfActualRunningDEvice * devDeviceElementsPlacementWidth) /
            currentDevelopmentDeviceWidth;
    return adjustedWidth.ceilToDouble();
  }

  double runningDeviceDimensionAdjustedHeight(
      double devDeviceElementsPlacementHeight) {
    final double heightOfActualRunningDEvice = MediaQuery.of(context).size.height;
    final double adjustedHeight =
        (heightOfActualRunningDEvice * devDeviceElementsPlacementHeight) /
            currentDevelopmentDeviceHeight;
    return adjustedHeight.ceilToDouble();
  }

}
