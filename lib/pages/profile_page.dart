import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Profile"),
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Profile Picture & Basic Info
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Girlie Bonse",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Student, KNUST - Kumasi",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Edit Profile
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF264653),
                ),
                child: const Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 🔹 Verified School ID Status
          Row(
            children: const [
              Icon(Icons.verified, color: Colors.green),
              SizedBox(width: 8),
              Text(
                "School ID Verified",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 🔹 Listings Section
          const Text(
            "My Listings",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_listingStat("Active", 4), _listingStat("Sold", 12)],
          ),

          const SizedBox(height: 24),

          // 🔹 Wishlist / Saved Items
          const Text(
            "Wishlist",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(3, (index) {
                return Container(
                  width: 100,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            'assets/sample.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          "Saved Item",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),

          const SizedBox(height: 24),

          // 🔹 Reviews Section
          const Text(
            "Reviews",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Column(
            children: List.generate(2, (index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/user1.jpg'),
                ),
                title: const Text("Buyer Name"),
                subtitle: const Text("Great seller! Item was as described."),
                trailing: const Icon(Icons.star, color: Colors.amber),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _listingStat(String label, int count) {
    return Column(
      children: [
        Text(
          "$count",
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}
