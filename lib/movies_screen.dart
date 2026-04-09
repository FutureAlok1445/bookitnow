import 'package:flutter/material.dart';

// This screen shows all available movies in a nice grid
class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Exp 9: MediaQuery reads the screen width to make our design responsive
    double screenWidth = MediaQuery.of(context).size.width;

    // Exp 9: If mobile (width < 600), show 2 columns. If wide screen (tablet/web), show 3 columns.
    int columnsToShow = (screenWidth < 600) ? 2 : 3;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Now Showing', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.psychology, color: Colors.blue),
            onPressed: () {
              Navigator.pushNamed(context, '/ai_suggester');
            },
          ),
        ],
      ),

      // Exp 3: GridView shows items in a wrapping columns structure
      body: GridView.count(
        crossAxisCount: columnsToShow,
        padding: const EdgeInsets.all(12),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.65, // Makes the box taller for movie posters
        // Sample list of movies shown directly via GridMovieCard Widget
        children: const [
          GridMovieCard(
            movieHeadline: 'Raakaasa',
            movieRating: '8.7',
            voteCount: '6K+',
            postURL: 'https://picsum.photos/seed/1m/200/300',
          ),
          GridMovieCard(
            movieHeadline: 'Super Duperr',
            movieRating: '9.7',
            voteCount: '890+',
            postURL: 'https://picsum.photos/seed/2m/200/300',
          ),
          GridMovieCard(
            movieHeadline: 'Rabb Da Radio 3',
            movieRating: '9.0',
            voteCount: '2K+',
            postURL: 'https://picsum.photos/seed/3m/200/300',
          ),
          GridMovieCard(
            movieHeadline: 'Munjya 2',
            movieRating: '8.3',
            voteCount: '1.2K+',
            postURL: 'https://picsum.photos/seed/4m/200/300',
          ),
          GridMovieCard(
            movieHeadline: 'Pushpa 3',
            movieRating: '9.1',
            voteCount: '10K+',
            postURL: 'https://picsum.photos/seed/5m/200/300',
          ),
          GridMovieCard(
            movieHeadline: 'Sky Force',
            movieRating: '8.8',
            voteCount: '4K+',
            postURL: 'https://picsum.photos/seed/6m/200/300',
          ),
        ],
      ),
    );
  }
}

// ----------- HELPER WIDGETS -----------

// This creates a single movie card formatted specifically for our multi-column grid
class GridMovieCard extends StatelessWidget {
  final String movieHeadline;
  final String movieRating;
  final String voteCount;
  final String postURL;

  const GridMovieCard({
    super.key,
    required this.movieHeadline,
    required this.movieRating,
    required this.voteCount,
    required this.postURL,
  });

  @override
  Widget build(BuildContext context) {
    // Exp 6: GestureDetector wraps our entire card to detect taps
    return GestureDetector(
      // Exp 6: onTap handles single presses, navigating to the movie details screen
      onTap: () {
        // Exp 5: the named route defined in main.dart
        Navigator.pushNamed(context, '/detail');
      },

      // Exp 6: onLongPress handles long pressing the card
      onLongPress: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Added $movieHeadline to Wishlist!')),
        );
      },

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // This 'Expanded' ensures the movie image takes up exactly as much space as it's allowed
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              // Exp 2: Image Widget loading picture via URL
              child: Image.network(
                postURL,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 8),

          // The rating stars, the rating number, and total votes
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 16),
              const SizedBox(width: 4),
              Text(
                movieRating,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 4),
              Text(
                '($voteCount Votes)',
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),

          const SizedBox(height: 4),

          // The title of the movie
          Text(
            movieHeadline,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            maxLines: 1, // Only show one line
            overflow:
                TextOverflow.ellipsis, // If the name is too long, add '...'
          ),
        ],
      ),
    );
  }
}
