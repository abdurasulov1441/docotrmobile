import 'package:doctormobile/components/appbar_title.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [AppbarTitle(), News()],
      ),
    );
  }
}

class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(
                      'assets/images/image1.jpg'), // Укажите путь к вашему изображению
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Lorem Ipsum is simply',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Lorem ipsum is simply dummy text of the printing and typesetting industry.',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time, size: 20),
                                SizedBox(width: 5),
                                Text('10:50 / 10.04.2024'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.favorite,
                                    color: Colors.red, size: 20),
                                SizedBox(width: 5),
                                Text('1525'),
                                SizedBox(width: 10),
                                Icon(Icons.comment, size: 20),
                                SizedBox(width: 5),
                                Text('152'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Батасил'),
                          //style: ElevatedButton.styleFrom(Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
