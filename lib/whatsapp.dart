import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 255, 255, 1),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color.fromARGB(255, 16, 243, 39),
        ),
      ),
      home: const WhatsAppHome(),
    );
  }
}

class WhatsAppHome extends StatefulWidget {
  const WhatsAppHome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WhatsAppHomeState createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: Color.fromARGB(255, 0, 0, 0)),
        foregroundColor: Colors.black,
        surfaceTintColor: Colors.black,
        shadowColor: Colors.black,
        backgroundColor: const Color.fromARGB(255, 16, 243, 39),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search function logic
            },
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to Profile Screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Additional options
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Chat'),
            Tab(text: 'Status'),
            Tab(text: 'Panggilan'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for Floating Action Button (e.g., New Chat)
        },
        backgroundColor: const Color.fromARGB(255, 16, 243, 39),
        child: const Icon(Icons.message),
      ),
    );
  }
}

// Random names list for contacts
final List<String> contactNames = [
  'Radha',
  'Yudha',
  'Cak WId',
  'Michael',
  'Meisya',
  'Mb Komang',
  'Pak Budi',
  'Yoga',
  'Yayang',
  'Gung Windu',
  'Yuni',
  'Bu Sisca',
  'Mega',
];

// Function to get random colors for profile avatars
Color getRandomColor() {
  Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

// Function to get random time for each contact
String getRandomTime() {
  Random random = Random();
  int hours = random.nextInt(24);
  int minutes = random.nextInt(60);
  return '$hours:$minutes';
}

// Chats Screen
class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contactNames.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: null, // No image for others
            backgroundColor: index < 0 ? Colors.transparent : getRandomColor(),
            child: index >= 0
                ? Text(
                    contactNames[index][0].toUpperCase(),
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                  )
                : null,
          ),
          title: Text(contactNames[index]),
          subtitle: Text('Pesan Terakhir Dari ${contactNames[index]}'),
          trailing: Text(getRandomTime()), // Use random time for each contact
        );
      },
    );
  }
}

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Layar Status'));
  }
}

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Layar Panggilan'));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Nama Anda',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Status: Tersedia',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logic to edit profile
              },
              child: const Text('Edit Profil'),
            ),
          ],
        ),
      ),
    );
  }
}
