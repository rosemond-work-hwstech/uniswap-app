import 'package:flutter/material.dart';

//Product Model
class Product {
  final String image;
  final String title;
  final String price;
  final String seller;
  final bool isUrgent;
  final bool isStudentDeal;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.seller,
    this.isUrgent = false,
    this.isStudentDeal = false,
  });
}

//Sample Data
final List<Product> marketplaceItems = [
  Product(
    image: 'images/wardrobe.jpg',
    title: 'Wardrobe',
    price: 'GHS 120',
    seller: 'Kwame',
    isUrgent: true,
  ),
  Product(
    image: 'images/CAR.jpg',
    title: 'Car',
    price: 'GHS 250',
    seller: 'Ama',
    isStudentDeal: true,
  ),
  Product(
    image: 'images/tv.jpg',
    title: 'Television',
    price: 'GHS 90',
    seller: 'Kojo',
    isUrgent: true,
  ),
  Product(
    image: 'images/laptop.jpg',
    title: 'LG laptop',
    price: 'GHS 180',
    seller: 'Esi',
    isUrgent: true,
  ),
];

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  String searchQuery = '';
  final List<String> filters = ['Price', 'Category', 'Condition', 'Recency'];

  @override
  Widget build(BuildContext context) {
    final filteredItems = marketplaceItems.where((item) {
      return item.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      body: Column(
        children: [
          // 🔹 Title Bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            color: const Color(0xFF264653),
            child: const Text(
              'Browse Items',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          //Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Search items...',
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

          //Filter Chips
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: filters.map((filter) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(
                      filter,
                      style: const TextStyle(color: Colors.white),
                    ),
                    selected: false,
                    backgroundColor: const Color(0xFF264653),
                    onSelected: (val) {
                      // TODO: Implement filter logic
                    },
                  ),
                );
              }).toList(),
            ),
          ),

          const SizedBox(height: 16),

          //Item Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = filteredItems[index];
                return _buildProductCard(product);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Image (fills half the card height)
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Image.asset(
                product.image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          //Text & Badges (fills other half)
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Seller: ${product.seller}",
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),

                  Row(
                    children: [
                      if (product.isUrgent) _buildBadge("Urgent", Colors.red),
                      if (product.isStudentDeal)
                        _buildBadge("Student Deal", Colors.blue),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadge(String label, Color color) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
