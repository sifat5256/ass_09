import 'package:flutter/material.dart';

class ShopingCart extends StatefulWidget {
  const ShopingCart({Key? key}) : super(key: key);

  @override
  State<ShopingCart> createState() => _ShopingCartState();
}

class _ShopingCartState extends State<ShopingCart> {
  void checkout() {
    // Show Snackbar with congratulatory message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Congratulations! Your order has been placed.'),
      ),
    );
  }

  List<String> productSize = ['L', 'S', 'M'];
  List<String> productColor = ['Red', 'Black', 'Blue'];
  List<String> productName = ['Shirt', 'T-Shirt', 'Pant'];
  List<int> productPrice = [400, 200, 800];
  List<String> productImage = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRj07RitEKDUDwsbkM0LZMX-n_BA-z3N8o1rg8QoqVG&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSebSLKzTsJcWLkIC4YjpD9ZPmKjYCd3DUejLDcbWci&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSruKxRB07fRG7NTrfjZZSH_KKHj4h3Pbej0H612sPs&s'
  ];
  List<int> productCounts = [1, 1, 1]; // Initialize with default quantities

  int calculateTotalAmount() {
    int totalAmount = 0;
    for (int i = 0; i < productName.length; i++) {
      totalAmount += productCounts[i] * productPrice[i];
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 130,
              child: Row(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Our Product List',
                      style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: productName.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            height: 200,
                            width: 150,
                            image: NetworkImage(productImage[index]),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productName[index],
                                style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Color:${productColor[index]}    Size:${productSize[index]}"),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  ClipOval(
                                    child: Material(
                                      color: Colors.orange,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]++;
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: Icon(Icons.add, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('${productCounts[index]}'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  ClipOval(
                                    child: Material(
                                      color: Colors.orange,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]--;
                                            if (productCounts[index] <= 0) {
                                              productCounts[index] = 0;
                                            }
                                          });
                                        },
                                        child: Container(
                                          width: 40,
                                          height: 40,
                                          child: Center(
                                            child: Icon(Icons.remove, color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 130,
                                  ),
                                  Text(
                                    '\$${productPrice[index].toString()}',
                                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Text(
                  "Total Amount : \$${calculateTotalAmount()}",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: checkout,
                child: Text('Check Out'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
