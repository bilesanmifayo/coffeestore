import 'package:coffeestore/menu.dart';
import 'package:coffeestore/order.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DetailPage(),
      theme: ThemeData(
        fontFamily: 'Sora',
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 249, 249, 249),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuScreen(),
              ),
            );
          },
        ),
        title: const Text('Details', style: TextStyle(fontWeight: FontWeight.w600),),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                'assets/cappucino.png',
                height: 200.0,
                width: 500,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Cappuccino',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'with Chocolate',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star_rounded, color: Color(0xffFBBE21)),
                const Text(
                  '4.8 (230)',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Image.asset('assets/beans.png', height: 40),
                const SizedBox(width: 8.0),
                Image.asset('assets/milk.png', height: 40),
              ],
            ),
            const SizedBox(height: 16.0),
            const Divider(
              thickness: 1.0,
              color: Color(0xFFEAEAEA),
            ),
            const Text(
              'Description',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk the fo...',
              style: TextStyle(fontSize: 16.0, color: Color(0xff9B9B9B)),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Size',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: const [
                CustomChoiceChip(label: 'S', selected: false),
                SizedBox(width: 8.0),
                CustomChoiceChip(label: 'M', selected: true),
                SizedBox(width: 8.0),
                CustomChoiceChip(label: 'L', selected: false),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFF1F1F1),
        items: [
          const BottomNavigationBarItem(
            icon: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$4.53',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffC67C4E),
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0,),
              child: SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffC67C4E),
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CustomChoiceChip extends StatefulWidget {
  final String label;
  final bool selected;

  const CustomChoiceChip({super.key, required this.label, required this.selected});

  @override
  _CustomChoiceChipState createState() => _CustomChoiceChipState();
}

class _CustomChoiceChipState extends State<CustomChoiceChip> {
  late bool _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 5),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: _selected ? const Color(0xFFC67C4E) : Colors.black,
          ),
        ),
      ),
      selected: _selected,
      backgroundColor: _selected ? const Color(0xFFFFF5EE) : Colors.white,
      onSelected: (bool selected) {
        setState(() {
          _selected = selected;
        });
      },
      selectedColor: const Color(0xFFFFF5EE),
      labelStyle: TextStyle(
        color: _selected ? const Color(0xFFC67C4E) : Colors.black,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: _selected ? const Color(0xFFC67C4E) : Colors.black,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
