import 'package:flutter/material.dart';

class RetryWidget extends StatelessWidget {
  final String title;
  final String description;
  final Function retry;

  const RetryWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.retry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(description,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white.withOpacity(0.5))),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            onPressed: () {
              retry();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Rounded corners
                side: const BorderSide(color: Colors.white, width: 1), // Border
              ),
              elevation: 5, // Elevation (shadow effect)
            ),
            child: const Text(
              'Retry',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
