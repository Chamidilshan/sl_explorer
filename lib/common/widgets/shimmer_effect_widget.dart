import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double height;
  const ShimmerWidget({
    super.key,
    required this.height
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5, // Number of shimmer items to show
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
