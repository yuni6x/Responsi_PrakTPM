import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.poster),
            SizedBox(height: 16.0),
            Text(
              'Year: ${movie.year}',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Plot:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(movie.plot),
            SizedBox(height: 16.0),
            Text(
              'Actors:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            // Text(movie.actors),
          ],
        ),
      ),
    );
  }
}
