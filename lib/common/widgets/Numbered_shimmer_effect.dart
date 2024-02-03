import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NumberedShimmerWidgets extends StatelessWidget {
  final int count;
  final double height;
  const NumberedShimmerWidgets({
    super.key,
    required this.height,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: count, // Number of shimmer items to show
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        );
      },
    );
  }
}
