import 'package:flutter/material.dart';
import 'package:uniswap/pages/post_item.dart';

// 🔹 Product Model
class Product {
  final String image;
  final String title;
  final String price;
  final String location;
  final String? tag;

  Product({
    required this.image,
    required this.title,
    required this.price,
    required this.location,
    required this.tag,
  });
}

// 🔹 Sample Product Data
final List<Product> hotDeals = [
  Product(
    image: 'images/headset.jpg',
    title: 'Oraimo Headphones',
    price: 'GHS 399',
    location: 'Victory Towers Hostel',
    tag: 'New',
  ),
  Product(
    image: 'images/tablet.jpg',
    title: 'Redmi tablet',
    price: 'GHS 650',
    location: 'Pent Block B',
    tag: 'Hot',
  ),
  Product(
    image: 'images/foldable laptop.jpg',
    title: 'Foldable laptop',
    price: 'GHS 80',
    location: 'Legon Hall',
    tag: 'Sale',
  ),
  Product(
    image: 'images/wardrobe.jpg',
    title: 'Wardrobe',
    price: 'GHS 1200',
    location: 'Jubilee Hall',
    tag: 'New',
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PostItemPage()),
          );
        },
        label: const Text("Post Item", style: TextStyle(color: Colors.white)),
        icon: const Icon(Icons.add, color: Colors.white),
        backgroundColor: const Color(0xFF264653),
      ),
      body: ListView(
        children: [
          // 🔹 Custom Top Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF264653),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Welcome, Bonse",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('images/headset.jpg'),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 🔹 Categories Scroll
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                CategoryItem(icon: Icons.computer, label: "Electronics"),
                CategoryItem(icon: Icons.chair, label: "Furniture"),
                CategoryItem(icon: Icons.book, label: "Books"),
                CategoryItem(icon: Icons.kitchen, label: "Kitchenware"),
                CategoryItem(icon: Icons.edit, label: "Stationery"),
                CategoryItem(icon: Icons.more_horiz, label: "More"),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // 🔹 Hot Deals Grid
          const SectionTitle(title: "Hot Deals"),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotDeals.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) {
                final product = hotDeals[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailPage(product: product),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
          ),

          // 🔹 Recently Viewed Scroll
          const SectionTitle(title: "Recently Viewed"),
          SizedBox(
            height: 310,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: hotDeals.length,
              itemBuilder: (context, index) {
                final product = hotDeals[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ProductCard(product: product, width: 150),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// 🔹 Category Item Widget
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 28, color: const Color(0xFF29434E)),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  final double width;

  const ProductCard({
    super.key,
    required this.product,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Product Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              product.image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // 🔹 Text Section
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  product.price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF264653),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  product.location,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 10),

                // 🔹 Tag Badge
                if (product.tag != null && product.tag!.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      product.tag!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Product Detail Page
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Product Details"),
        backgroundColor: const Color(0xFF264653),
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 🔹 Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              product.image,
              height: 400,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 16),

          // 🔹 Title & Price
          Text(
            product.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            product.price,
            style: const TextStyle(fontSize: 18, color: Colors.green),
          ),

          const SizedBox(height: 16),

          // 🔹 Condition & Description
          const Text("Condition: Excellent", style: TextStyle(fontSize: 14)),
          const SizedBox(height: 8),
          const Text(
            "Selling my Plastic Shoe rack, bought it in first year, in excellent condition, comes with original tools and packaging. Reach out to me if you want to buy.",
            style: TextStyle(fontSize: 14),
          ),

          const SizedBox(height: 24),

          // 🔹 Seller Info
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('images/top.jpg'),
                radius: 24,
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Phillip Gbeho",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Victory Towers Hostel",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 24),

          // 🔹 Message Button
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/messages');
            },
            icon: const Icon(Icons.message),
            label: const Text("Message"),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF264653),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
