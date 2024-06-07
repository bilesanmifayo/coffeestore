import 'package:coffeestore/order.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DeliveryPage(),
      theme: ThemeData(
        fontFamily: 'Sora',
      ),
    );
  }
}

class DeliveryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 558,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 50,
                right: 16,
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Add',
                    child: Icon(Icons.gps_fixed, color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
              ),
              Positioned(
                  top: 20.0,
                  left: 2.0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderScreen(),
                      ),
                    );
                    },
                    icon: Image.asset('assets/background.png', height:120,),
                  ),
                ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 293.4,
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 5),
                  Text(
                    '10 minutes left',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Delivery to Jl. Kpg Sutoyo',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Image.asset('assets/bars.png', fit: BoxFit.fitWidth, width: 250),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffEAEAEA)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Image.asset('assets/delivery.png', height: 50),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivered your order',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text(
                                'We deliver your goods to you in the shortest possible time.',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset('assets/johan.png', height: 50, width: 50, fit: BoxFit.cover),
                    ),
                    title: Text('Johan Hawn'),
                    subtitle: Text('Personal Courier'),
                    trailing: IconButton(
                      icon: Image.asset('assets/call.png', height: 50),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
