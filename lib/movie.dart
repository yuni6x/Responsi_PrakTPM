import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Movie {
  final String title;
  final String year;
  final String poster;
  final String plot;

  Movie({
    required this.title,
    required this.year,
    required this.poster,
    required this.plot,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'],
      year: json['Year'],
      poster: json['Poster'],
      plot: json['Plot'],
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Movie> _movies = [];
  TextEditingController _searchController = TextEditingController();

  void _searchMovies(String query) async {
    final apiKey = '98697c7d';
    final url = Uri.parse('http://www.omdbapi.com/?apikey=$apiKey&s=$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['Response'] == 'True') {
        setState(() {
          _movies = (data['Search'] as List)
              .map((item) => Movie.fromJson(item))
              .toList();
        });
      } else {
        setState(() {
          _movies = [];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie Search')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    String query = _searchController.text;
                    _searchMovies(query);
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(_movies[index].poster),
                    title: Text(_movies[index].title),
                    subtitle: Text(_movies[index].year),
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

void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}
