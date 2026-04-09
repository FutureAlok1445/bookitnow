import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'movies_screen.dart';
import 'live_events_screen.dart';
import 'profile_screen.dart';
import 'movie_detail_screen.dart';
import 'booking_screen.dart';
import 'ai_movie_suggester_screen.dart';

// This is the starting point of our app
void main() {
  runApp(const MyApp());
}

// This is the main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Exp 5: Named Routing - MaterialApp uses 'initialRoute' and 'routes'
    return MaterialApp(
      title: 'Book It Now',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE61D53)),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),

      // Exp 5: initialRoute tells the app which screen to open first
      initialRoute: '/home',

      // Exp 5: routes map lets us use Navigator.pushNamed('/movies')
      routes: {
        '/home': (context) => const MainScreen(),
        '/movies': (context) => const MoviesScreen(),
        '/detail': (context) => const MovieDetailScreen(),
        '/booking': (context) => const BookingScreen(),
        '/ai_suggester': (context) => const AiMovieSuggesterScreen(),
      },
    );
  }
}

// This screen holds the navigation bar at the bottom and switches between other screens
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabNumber = 0;

  final List<Widget> appTabs = const [
    HomeScreen(),
    MoviesScreen(),
    LiveEventsScreen(),
    ProfileScreen(),
  ];

  void changeScreen(int newTabNumber) {
    setState(() {
      currentTabNumber = newTabNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appTabs[currentTabNumber],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          currentIndex: currentTabNumber,
          selectedItemColor: const Color(0xFFE61D53),
          unselectedItemColor: Colors.grey.shade400,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 11,
          ),
          onTap: changeScreen,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation),
              label: 'Movies',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_num),
              label: 'Live Events',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
