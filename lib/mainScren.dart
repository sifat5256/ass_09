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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        //title: Text('Shopping Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.black,),
            onPressed: () {
              // Handle search action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Container(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Our Product List',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                      ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                          height: 120,
                          width: 90,
                          image: NetworkImage(productImage[index]),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    productName[index],
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                                  ),
                                  PopupMenuButton(
                                    itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text('Option 1'),
                                        ),
                                        PopupMenuItem(
                                          child: Text('Option 2'),
                                        ),
                                        PopupMenuItem(
                                          child: Text('Option 3'),
                                        ),
                                      ];
                                    },
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text("Color:${productColor[index]}    Size:${productSize[index]}"),
                              SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]++;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.add, color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Text('${productCounts[index]}'),
                                      SizedBox(width: 8),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            productCounts[index]--;
                                            if (productCounts[index] <= 1) {
                                              productCounts[index] = 1;
                                            }
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange,
                                          ),
                                          padding: EdgeInsets.all(8),
                                          child: Icon(Icons.remove, color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${productPrice[index].toString()}',
                                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Amount : ",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "\$${calculateTotalAmount()}",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: checkout,
              child: Text('Check Out'),
            ),
          )
        ],
      ),
    );
  }
}
