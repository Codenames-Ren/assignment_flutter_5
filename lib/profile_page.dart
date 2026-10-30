import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});

  final String userName = "Bayu Sukma";
  final String role = "Junior Backend Developer";

  final List<String> experiences = [
    "Backend Developer GRPL - Global Institute",
    "Solo Project Assignment - ArcStream Project",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileAvatar(userName: userName, role: role),

        const SizedBox(height: 6),

        Text(
          userName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          role,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 24),

        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Project Experiences",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),

        const Divider(height: 12),

        Flexible(
          child: ListView.builder(
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                margin: const EdgeInsets.symmetric(vertical: 2),
                child: ListTile(
                  leading: const Icon(Icons.work, color: Colors.blueAccent),
                  title: Text(experiences[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String userName;
  final String role;

  const ProfileAvatar({super.key, required this.userName, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Fitur Edit belum tersedia saat ini."),
                ),
              );
            },
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
          ),
          const SizedBox(height: 24),

          const ProfileStats(),
        ],
      ),
    );
  }
}

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const StatItem(count: "2", label: "Project"),
          const SizedBox(width: 24),
          const StatItem(count: "1.5K", label: "Followers"),
          const SizedBox(width: 24),
          StatItem(count: "10", label: "Following"),
        ],
      ),
    );
  }
}

class StatItem extends StatelessWidget {
  final String count;
  final String label;

  const StatItem({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
