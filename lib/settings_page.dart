import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Account',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _settingTile(Icons.person, 'Profile', 'View and update your profile'),
          _settingTile(Icons.lock, 'Change Password', 'Update your account password'),
          _settingTile(Icons.logout, 'Logout', 'Sign out from the app'),

          const SizedBox(height: 24),
          const Text(
            'Preferences',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _settingTile(Icons.color_lens, 'App Theme', 'Light / Dark mode'),
          _settingTile(Icons.language, 'Language', 'Choose your language'),
          _settingTile(Icons.notifications, 'Notifications', 'Manage alerts and reminders'),

          const SizedBox(height: 24),
          const Text(
            'Support',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          _settingTile(Icons.help_outline, 'Help & Support', 'Get assistance'),
          _settingTile(Icons.info_outline, 'About App', 'Version, Terms & Privacy'),
        ],
      ),
    );
  }

  Widget _settingTile(IconData icon, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
        onTap: () {
          // Add navigation or dialogs as needed
        },
      ),
    );
  }
}
