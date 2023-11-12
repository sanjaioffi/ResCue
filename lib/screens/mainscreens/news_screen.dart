import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rescue/controller/location_controller.dart';

class News {
  String title;
  String description;

  News({required this.title, required this.description});
}

class NewsScreen extends StatelessWidget {
  final List<News> newsList = [
    News(
      title: 'Heavy Rainfall Warning',
      description: 'Kerala to experience heavy rainfall in the next 48 hours.',
    ),
    News(
      title: 'Cyclone Alert',
      description:
          'Alert issued for a potential cyclone in the Arabian Sea near Kerala.',
    ),
    News(
      title: 'Temperature Drop',
      description:
          'Temperature expected to drop significantly in the coming days.',
    ),
    News(
      title: 'Flood Advisory',
      description:
          'Certain areas in Kerala are under a flood advisory due to rising water levels.',
    ),
    News(
      title: 'Thunderstorm Warning',
      description: 'Thunderstorms expected in various parts of Kerala.',
    ),
    News(
      title: 'Wind Speed Alert',
      description: 'High wind speeds anticipated in coastal areas of Kerala.',
    ),
    News(
      title: 'Tropical Storm Update',
      description:
          'Updates on the development of a tropical storm affecting Kerala.',
    ),
    News(
      title: 'Weather Forecast',
      description:
          'Check the latest weather forecast for Kerala and plan accordingly.',
    ),
    News(
      title: 'Monsoon Update',
      description: 'Latest updates on the monsoon progress in Kerala.',
    ),
    News(
      title: 'Weather Advisory',
      description: 'General weather advisory for residents of Kerala.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'Weather News',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '📍 ${Get.find<LocationController>().locationData}',
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(newsList[index].title),
                        subtitle: Text(newsList[index].description),
                      ),
                      Divider()
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
