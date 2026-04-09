import 'dart:convert'; // Import this to convert data into JSON format and decode JSON
import 'package:http/http.dart'
    as http; // Import the standard HTTP package to send internet requests

// Exp 12: Fetching Data from API using HTTP and JSON Parsing
// This class contains the logic to connect to the Gemini AI API
class GeminiService {
  // Put your real Gemini API key here inside the quotes
  // Never hardcode your API key here again!
  static const String apiKey = String.fromEnvironment('GEMINI_API_KEY');

  // Future means this function takes time to finish, so it runs in the background (asynchronous)
  // It promises to return a List of Maps (our movie data) eventually when it's ready.
  static Future<List<Map<String, String>>> getAIRecommendations(
    // We expect the user to pass in a string representing their favorite movie
    String movieName,
  ) async {
    // We build the full URL required to talk to Gemini API, adding our API key securely.
    // The v1beta and gemini-2.0-flash endpoint is crucial to avoid a 404 error
    final apiUrl = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemma-3-27b-it:generateContent?key=$apiKey',
    );

    // We make the HTTP POST request. POST means we are sending data (our prompt) to the server.
    // await means wait here until the internet server replies back
    final response = await http.post(
      apiUrl, // The destination URL
      headers: {
        // Headers tell the server we are talking in JSON format
        'Content-Type': 'application/json',
      },
      // jsonEncode turns our Dart Map into pure JSON text string for the body format.
      // This is exactly the request format the user requested to prevent 404s
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "Suggest a movie like $movieName with a one line reason",
              }, // This is the text we send to the AI
            ],
          },
        ],
      }),
    );

    // If the HTTP status code is 200, it means the request was a success! (OK)
    if (response.statusCode == 200) {
      // jsonDecode takes the giant text from server and parses it into a Dart Map (JSON Parsing)
      final decodedData = jsonDecode(response.body);

      // We dig through the complex Gemini response JSON to find exactly our text output
      final aiReplyText =
          decodedData['candidates'][0]['content']['parts'][0]['text'];

      // We return exactly 1 item in our List as the prompt returns a single string of both title and reasoning
      return [
        {
          "title":
              "Movie Suggestion", // Adding a static title since the AI returns reasoning + movie title together
          "description": aiReplyText
              .toString()
              .trim(), // This holds the one line reason from AI
        },
      ];
    } else if (response.statusCode == 429) {
      // 429 specifically means "Too Many Requests". You hit the free tier quota limit!
      throw Exception(
        'AI Rate Limit Exceeded (Error 429). You asked too many questions too fast, or your free daily quota is over. Please wait a minute and try again.',
      );
    } else {
      // If the server answered but the status code is not 200 (like 404 or 500), we throw an error message.
      throw Exception(
        'Failed to communicate with AI API. Status Code: ${response.statusCode}',
      );
    }
  }
}
