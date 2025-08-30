import 'package:flutter/material.dart';

// class MessagesPage extends StatelessWidget {
//   const MessagesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: Text('Messages'));
//   }
// }

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
    image: "assets/user1.jpg",
  ),
  Chat(
    name: "Jerome Bell",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user2.jpg",
  ),
  Chat(
    name: "Courtney Henry",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user3.jpg",
  ),
  Chat(
    name: "Annette Black",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user4.jpg",
  ),
  Chat(
    name: "Jacob Jones",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user5.jpg",
  ),
  Chat(
    name: "Cody Fisher",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user6.jpg",
  ),
  Chat(
    name: "Kathryn Murphy",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user7.jpg",
  ),
  Chat(
    name: "Albert Flores",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user8.jpg",
  ),
  Chat(
    name: "Leslie Alexander",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user9.jpg",
  ),
  Chat(
    name: "Leslie Alexander",
    message: "Hello bro I need my charger head",
    time: "4:20pm",
    image: "assets/user10.jpg",
  ),
];

// 🔹 Messages Page
class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final chat = chatList[index];
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
              // Navigate to Chat Detail Page
            },
          );
        },
      ),
    );
  }
}
