import 'package:flutter/cupertino.dart';
import 'package:flutter_boiler_plate/constants/colors.dart';
import 'package:flutter_boiler_plate/constants/dimensions.dart';

///Created by Naman Gupta on 21/4/21.

// this class contains the styling.

class ContainerStyle {
  // style for curve border container
  static BoxDecoration getBorderContainerStyle() {
    return BoxDecoration(
      border: Border.all(
        color: AppColors.black,
        width: Dimensions.size_2,
      ),
      borderRadius: BorderRadius.all(Radius.circular(Dimensions.size_16)),
    );
  }
}
