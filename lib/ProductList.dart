import 'dart:collection';

import 'package:counter_app/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}
class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}


class _ProductListState extends State<ProductList> {

  final List<Product> products = [
    Product('Product 1', 19.99),
    Product('Product 2', 29.99),
    Product('Product 3', 9.99),
    Product('Product 4', 49.99),
    Product('Product 5', 39.99),
    Product('Product 6', 14.99),
    Product('Product 7', 24.99),
    Product('Product 8', 64.99),
    Product('Product 9', 34.99),
    Product('Product 10', 54.99),
    Product('Product 11', 19.99),
    Product('Product 12', 29.99),
    Product('Product 13', 9.99),
    Product('Product 14', 49.99),
    Product('Product 15', 39.99),
    Product('Product 16', 14.99),
    Product('Product 17', 24.99),
    Product('Product 18', 64.99),
    Product('Product 19', 34.99),
    Product('Product 20', 54.99),
  ];
  HashMap itemInCartMap = HashMap<String , int>();


  var totalProduct = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: ListView.builder(
               itemCount: products.length,
              itemBuilder: (context , index){
                 var item = products[index] ;
                return ListTile(
                  minVerticalPadding: 4,
                  title: Text(products[index].name),
                  subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                  trailing: SizedBox(
                    width: 100,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Counts: " , style: TextStyle(
                                fontSize: 12,
                              ),),
                              Text( "${itemInCartMap[item.name] ?? 0}" , style: TextStyle(
                                fontSize: 12,
                              ),)
                          ],),
                          SizedBox(
                            height: 30,
                              child: ElevatedButton(onPressed: (){
                                if(itemInCartMap.containsKey(item.name)){
                                  var oldQry = itemInCartMap[item.name];
                                  itemInCartMap[item.name] = oldQry + 1 ;
                                  if(itemInCartMap[item.name] == 5){
                                    _dialogBuilder(context, index);

                                  }

                                }else {
                                  itemInCartMap[item.name] = 1 ;

                                }
                               // totalProduct++;
                                setState(() {
                                });
                              }, child: Text("Buy Now", style: TextStyle(
                                fontSize: 12,
                              ),)))
                        ],
                      ),
                    ),
                  ),
                );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart_outlined,color: Colors.white,),
        backgroundColor: Colors.blue,
        onPressed: () {
          totalProduct = itemInCartMap.length;
          print("total num: " + totalProduct.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen(counter: totalProduct.toString())));

        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context , int idx) {

    return showDialog<void>(

      context: context,

      builder: (BuildContext context) {

        return AlertDialog(
          title: Text('Congratulations!'),           // To display the title it is optional
          content: Text('You have bought 5 items of ${products[idx].name}'),   // Message which will be pop up on the screen
          // Action widget which will provide the user to acknowledge the choice
          actions: [

            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('ok'),
            ),
          ],
        );
      },
    );
  }
}




