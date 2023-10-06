import 'package:flutter/material.dart';
import 'package:ostad_practice/component/cart_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xffF9F9F9)),
      home: const CartPage(),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

// List names = ["T-shirt", "Full Sleeve Shirt", "Hoodie"];
// List images = [
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbTDnV3Enw_7SC2F3UEIYDoehJCuIQdt4mSg&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNI0nx4BxVOOiZNDqL5dqNMU8xxICeJBrRgw&usqp=CAU",
//   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScsNGap6ethOK5Ir_6cQ0xH2F2IC7OqIL1rA&usqp=CAU"];
// List colors = ["Grey", "White", "Black"];
// List sizes = ["M", "L", "XL"];
// List prices = [51, 30, 43];
// int totalPrice = 0;

List<Product> products = [
  Product(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbTDnV3Enw_7SC2F3UEIYDoehJCuIQdt4mSg&usqp=CAU",
      "T-shirt",
      "White",
      "M",
      1,
      51),
  Product(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNI0nx4BxVOOiZNDqL5dqNMU8xxICeJBrRgw&usqp=CAU",
      "Full Sleeve Shirt",
      "Grey",
      "L",
      1,
      30),
  Product(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScsNGap6ethOK5Ir_6cQ0xH2F2IC7OqIL1rA&usqp=CAU",
      "Hoodie",
      "Black",
      "XL",
      1,
      43),
];

get totalAmount => products.fold(0, (sum, product) => sum + product.total);

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: const [Icon(Icons.search, color: Colors.black)]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("My Bag",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Expanded(
                child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return CartItem(
                        name: products[index].name,
                        color: products[index].color,
                        size: products[index].size,
                        image: products[index].image,
                        count: products[index].count,
                        price: products[index].price,
                        onAdd: () {
                          products[index].count++;
                          setState(() {});
                        },
                        onRemove: () {
                          if (products[index].count > 0) {
                            products[index].count--;
                          }
                          setState(() {});
                        },
                      );
                    })),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text("Total amount:"),
              Text("$totalAmount\$",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: const Color(0xffDB3022)),
                  onPressed: () {
                    SnackBar snackBar = const SnackBar(
                        content:
                            Text("Congratulations, purchased successfully"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text("CHECK OUT")),
            )
          ],
        ),
      ),
    );
  }
}

class Product {
  final String image;
  final String name;
  final String color;
  final String size;
  int count;
  final int price;

  Product(this.image, this.name, this.color, this.size, this.count, this.price);

  int get total => count * price;
}
