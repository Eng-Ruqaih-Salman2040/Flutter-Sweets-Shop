
import 'package:flutter/material.dart';

import 'homepageRoq.dart';
import 'main_cartSample_roq.dart';

class ProfilePage_Roq extends StatelessWidget {
  const ProfilePage_Roq({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality( // Forces Right-to-Left (RTL) layout
        textDirection: TextDirection.rtl,
        child:
        Scaffold(
      appBar: AppBar(
        title: Text("الملف الشخصي"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView(
        children: [
          // Profile image
          const CircleAvatar(
            radius: 60.0,
            backgroundImage: NetworkImage(
                'https://wisehealthynwealthy.com/wp-content/uploads/2022/01/CreativecaptionsforFacebookprofilepictures.jpg'),
          ),

          // Profile name
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
              child: Text('Ruqaih Salman'),
            ),
          ),

          // Profile email
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
              child: Text('ruqaihsalman@example.com'),
            ),
          ),

          // Profile bio
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
            ),
          ),

          const Divider(),

          // Service
          ListTile(
            title: const Text('Order history'),
            onTap: () {
              // Go to order history page
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('Saved addresses'),
            onTap: () {
              // Go to saved addresses page
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('Payment methods'),
            onTap: () {
              // Go to payment methods page
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              // Go to settings page
            },
            trailing: const Icon(Icons.arrow_forward_ios),
          ),

          const Divider(),

          // Profile settings
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Edit profile button
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Edit Profile'),
                    onPressed: () {
                      // Handle the button press here.
                    },
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                // Logout button
                Expanded(
                  child: ElevatedButton(
                    child: const Text('Logout'),
                    onPressed: () => _navigateToSignIn(context: context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  // Goto SignIn Page
  void _navigateToSignIn({required BuildContext context}) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  SweetsShopAppRoq()),
    );
  }
}