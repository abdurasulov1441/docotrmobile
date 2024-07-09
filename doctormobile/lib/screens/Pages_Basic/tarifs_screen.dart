import 'package:doctormobile/components/appbar_title.dart';
import 'package:doctormobile/components/object_flat_container.dart';
import 'package:flutter/material.dart';

class SendRequestSafingScreen extends StatelessWidget {
  const SendRequestSafingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppbarTitle(),
          ObjectFlatContainer(
            image: 'assets/images/image.png',
            text: 'Obyektingizni qo\'riqlovga topshiring',
            route: '/object_security',
          ),
          ObjectFlatContainer(
            image: 'assets/images/flat.png',
            text: 'Xonadoningizni qo\'riqlovga topshiring',
            route: '/flat',
          ),
        ],
      ),
    );
  }
}
