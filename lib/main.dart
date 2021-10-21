import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './cart_screen.dart';
import './products_overview_screen.dart';
import './product_detail_screen.dart';
import './providers/products.dart';
import './cart.dart';
import './orders.dart';
import './orders_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
        create: (ctx) => Products(),
    //value:  Products(),
     ),
      ChangeNotifierProvider(
        create: (ctx) => Cart(),
        //value:  Cart(),
      ),
      ChangeNotifierProvider(
          create: (ctx) => Orders(),
      ),
    ],
        child: MaterialApp(
      title: 'My Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.deepOrange,
      ),
      home: ProductsOverviewScreen(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => OrdersScreen(),
      }
        ),
    );
  }
}

