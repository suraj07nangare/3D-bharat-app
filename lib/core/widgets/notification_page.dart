import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.favorite, color: Colors.red),
              ),
              title: Text("New Match"),
              subtitle: Text("Emma liked your profile."),
              trailing: Text("2m"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.chat_bubble_outline),
              ),
              title: Text("New Message"),
              subtitle: Text("Sophia sent you a message."),
              trailing: Text("10m"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_add),
              ),
              title: Text("New Follower"),
              subtitle: Text("Alex started following you."),
              trailing: Text("1h"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.local_fire_department),
              ),
              title: Text("Daily Streak"),
              subtitle: Text("You're on a 25-day streak! Keep it up."),
              trailing: Text("Today"),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.card_giftcard),
              ),
              title: Text("Special Offer"),
              subtitle: Text("Unlock Premium with 30% off today."),
              trailing: Text("Yesterday"),
            ),
          ),
        ],
      ),
    );
  }
}