import 'package:flutter/material.dart';

// This is the Live Events screen for exploring sports, music shows, and things to do
class LiveEventsScreen extends StatelessWidget {
  const LiveEventsScreen({super.key});

  // This builds the entire screen
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the main layout for our screen
    return Scaffold(
      backgroundColor: Colors.white,

      // ----------- TOP APP BAR SECTION -----------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // This holds the title ('Live Events') and the user's location ('Kalyan')
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Live Events',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            // This row shows the location and a small arrow icon
            Row(
              children: const [
                Text(
                  'Kalyan',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFFE61D53),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.chevron_right, color: Color(0xFFE61D53), size: 16),
              ],
            ),
          ],
        ),

        // This is the search button shown on the top right
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // ----------- MAIN SCROLLABLE CONTENT SECTION -----------
      // This allows the user to scroll up and down
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ----------- HORIZONTAL EVENT CATEGORIES -----------
            // This box contains the row of circular category buttons
            SizedBox(
              height: 120,

              // This is a scrolling list that moves left-to-right
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),

                // These are the individual items in the scrolling list
                children: const [
                  EventCategoryIcon(
                    iconToShow: Icons.sports_soccer,
                    textLabel: 'Sports',
                  ),
                  EventCategoryIcon(
                    iconToShow: Icons.music_note,
                    textLabel: 'Music\nShows',
                  ),
                  EventCategoryIcon(
                    iconToShow: Icons.theater_comedy,
                    textLabel: 'Plays',
                  ),
                  EventCategoryIcon(
                    iconToShow: Icons.emoji_emotions,
                    textLabel: 'Comedy\nShows',
                  ),
                  EventCategoryIcon(
                    iconToShow: Icons.mic,
                    textLabel: 'Performa..',
                  ),
                  EventCategoryIcon(iconToShow: Icons.brush, textLabel: 'Art'),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ----------- 'THINGS TO DO' HIGHLIGHT SECTION -----------
            // This is a large, colored box highlighting a specific local event
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              padding: const EdgeInsets.all(16),

              // This decorates our box with a light purple color and rounded corners
              decoration: BoxDecoration(
                color: const Color(0xFFF0EFFF),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title row with a sparkle emoji
                  Row(
                    children: const [
                      Text(
                        'Things To Do In Your City',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3A3A9F),
                        ),
                      ),
                      SizedBox(width: 4),
                      Text('?', style: TextStyle(fontSize: 16)),
                    ],
                  ),

                  // Subtitle explaining this section
                  const Text(
                    'Here\'s what everyone is booking',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),

                  const SizedBox(height: 12),

                  // ----------- THE EVENT CARD (Inside the Highlight Section) -----------
                  // This is a white card showing an image and details of the event
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),

                    // Row places the image on left and text on right
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // The image box with rounded corners
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              image: NetworkImage(
                                'https://images.unsplash.com/photo-1516450360452-9312f5e86fc7?auto=format&fit=crop&q=80&w=300',
                              ),
                              fit: BoxFit
                                  .cover, // Makes sure the image fills the box neatly
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        // 'Expanded' makes sure text uses all leftover space without overflowing
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Della Sky Garden',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Food and Drinks',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                'At Della Resorts, a high-flying culinary adventure awaits...',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                '? 3540 onwards',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ----------- BOOK NOW BUTTON -----------
                  // A full-width button stretching across the bottom of the section
                  SizedBox(
                    width: double.infinity,

                    // OutlinedButton has a clear border instead of a solid colored background
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFE61D53)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Book Now',
                        style: TextStyle(
                          color: Color(0xFFE61D53),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ----------- INDIA'S TOP EVENTS SECTION -----------
            // The title pointing out "Top Events" along with a "See All" button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.trending_up,
                        color: Color(0xFFE61D53),
                        size: 20,
                      ),
                      SizedBox(width: 6),
                      Text(
                        'India\'s Top Events',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See All ›',
                      style: TextStyle(color: Color(0xFFE61D53)),
                    ),
                  ),
                ],
              ),
            ),

            // A side-scrolling list showing the top event cards
            SizedBox(
              height: 190,

              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),

                // Four sample event cards
                children: const [
                  SmallEventCard(
                    eventName: 'Sunburn Festival',
                    eventType: 'Music',
                    eventPrice: '?999',
                    eventImage: 'https://picsum.photos/seed/e1/300/400',
                  ),
                  SmallEventCard(
                    eventName: 'IPL 2026',
                    eventType: 'Sports',
                    eventPrice: '?500',
                    eventImage: 'https://picsum.photos/seed/e2/300/400',
                  ),
                  SmallEventCard(
                    eventName: 'Comedy Night',
                    eventType: 'Comedy',
                    eventPrice: '?399',
                    eventImage: 'https://picsum.photos/seed/e3/300/400',
                  ),
                  SmallEventCard(
                    eventName: 'Art Expo',
                    eventType: 'Art',
                    eventPrice: '?200',
                    eventImage: 'https://picsum.photos/seed/e4/300/400',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

// ----------- HELPER WIDGETS -----------

// This is a custom widget for displaying a circular icon button with a label underneath
class EventCategoryIcon extends StatelessWidget {
  final IconData iconToShow;
  final String textLabel;

  const EventCategoryIcon({
    super.key,
    required this.iconToShow,
    required this.textLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Separates each icon from its neighbors
      padding: const EdgeInsets.symmetric(horizontal: 8),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // A round background (CircleAvatar) for our icon
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFFF5F5F5),
            child: Icon(iconToShow, color: const Color(0xFFE61D53), size: 24),
          ),

          const SizedBox(height: 4),

          // Text label describing the category
          Text(
            textLabel,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

// Custom widget to display a single rectangular card for a top event
class SmallEventCard extends StatelessWidget {
  final String eventName;
  final String eventType;
  final String eventPrice;
  final String eventImage;

  const SmallEventCard({
    super.key,
    required this.eventName,
    required this.eventType,
    required this.eventPrice,
    required this.eventImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130, // Forces all cards to be the exact same width
      margin: const EdgeInsets.only(right: 12),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The image with perfectly rounded corners
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              eventImage,
              height: 140, // Height of the image portion
              width: 130,
              fit: BoxFit
                  .cover, // Makes sure image doesn't warp or stretch out of shape
            ),
          ),

          const SizedBox(height: 6),

          // Shows the title in bold black letters
          Text(
            eventName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1, // Stop text from wrapping onto a second line
            overflow: TextOverflow.ellipsis,
          ),

          // Shows the event type and price side-by-side in smaller grey letters
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                eventType,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
              Text(
                eventPrice,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
