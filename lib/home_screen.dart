import 'package:flutter/material.dart';

// This is the Home screen of the app where the user lands after opening the app
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'It All Starts Here!',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),

      // Exp 3: SingleChildScrollView makes the entire screen scrollable up and down
      body: SingleChildScrollView(
        // Exp 2: Column Widget organizes UI items vertically
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------- CATEGORY ROW SECTION -----------
            SizedBox(
              height: 110,
              // Exp 3: ListView creates a scrollable list of items (horizontal here)
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  // Exp 2: Use Icon inside a button-like category
                  CategoryButton(
                    iconToShow: Icons.play_circle_outline,
                    labelText: 'Stream',
                  ),
                  CategoryButton(
                    iconToShow: Icons.credit_card,
                    labelText: 'HSBC\nLounge',
                  ),
                  CategoryButton(
                    iconToShow: Icons.tour,
                    labelText: 'Attraction',
                  ),
                  CategoryButton(iconToShow: Icons.movie, labelText: 'Movies'),
                  CategoryButton(
                    iconToShow: Icons.sports_soccer,
                    labelText: 'Sports',
                  ),
                ],
              ),
            ),

            // ----------- STACK BANNER SECTION -----------
            Container(
              margin: const EdgeInsets.all(12),
              height: 180,
              width: double.infinity,

              // Exp 3: Stack Widget allows placing widgets on top of each other
              child: Stack(
                children: [
                  // Exp 2: Image widget showing the background banner
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1541845157-a6d2d100c931?auto=format&fit=crop&q=80&w=800',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Text stacked on the bottom of the image
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        // Exp 2: Text Widget
                        Text(
                          'The Fast Lane to Fun!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Zero Booking Fees on Water Parks!',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),

                  // "NEW" Badge stacked on the top right
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      color: const Color(0xFFE61D53),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: const Text(
                        'HOT',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ----------- RECOMMENDED MOVIES SECTION -----------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              // Exp 2: Row Widget positions text and button horizontally
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Movies',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text('See All ›', style: TextStyle(color: Color(0xFFE61D53))),
                ],
              ),
            ),

            // Scrolling row of movies
            SizedBox(
              height: 280,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: const [
                  MoviePosterCard(
                    movieTitle: 'Raakaasa',
                    ratingText: '8.7',
                    imageLink: 'https://picsum.photos/seed/a1/300/400',
                  ),
                  MoviePosterCard(
                    movieTitle: 'Super Duperr',
                    ratingText: '9.7',
                    imageLink: 'https://picsum.photos/seed/a2/300/400',
                  ),
                  MoviePosterCard(
                    movieTitle: 'Rabb Da Radio 3',
                    ratingText: '9.0',
                    imageLink: 'https://picsum.photos/seed/a3/300/400',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------- HELPER WIDGETS -----------
// Small circular category icons
class CategoryButton extends StatelessWidget {
  final IconData iconToShow;
  final String labelText;

  const CategoryButton({
    super.key,
    required this.iconToShow,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(iconToShow, size: 28, color: const Color(0xFF4A4A4A)),
          ),
          const SizedBox(height: 8),
          Text(
            labelText,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Shows a simple movie poster
class MoviePosterCard extends StatelessWidget {
  final String movieTitle;
  final String ratingText;
  final String imageLink;

  const MoviePosterCard({
    super.key,
    required this.movieTitle,
    required this.ratingText,
    required this.imageLink,
  });

  @override
  Widget build(BuildContext context) {
    // Exp 6: GestureDetector adds simple touch interactions
    return GestureDetector(
      // Exp 5: Navigate to details on tap
      onTap: () {
        Navigator.pushNamed(context, '/detail');
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageLink,
                height: 200,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  ratingText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              movieTitle,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
