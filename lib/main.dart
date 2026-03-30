import 'package:flutter/material.dart';

import 'importData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImportDataFrom()
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 15),
              _buildSearch(),
              const SizedBox(height: 15),
              _buildCategories(),
              const SizedBox(height: 15),
              Expanded(child: _buildGrid()),
            ],
          ),
        ),
      ),
    );
  }

  // Header
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Foodgo",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              "Order your favourite food!",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        const CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(
            "https://i.pravatar.cc/150?img=3",
          ), // dummy image
        ),
      ],
    );
  }

  // Search Bar
  Widget _buildSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }

  // Categories
  Widget _buildCategories() {
    List<String> categories = ["All", "Combos", "Sliders", "Classic"];

    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;
          return Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 18),
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              categories[index],
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          );
        },
      ),
    );
  }

  Widget _Category() {
    List<String> list = ["Apple", "Banana", "sliders"];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) {
          bool isSelected = index == 0;

          return Container(
            margin: EdgeInsets.only(right: 10),
            padding: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: isSelected ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),

            alignment: Alignment.center,
            child: Text(
              list[index],
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          );
        },
      ),
    );
  }

  // Grid Items
  Widget _buildGrid() {
    List<Map<String, dynamic>> items = [
      {
        "name": "Cheeseburger",
        "brand": "Wendy's Burger",
        "price": "4.9",
        "image":
            "https://tse1.mm.bing.net/th/id/OIP.1veISMzXjKlX1e1j6Q_cKwHaHa?pid=ImgDet&w=181&h=181&c=7&dpr=1.5&o=7&rm=3",
      },
      {
        "name": "Hamburger",
        "brand": "Veggie Burger",
        "price": "4.8",
        "image":
            "https://tse1.mm.bing.net/th/id/OIP.1veISMzXjKlX1e1j6Q_cKwHaHa?pid=ImgDet&w=181&h=181&c=7&dpr=1.5&o=7&rm=3",
      },
      {
        "name": "Hamburger",
        "brand": "Chicken Burger",
        "price": "4.6",
        "image":
            "https://tse1.mm.bing.net/th/id/OIP.1veISMzXjKlX1e1j6Q_cKwHaHa?pid=ImgDet&w=181&h=181&c=7&dpr=1.5&o=7&rm=3",
      },
      {
        "name": "Hamburger",
        "brand": "Chicken Burger",
        "price": "4.5",
        "image":
            "https://tse1.mm.bing.net/th/id/OIP.1veISMzXjKlX1e1j6Q_cKwHaHa?pid=ImgDet&w=181&h=181&c=7&dpr=1.5&o=7&rm=3",
      },
    ];

    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        var item = items[index];

        return Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Image.network(item["image"])),
              Text(
                item["name"],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                item["brand"],
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      Text(item["price"]),
                    ],
                  ),
                  const Icon(Icons.favorite_border),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // Bottom Navigation
  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      color: Colors.red,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
            SizedBox(width: 40),
            Icon(Icons.shopping_bag, color: Colors.white),
            Icon(Icons.favorite, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
