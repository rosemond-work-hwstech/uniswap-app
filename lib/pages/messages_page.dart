import 'package:flutter/material.dart';

// 🔹 Chat Model
class Chat {
  final String name;
  final String message;
  final String time;
  final String image;

  Chat({
    required this.name,
    required this.message,
    required this.time,
    required this.image,
  });
}

// 🔹 Sample Chat Data
final List<Chat> chatList = [
  Chat(
    name: "Wade Warren",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/CAR.jpg",
  ),
  Chat(
    name: "Jerome Bell",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/tablet.jpg",
  ),
  Chat(
    name: "Courtney Henry",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/watch.jpg",
  ),
  Chat(
    name: "Annette Black",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/tv.jpg",
  ),
  Chat(
    name: "Jacob Jones",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/wardrobe.jpg",
  ),
  Chat(
    name: "Cody Fisher",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/foldable laptop.jpg",
  ),
  Chat(
    name: "Kathryn Murphy",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/top.jpg",
  ),
  Chat(
    name: "Albert Flores",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/watch.jpg",
  ),
  Chat(
    name: "Leslie Alexander",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/wardrobe.jpg",
  ),
  Chat(
    name: "Leslie Alexander",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "images/tablet.jpg",
  ),
];

// 🔹 Messages Page with Search
class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredChats = chatList.where((chat) {
      final query = searchQuery.toLowerCase();
      return chat.name.toLowerCase().contains(query) ||
          chat.message.toLowerCase().contains(query);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          // 🔹 Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Search chats...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // 🔹 Chat List
          Expanded(
            child: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat.image),
                    radius: 24,
                  ),
                  title: Text(
                    chat.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(chat.message),
                  trailing: Text(
                    chat.time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatDetailPage(chat: chat),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Chat Detail Page
class ChatDetailPage extends StatelessWidget {
  final Chat chat;

  const ChatDetailPage({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.name),
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // 🔹 Chat Messages Placeholder
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [Text("Chat history will appear here...")],
            ),
          ),

          // 🔹 Message Input Area
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            color: Colors.grey[100],
            child: Row(
              children: [
                // Emoji Button
                IconButton(
                  icon: const Icon(Icons.emoji_emotions_outlined),
                  onPressed: () {},
                ),

                // Image Upload Button
                IconButton(
                  icon: const Icon(Icons.image_outlined),
                  onPressed: () {},
                ),

                // Voice Note Button
                IconButton(icon: const Icon(Icons.mic_none), onPressed: () {}),

                // Text Field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // Send Button
                IconButton(icon: const Icon(Icons.send), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
