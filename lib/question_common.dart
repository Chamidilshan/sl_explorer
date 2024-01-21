import 'package:flutter/material.dart';

class Common extends StatelessWidget {
  final int numberOfPages;
  final int currentPage;
  final Function(int)? onPageChanged;

  const Common({
    required this.numberOfPages,
    required this.currentPage,
    this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              if (currentPage > 0) {
                onPageChanged?.call(currentPage - 1);
              }
            },
          ),
          SizedBox(width: 16.0),
          Row(
            children: List.generate(
              numberOfPages,
                  (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: index == currentPage ? Colors.orange : Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: index == currentPage ? Colors.white : Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              if (currentPage < numberOfPages - 1) {
                onPageChanged?.call(currentPage + 1);
              }
            },
          ),
        ],
      ),
    );
  }
}

