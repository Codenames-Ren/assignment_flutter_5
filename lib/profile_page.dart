import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String userName = "Bayu Sukma";
  String role = "Junior Backend Developer";

  void editProfile() {
    TextEditingController nameController = TextEditingController(
      text: userName,
    );

    TextEditingController roleController = TextEditingController(text: role);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Profile"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nama"),
              ),
              SizedBox(height: 24),
              TextFormField(
                controller: roleController,
                decoration: InputDecoration(labelText: "Role"),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  role = roleController.text;
                });
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    ).then((_) {
      nameController.dispose();
      roleController.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Profile"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: ProfileInfo(userName: userName, role: role, onEdit: editProfile),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String userName;
  final String role;
  final VoidCallback onEdit;

  const ProfileInfo({
    super.key,
    required this.userName,
    required this.role,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          ProfileAvatar(userName: userName, role: role, onEdit: onEdit),

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

          const ProfileStats(),

          const SizedBox(height: 24),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Project Experiences",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const Divider(height: 12),

          ExperienceCard(),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  final String userName;
  final String role;
  final VoidCallback onEdit;

  const ProfileAvatar({
    super.key,
    required this.userName,
    required this.role,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: onEdit,
            icon: const Icon(Icons.edit),
            label: const Text("Edit Profile"),
          ),
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
          const StatItem(count: "5", label: "Project"),
          const SizedBox(width: 24),
          const StatItem(count: "1.5K", label: "Followers"),
          const SizedBox(width: 24),
          StatItem(count: "100", label: "Following"),
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

class ExperienceCard extends StatelessWidget {
  ExperienceCard({super.key});

  final List<String> experiences = [
    "GRPL - Global Recognition of Prior Learning",
    "Arc Stream - Mobile Anime Streaming Apps",
    "My-Qur'an - Qur'an Reader Apps with Murrotal Audio Playback",
    "Sonata Violin - Course Management System Website",
    "Titik Rindang - Coffee Shop Management Website",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 2),
          child: ListTile(
            leading: const Icon(
              Icons.workspace_premium_sharp,
              color: Colors.blueAccent,
            ),
            title: Text(experiences[index]),
          ),
        );
      },
    );
  }
}
