import 'package:flutter/material.dart';

// This is the ticket booking form screen
class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  // Exp 4: formKey is required to trigger validation on all form fields inside our form
  final formKey = GlobalKey<FormState>();

  // Simple string variables to store what the user typed in the boxes
  String nameText = '';
  String emailText = '';
  String phoneText = '';

  // This function runs when "Submit" is clicked
  void validateAndSubmit() {
    
    // Exp 4: formKey.currentState.validate() checks if all inputs pass their checks
    if (formKey.currentState!.validate()) {
      
      // Save form answers into our String variables
      formKey.currentState!.save();
      
      // Show Success Dialog using simple Flutter Material
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Success!'),
            content: Text('Ticket Booked for $nameText!\nWe will message $phoneText.'),
            actions: [
              TextButton(
                onPressed: () {
                  // This pops the alert dialog window closed
                  Navigator.pop(context);
                  
                  // This kicks the user back home by clearing the route stack
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
                child: const Text('Awesome', style: TextStyle(color: Color(0xFFE61D53))),
              )
            ],
          );
        }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Enter Details', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        
        // Exp 4: Form Widget wrapper holding all the text inputs together
        child: Form(
          key: formKey,
          child: Column(
            children: [
              
              // ----------- NAME FIELD -----------
              // Exp 4: TextFormField for capturing string inputs safely
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
                
                // Exp 4: This validator runs when "Confirm" is clicked
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name'; // Shows red error text if empty
                  }
                  return null; // Means 'no error' (passed)
                },
                
                // Triggers when save() is called above
                onSaved: (value) {
                  nameText = value!;
                },
              ),
              const SizedBox(height: 20),

              // ----------- EMAIL FIELD -----------
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  } else if (!value.contains('@')) {
                    return 'Email must have @ symbol';
                  }
                  return null;
                },
                onSaved: (value) {
                  emailText = value!;
                },
              ),
              const SizedBox(height: 20),

              // ----------- PHONE FIELD -----------
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return 'Please enter full 10-digit number';
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneText = value!;
                },
              ),
              const SizedBox(height: 40),

              // ----------- SUBMIT BUTTON -----------
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFE61D53)),
                  onPressed: validateAndSubmit,
                  child: const Text('Confirm Booking', style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
