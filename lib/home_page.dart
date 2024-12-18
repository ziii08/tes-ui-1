import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedBrand;
  String? selectedSeries;
  String? selectedModel;

  // Contoh data dropdown
  final List<String> brands = ['Brand A', 'Brand B', 'Brand C'];
  final List<String> series = ['Series X', 'Series Y', 'Series Z'];
  final List<String> models = ['Model 1', 'Model 2', 'Model 3'];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
        children: [
          _infoSection(size),
          const SizedBox(height: 50),
          _headerSection(),
          const SizedBox(height: 30),
          _findSection(size),
          const SizedBox(height: 30),
          _productSection(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _productSection() {
    return Column(
      children: [
        const Center(
          child: Text(
            'FEATURED PRODUCTS',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_left_outlined,
                size: 50,
              ),
            ),
            const SizedBox(width: 30),
            _buildProduct(),
            const SizedBox(width: 16),
            _buildProduct(),
            const SizedBox(width: 16),
            _buildProduct(),
            const SizedBox(width: 30),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_circle_right_outlined,
                size: 50,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildProduct() {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Gambar Produk
          Container(
            height: 150,
            width: double.infinity,
            color: Colors.blueGrey,
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              'assets/images/toner.png', // Gantilah URL ini dengan URL gambar
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama Produk
                const Text(
                  "HP 62 Black Ink Cartridge",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                // ID Produk
                const Text(
                  "(HPC2P04AE)",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 5),
                // Harga Produk
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "\$9.49",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Tombol Add to Cart
                    Expanded(
                      flex: 2,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            shape: const BeveledRectangleBorder()),
                        child: const Text(
                          "ADD TO CART",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _findSection(Size size) {
    return SizedBox(
      width: size.width,
      height: 320,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: size.width,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
            child: Column(
              children: [
                const Text(
                  'FIND THE RIGHT CARTRIDGES FOR YOUR PRINTER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Tabs UI
                      Container(
                        color: Colors.grey[200],
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.blue,
                                padding: const EdgeInsets.all(12.0),
                                child: const Center(
                                  child: Text(
                                    '3-Step Easy Search®',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Center(
                                child: Text('Search by Serial Number'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),

                      Row(
                        children: [
                          const SizedBox(width: 16),

                          // Dropdowns
                          Expanded(
                            child: _buildDropdown(
                                '1. Printer Brand', selectedBrand, brands,
                                (value) {
                              setState(() {
                                selectedBrand = value;
                                selectedSeries = null;
                                selectedModel = null;
                              });
                            }),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildDropdown(
                                '2. Printer Series', selectedSeries, series,
                                (value) {
                              setState(() {
                                selectedSeries = value;
                                selectedModel = null;
                              });
                            }),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildDropdown(
                                '3. Printer Model', selectedModel, models,
                                (value) {
                              setState(() {
                                selectedModel = value;
                              });
                            }),
                          ),
                          const SizedBox(width: 16),

                          // Button
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: const BeveledRectangleBorder(),
                                minimumSize: const Size(80, 55),
                                backgroundColor: Colors.orange,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                              ),
                              child: const Text(
                                'FIND CARTRIDGES',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, String? value, List<String> items,
      Function(String?) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: value,
        hint: Text(label),
        underline: const SizedBox(),
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ),
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 150.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.shopping_cart_checkout_outlined,
                size: 40,
                color: Colors.amber,
              ),
              const SizedBox(width: 8),
              const Text(
                'CARTIDGE KINGS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              SizedBox(
                width: 200,
                height: 40,
                child: TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      hintText: 'SEARCH',
                      suffixIcon: const Icon(Icons.search)),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(120, 45),
                      backgroundColor: Colors.orange,
                      shape: const BeveledRectangleBorder()),
                  onPressed: () {},
                  child: const Text(
                    'Cart (1)',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.blueAccent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: navBarItem(
                  title: 'HOME',
                  isActive: true,
                )),
                Expanded(
                    child: navBarItem(
                  title: 'INK CARTRIDGES',
                  isActive: false,
                )),
                Expanded(
                  child: navBarItem(
                    title: 'TONER CARTRIDGES',
                    isActive: false,
                  ),
                ),
                Expanded(
                  child: navBarItem(
                    title: 'CONTACT US',
                    isActive: false,
                  ),
                ),
                Expanded(
                  child: navBarItem(
                    title: 'LOGIN / REGISTER',
                    isActive: false,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget navBarItem({required String title, required bool isActive}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      color: isActive ? const Color(0xFF1B7ACD) : Colors.blue,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _infoSection(Size size) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 150),
      height: 50,
      color: Colors.grey.withOpacity(.3),
      child: Row(
        children: [
          _buildButtonNavBar(
            text: 'Franchise Opportunities',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _buildButtonNavBar(
            text: 'Help',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _buildButtonNavBar(
            text: 'Feedback',
            onPressed: () {},
          ),
          const Spacer(),
          _buildButtonNavBar(
            text: 'hello@email.com',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _buildButtonNavBar(
            text: '0800 022 2 022',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  TextButton _buildButtonNavBar({
    required String text,
    void Function()? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
