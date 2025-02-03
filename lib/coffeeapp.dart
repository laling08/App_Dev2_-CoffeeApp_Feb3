import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CoffeeOrderScreen(),
    );
  }
}

class CoffeeOrderScreen extends StatefulWidget {
  @override
  _CoffeeOrderScreenState createState() => _CoffeeOrderScreenState();
}

class _CoffeeOrderScreenState extends State<CoffeeOrderScreen> {
  int _orderCount = 0;
  int _toppingCount = 0;

  void _incrementOrder() {
    setState(() {
      _orderCount++;
    });
  }

  void _decrementOrder() {
    setState(() {
      if (_orderCount > 0) _orderCount--;
    });
  }

  void _incrementTopping() {
    setState(() {
      _toppingCount++;
    });
  }

  void _decrementTopping() {
    setState(() {
      if (_toppingCount > 0) _toppingCount--;
    });
  }

  void _pay() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Thank you for paying.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalCost = (_orderCount * 5) + (_toppingCount * 1);

    return Scaffold(
      appBar: AppBar(
        title: Text('Coffee Order App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildCarousel(),
          SizedBox(height: 20),
          Text('Number of Orders: $_orderCount'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _incrementOrder,
                child: Text('+'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrementOrder,
                child: Text('-'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Number of Toppings: $_toppingCount'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: _incrementTopping,
                child: Text('+'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _decrementTopping,
                child: Text('-'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Text('Total Cost: \$${totalCost.toStringAsFixed(2)}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pay,
            child: Text('Pay'),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(
              'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(
              'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            child: Image.network(
              'https://images.pexels.com/photos/312418/pexels-photo-312418.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              height: 200,
              width: 300,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildCarouselItem(String imagePath) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
