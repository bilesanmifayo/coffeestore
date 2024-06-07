import 'map.dart';
import 'package:flutter/material.dart';

import 'more_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order Screen',
      home: const OrderScreen(),
    );
  }
}

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  List<bool> isSelected = [true, false];

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
          builder: (context) => const DetailPage(),
        ),
      );
    },
  ),
  title: Text('Order', style: TextStyle(fontWeight: FontWeight.w600),),
),
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ToggleButtonsSection(isSelected: isSelected, onPressed: _toggleButtons),
            const SizedBox(height: 16),
            const AddressSection(),
            const SizedBox(height: 10),
            const EditAndAddNoteSection(),
            const SizedBox(height: 10),
            const Divider(),
            const CoffeeItem(),
            const Divider(),
            const DiscountSection(),
            const SizedBox(height: 10),
            const PaymentSummary(),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  void _toggleButtons(int index) {
    setState(() {
      isSelected = [index == 0, index == 1];
    });
  }
}

class ToggleButtonsSection extends StatelessWidget {
  final List<bool> isSelected;
  final Function(int) onPressed;

  const ToggleButtonsSection({
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(color: Color(0xfff0f0f0)),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: const Color.fromARGB(255, 0, 0, 0),
        fillColor: const Color(0xffC67C4E),
        borderRadius: BorderRadius.circular(8.0),
        children: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 54),
            child: Text(
              'Deliver',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.5),
            child: Text(
              'Pick Up',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ),
        ],
        onPressed: onPressed,
      ),
    );
  }
}

class AddressSection extends StatelessWidget {
  const AddressSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Delivery Address',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          'Jl. Kpg Sutoyo',
          style: TextStyle(fontSize: 18),
        ),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

class EditAndAddNoteSection extends StatelessWidget {
  const EditAndAddNoteSection();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditAddressButton(),
        const SizedBox(width: 20),
        AddNoteButton(),
      ],
    );
  }
}

class EditAddressButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      iconPath: 'assets/square.png',
      label: 'Edit Address',
      onPressed: () {},
    );
  }
}

class AddNoteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      iconPath: 'assets/Document.png',
      label: 'Add Note',
      onPressed: () {},
    );
  }
}

class CustomButton extends StatelessWidget {
  final String iconPath;
  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    required this.iconPath,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          width: 1.0,
          color: const Color.fromARGB(255, 142, 142, 142),
        ),
      ),
      child: TextButton.icon(
        icon: Image.asset(iconPath, height: 16),
        label: Text(
          label,
          style: const TextStyle(fontSize: 13, color: Color(0xff000000)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  const CoffeeItem();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/coffeecup.png', width: 40, height: 40),
      title: const Text(
        'Cappuccino',
        style: TextStyle(fontSize: 18),
      ),
      subtitle: const Text(
        'with Chocolate',
        style: TextStyle(fontSize: 16),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuantityButton(
            icon: Icons.remove,
            onPressed: () {},
          ),
          const SizedBox(width: 10),
          const Text(
            '1',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(width: 10),
          QuantityButton(
            icon: Icons.add,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const QuantityButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: 20,
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class DiscountSection extends StatelessWidget {
  const DiscountSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: Image.asset('assets/Discount.png', height: 20),
        title: const Text(
          '1 Discount is applied',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 20,
        ),
        onTap: () {},
      ),
    );
  }
}

class PaymentSummary extends StatelessWidget {
  const PaymentSummary();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 10),
        Text(
          'Payment Summary',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        PaymentSummaryItem(
          label: 'Price',
          amount: '\$ 4.53',
        ),
        PaymentSummaryRow(
          label: 'Delivery Fee',
          originalAmount: '\$ 2.0',
          discountedAmount: '\$ 1.0',
        ),
        Divider(),
        PaymentSummaryItem(
          label: 'Total Payment',
          amount: '\$ 5.53',
          isBold: true,
        ),
      ],
    );
  }
}

class PaymentSummaryItem extends StatelessWidget {
  final String label;
  final String amount;
  final bool isBold;

  const PaymentSummaryItem({
    required this.label,
    required this.amount,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 17, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          amount,
          style: TextStyle(fontSize: 17, fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
      ],
    );
  }
}

class PaymentSummaryRow extends StatelessWidget {
  final String label;
  final String originalAmount;
  final String discountedAmount;

  const PaymentSummaryRow({
    required this.label,
    required this.originalAmount,
    required this.discountedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 17),
        ),
        const Spacer(),
        Text(
          originalAmount,
          style: const TextStyle(
            decoration: TextDecoration.lineThrough,
            fontSize: 17,
          ),
        ),
        const SizedBox(width: 15),
        Text(
          discountedAmount,
          style: const TextStyle(fontSize: 17),
        ),
      ],
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        color: Color(0xFFF1F1F1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BottomNavBarContent(),
          const SizedBox(height: 10),
          OrderButton(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BottomNavBarContent extends StatelessWidget {
  const BottomNavBarContent();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        const CustomBottomNavBarItem(
          imagePath: 'assets/moneys.png',
          label: 'Cash',
          amount: '\$ 5.53',
        ),
        const Spacer(),
        Image.asset('assets/vector.png', height: 30),
        const SizedBox(width: 20),
      ],
    );
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DeliveryPage(),
          ),
        );
      },
      child: Container(
        width: 300,
        height: 55,
        decoration: const BoxDecoration(
          color: Color(0xffC67C4E),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: const Center(
          child: Text(
            "Order",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomNavBarItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String amount;

  const CustomBottomNavBarItem({
    super.key,
    required this.imagePath,
    required this.label,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            height: 35,
          ),
          const SizedBox(width: 15),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: const Color(0xffC67C4E),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            amount,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
