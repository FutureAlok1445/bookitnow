import 'package:flutter/material.dart';

// This is the movie details landing screen (Exp 5 Target)
class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Movie Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(20),
        
        // Exp 2: Column Widget organizes items vertically on the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // This pulls an image to act as the big movie banner
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://picsum.photos/seed/details/400/200', 
                width: double.infinity, 
                height: 200, 
                fit: BoxFit.cover
              ),
            ),
            const SizedBox(height: 20),

            // Large Title text
            const Text(
              'Blockbuster Movie',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            
            // The story description body text
            const Text(
              'Prepare for an action-packed adventure where heroes rise, explode cars, and save the world in this massive summer hit. Grab your popcorn and enjoy the ride!',
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const SizedBox(height: 40),
            
            // ----------- BOOK TICKET BUTTON -----------
            // This sizes the button to be full width
            SizedBox(
              width: double.infinity,
              height: 50,
              
              // Exp 2: Elevated Button Widget provides a raised, clickable box
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE61D53),
                ),
                
                // Exp 5: the button acts as a navigation trigger 
                onPressed: () {
                  
                  // Exp 5: Using Navigator.pushNamed to jump directly to our form
                  Navigator.pushNamed(context, '/booking');
                },
                child: const Text(
                  'Book Ticket Now', 
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
