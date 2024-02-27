// NamazDetailsPage.dart

import 'package:flutter/material.dart';

class NamazDetailsPage extends StatelessWidget {
  final Map<String, String> namazDetails;

  NamazDetailsPage(this.namazDetails);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('নামাজ '),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Topic:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              namazDetails['topic']!,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'বিবরণ:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              namazDetails['content']!,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
