import 'package:flutter/material.dart';
import 'package:coffeestore/more_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Shop',
      theme: ThemeData(
      ),
      home: MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2F2F2F),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            Row(
              children: [
                Text(
                  'Bilzen, Tanjungbalai',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/profile.png'), // Replace with actual image
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xFFF1F1F1),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 351,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: Image.asset('assets/settings.png', height:20,),
                      hintText: 'Search coffee',
                      hintStyle:const TextStyle(color: Colors.white,),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 175, 175, 175),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Stack(
                children: [
                  Image.asset('assets/promo.png', width: double.infinity, fit: BoxFit.cover),
                  Container(
                    color: Colors.black45,
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                const SizedBox(width: 16),
                CategoryChip(label: 'Cappuccino', isSelected: true),
                CategoryChip(label: 'Macchiato'),
                CategoryChip(label: 'Latte'),
                CategoryChip(label: 'Americano'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio:0.65,
                ),
                itemBuilder: (context, index) {
                  return CoffeeCard();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF1F1F1),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/Home.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Heart.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Bag.png', height: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/Notification.png', height: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;

  const CategoryChip({super.key, required this.label, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        label: Text(label),
        backgroundColor: isSelected ? const Color(0xffC67C4E) : Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), 
          side: BorderSide.none, 
        ),
      ),
      );
  }
}

class CoffeeCard extends StatelessWidget {
  const CoffeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 270, 
        child: Card(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset('assets/coffeecup.png',
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                const Text(
                  'Cappuccino',
                  style: TextStyle(
                    fontSize: 20.0, // Adjusted font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'with Chocolate',
                  style: TextStyle(
                    fontSize: 14.0, // Adjusted font size
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text(
                      '\$4.53',
                      style: TextStyle(
                        fontSize: 18.0, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F2F2F),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                width: 45.0, 
                height: 40.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        backgroundColor: const Color(0xFFC67C4E),
                        padding: EdgeInsets.zero, 
                      ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
