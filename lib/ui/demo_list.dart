import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boiler_plate/ui/shimmers/shimmer_custom_view.dart';
import 'package:flutter_boiler_plate/widgets/shimmer_loading.dart';

///Created by Naman Gupta on 21/4/21.

// this class shows the list with shimmer effect.

class DemoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new DemoListState();
  }
}

class DemoListState extends State<DemoList> {
  bool isLoading = true;
  @override
  void initState() {
    Timer(Duration(seconds: 4), () => changeValue());
    super.initState();
  }

  changeValue() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoading(Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView(),
                    ShimmerCustomView()
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
