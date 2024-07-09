import 'package:doctormobile/components/appbar_title.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppbarTitle(),
        ],
      ),
    );
  }
}
