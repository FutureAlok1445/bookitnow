import 'package:flutter/material.dart'; // Import standard set of Flutter visual tools
import 'gemini_service.dart'; // This connects the AI service file you just created

// We make a StatefulWidget because the screen will change (loading spinner, movies popping up, error)
// Exp 12: Fetching Data from API using HTTP and JSON parsing.
class AiMovieSuggesterScreen extends StatefulWidget {
  // super.key helps Flutter identify this widget out of all others
  const AiMovieSuggesterScreen({super.key});

  @override
  State<AiMovieSuggesterScreen> createState() => _AiMovieSuggesterScreenState();
}

class _AiMovieSuggesterScreenState extends State<AiMovieSuggesterScreen> {
  // Controller to read what the user types in the text box
  final TextEditingController searchController = TextEditingController();

  // A boolean (true or false) variable to know if we should show the loading spinner right now
  bool isLoading = false;

  // The list that will hold all the movie suggestions our AI gives us
  List<Map<String, String>> movieSuggestions = [];

  // A string to hold an error message, if for example the internet is off
  String errorMessage = '';

  // The function that gets called when the user hits 'Search'
  // It is async because getting internet answers takes an unpredictable amount of time (Future)
  Future<void> fetchSuggestions() async {
    // setState tells Flutter that something on screen changed, so it must redraw the UI
    setState(() {
      isLoading = true; // Turn the loading spinner on
      errorMessage = ''; // Clean up any old error messages
      movieSuggestions = []; // Clear old results
    });

    // We open a 'try' block. This tells Dart "try to run this internet code, but if anything breaks, go to catch"
    try {
      // Create a variable to hold the user's typed text.
      String userTypedMovie = searchController.text;

      // If the user typed nothing, we stop right here.
      if (userTypedMovie.isEmpty) {
        throw Exception('Please type a movie name first.');
      }

      // Call our HTTP Request to the Gemini API using the GeminiService file, wait (await) for it to finish!
      List<Map<String, String>> results =
          await GeminiService.getAIRecommendations(userTypedMovie);

      // Once the data arrives safely, we tell Flutter to redraw the screen (setState)
      setState(() {
        movieSuggestions =
            results; // Put the newly downloaded data into our list
        isLoading = false; // Turn the loading spinner off because we are done
      });
    } catch (error) {
      // The catch block activates if any errors or internet disconnections happened above

      // Again we setState to redraw the screen, this time displaying the error to the user
      setState(() {
        errorMessage = error
            .toString(); // Store the exact error message we caught
        isLoading = false; // Stop the spinner because it safely failed
      });
    }
  }

  // The build method draws everything standard onto the mobile phone screen
  @override
  Widget build(BuildContext context) {
    // Scaffold provides the standard structural layout template (App bar, body, background)
    return Scaffold(
      // AppBar creates the top header strip across the screen
      appBar: AppBar(
        title: const Text('AI Movie Suggester'), // The big text on the app bar
      ),
      // A safe padding so widgets don't stick completely to the side edges
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ), // Create 16 units of space all around
        // A Column widget places all children one below the other vertically
        child: Column(
          children: [
            // TextField is where the user taps to show keyboard and types words
            TextField(
              controller:
                  searchController, // Links our controller variable above to this text box
              decoration: const InputDecoration(
                labelText: 'Enter a movie you like', // The grey hint text
                border: OutlineInputBorder(), // A neat rectangular border box
              ),
            ),

            // SizedBox gives a tiny empty spacing 16 units tall below the textfield
            const SizedBox(height: 16),

            // ElevatedButton is a standard filled colored clickable button
            ElevatedButton(
              onPressed:
                  fetchSuggestions, // When tapped, runs our big internet-fetching function!
              child: const Text(
                'Ask Gemini AI',
              ), // The label painted on the button
            ),

            // Another vertical spacer
            const SizedBox(height: 16),

            // The 'if' statement inside a build method dynamically puts widgets on screen.
            // If isLoading is true, show the spinner (CircularProgressIndicator)
            if (isLoading) const CircularProgressIndicator(),

            // If errorMessage is not blank (isNotEmpty), we show a red text telling them what went wrong
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                ), // Makes the specific text color red
              ),

            // Expanded pushes its child to take up all remaining empty vertical space available
            Expanded(
              // ListView.builder creates a smooth scrolling vertical list perfectly built for multiple items
              child: ListView.builder(
                itemCount: movieSuggestions
                    .length, // Let the list know exactly how many items it has to draw
                // The itemBuilder acts like a loop, building a visual card for each individual movie fetched
                itemBuilder: (context, index) {
                  // Grab one specific movie from our list using the 'index' number (like 0, 1, 2, 3...)
                  final movie = movieSuggestions[index];

                  // Card widget creates a neat white box with a slight shadow shadow representing elevation
                  return Card(
                    // ListTile provides a standard row structure for images, titles, and subtitles
                    child: ListTile(
                      // title is the main bold header of the card tile
                      title: Text(
                        movie['title'] ??
                            'Unknown Title', // Grabs our JSON-parsed title
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // subtitle is the smaller text underneath the title
                      subtitle: Text(
                        movie['description'] ?? 'No Description',
                      ), // Grabs our JSON-parsed description
                    ),
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
