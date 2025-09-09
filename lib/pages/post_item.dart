import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostItemPage extends StatefulWidget {
  const PostItemPage({super.key});

  @override
  State<PostItemPage> createState() => _PostItemPageState();
}

class _PostItemPageState extends State<PostItemPage> {
  final ImagePicker _picker = ImagePicker();
  final List<XFile> _images = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory;
  String? _selectedLocation;

  final List<String> _categories = [
    'Electronics',
    'Furniture',
    'Books',
    'Clothing',
    'Accessories',
  ];

  final List<String> _locations = [
    'Victory Towers Hostel',
    'Pent Hostel',
    'Bani Hostel',
    'Evandy Hostel',
    'Campus Hall',
  ];

  Future<void> _pickImage() async {
    final picked = await _picker.pickMultiImage();
    if (picked.isNotEmpty) {
      setState(() {
        _images.addAll(picked.take(5 - _images.length));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post New Item')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📸 Upload Section
            const Text(
              'Upload Photos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ..._images.map(
                  (img) => ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(img.path),
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                if (_images.length < 5)
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),

            // 📝 Title
            _buildTextField(
              label: 'Title',
              hint: 'What are you selling?',
              controller: _titleController,
            ),

            // 💰 Price
            _buildTextField(
              label: 'Price',
              hint: 'Enter Price (GHS)',
              controller: _priceController,
              keyboardType: TextInputType.number,
            ),

            // 🔽 Category Dropdown
            _buildDropdown(
              label: 'Category',
              value: _selectedCategory,
              items: _categories,
              onChanged: (val) {
                setState(() => _selectedCategory = val);
              },
            ),

            // 📝 Description
            _buildTextField(
              label: 'Description',
              hint: 'Describe your item...',
              controller: _descriptionController,
              maxLines: 3,
            ),

            // 📍 Location Dropdown
            _buildDropdown(
              label: 'Location',
              value: _selectedLocation,
              items: _locations,
              onChanged: (val) {
                setState(() => _selectedLocation = val);
              },
            ),

            const SizedBox(height: 30),

            // 📤 Post Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF264653),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  // TODO: Handle post logic
                },
                child: const Text(
                  'Post Item',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔧 Reusable TextField
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔧 Reusable Dropdown
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: value,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 14,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
