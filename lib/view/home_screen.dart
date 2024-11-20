import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_ui_playeer/view/video_screen.dart';


import '../Controller/video_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Videos'),
      ),
      body: homeProvider.movies.isEmpty
          ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: homeProvider.movies.length,
        itemBuilder: (context, index) {
          final movie = homeProvider.movies[index];
          return ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: movie.thumb.startsWith('http')
                        ? AssetImage(movie.thumb)
                        : NetworkImage('https://www.shutterstock.com/image-vector/play-button-icon-vector-illustration-600nw-1697833306.jpg'),

                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(movie.title),
            subtitle: Text(movie.subtitle),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}