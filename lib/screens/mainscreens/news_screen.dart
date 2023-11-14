import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final String apiKey =
      'pub_3287193af305f7f17695c2f3474deaeb9f0bd'; // Replace with your actual API key
  final String query = 'salem';
  final String country = 'in';
  List<dynamic> NewsScreen = [];

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsdata.io/api/1/news?apikey=$apiKey&q=$query&country=$country'));

    if (response.statusCode == 200) {
      setState(() {
        NewsScreen = json.decode(response.body)['results'];
      });
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News List'),
      ),
      body: ListView.builder(
        itemCount: NewsScreen.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text(index.toString()),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  NewsScreen[index]['pubDate'],
                  style: TextStyle(fontSize: 10),
                ),
                Text(NewsScreen[index]['title']),
              ],
            ),
          );
        },
      ),
    );
  }
}
