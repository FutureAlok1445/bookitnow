import 'package:flutter/material.dart';

// This is the Profile screen where users check their account, bookings, and settings
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides the main screen background
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F8), // A light grey background
      
      // SafeArea prevents content from hiding underneath the phone's top notch or status bar
      body: SafeArea(
        
        // ----------- MAIN SCROLLABLE CONTENT VIEW -----------
        // This ensures the screen can scroll smoothly
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              
              // ----------- PROFILE HEADER CARD -----------
              // A white padded box showing user picture, greeting, and edit link
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  
                  // Adding a tiny shadow underneath the card
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                
                // Row splits card left (picture) and right (text)
                child: Row(
                  children: [
                    
                    // Circular user profile picture
                    const CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=200'),
                    ),
                    const SizedBox(width: 14),
                    
                    // Column stacks the Greeting text over the Edit text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hi!', 
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
                        ),
                        
                        // GestureDetector allows tapping exactly on the 'Edit Profile' text
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: const [
                              Text(
                                'Edit Profile',
                                style: TextStyle(color: Color(0xFFE61D53), fontSize: 13),
                              ),
                              SizedBox(width: 4),
                              Icon(Icons.edit, size: 13, color: Color(0xFFE61D53)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ----------- WHATSAPP TICKET CARD -----------
              // Shows a white card prompting the user to get tickets via WhatsApp
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                
                child: Row(
                  children: [
                    // Green WhatsApp style icon
                    const Icon(Icons.forum, color: Color(0xFF25D366), size: 32),
                    const SizedBox(width: 12),
                    
                    // Expanded makes this text take up the center space freely
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Get tickets on your mobile!', 
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Add your number to receive tickets on WhatsApp / SMS',
                            style: TextStyle(color: Colors.grey, fontSize: 12)
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    
                    // An 'Add' button to the far right
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text('Add', style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ----------- APP UPDATE CARD -----------
              // Instructs user there is an update available
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                
                child: Row(
                  children: [
                    const Icon(Icons.refresh, color: Colors.black54),
                    const SizedBox(width: 12),
                    const Text('App update available', style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 8),
                    
                    // The small blue box showing version number 'v1815'
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('v1815', style: TextStyle(color: Colors.blue, fontSize: 11)),
                    ),
                    
                    const Spacer(), // Pushes the following icon to the far right edge
                    const Icon(Icons.chevron_right, color: Colors.grey),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // ----------- SETTINGS OPTIONS MENU -----------
              // A long list of all other profile actions 
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
                  ],
                ),
                
                child: Column(
                  children: const [
                    ProfileMenuItem(menuIcon: Icons.confirmation_num_outlined, menuText: 'Your Bookings & Purchases'),
                    Divider(height: 1, indent: 50), // Standard grey line to split the items
                    ProfileMenuItem(menuIcon: Icons.tv, menuText: 'STREAM Library'),
                    Divider(height: 1, indent: 50),
                    ProfileMenuItem(menuIcon: Icons.credit_card, menuText: 'PLAY Credit Card'),
                    Divider(height: 1, indent: 50),
                    ProfileMenuItem(menuIcon: Icons.help_outline, menuText: 'Help Centre'),
                    Divider(height: 1, indent: 50),
                    ProfileMenuItem(menuIcon: Icons.card_giftcard, menuText: 'Rewards'),
                    Divider(height: 1, indent: 50),
                    ProfileMenuItem(menuIcon: Icons.local_offer_outlined, menuText: 'Offers'),
                    Divider(height: 1, indent: 50),
                    ProfileMenuItem(menuIcon: Icons.redeem, menuText: 'Gift Cards'),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ----------- HELPER WIDGETS -----------

// The custom widget mapping to a simple row in settings list
class ProfileMenuItem extends StatelessWidget {
  final IconData menuIcon;
  final String menuText;
  
  const ProfileMenuItem({super.key, 
    required this.menuIcon, 
    required this.menuText,
  });

  @override
  Widget build(BuildContext context) {
    // ListTile handles giving us standard left icon, main text, and trailing right icon nicely
    return ListTile(
      leading: Icon(menuIcon, color: Colors.black54, size: 22),
      title: Text(menuText, style: const TextStyle(fontSize: 14)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      
      // Makes the item clickable (with ripple effect)
      onTap: () {},
    );
  }
}
