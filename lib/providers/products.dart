import 'package:flutter/material.dart';

import '../product.dart';


class Products with ChangeNotifier{
  List<Product> _items = [
    Product(
        id: 'p1',
        title: 'Red Shirt',
        description: 'A red shirt - it is pretty red',
        price: 29.99,
        imageUrl: 'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578'
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers',
        price: 59.99,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers'
    ),
    Product(
        id: 'p3',
        title: 'Yellow Scarf',
        description: 'Warm and cozy - exactly what you nee for winter',
        price: 19.99,
        imageUrl: 'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z-jpg'
    ),
    Product(
        id: 'p4',
        title: 'A pan',
        description: 'Prepare any meal you want',
        price: 49.99,
        imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iro'
    ),
  ];
 // var _showFavoritesOnly = false;

  List<Product> get items {
    //if(_showFavoritesOnly) {
      //return _items.where((prodItem) => prodItem.isFavorite).toList();
   // }
    return [..._items];
  }
List<Product> get favoriteItems{
    return _items.where((prodItem) => prodItem.isFavorite).toList();
}
  Product findById(String id){
    return _items.firstWhere((prod) => prod.id == id);
  }
  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }
  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }
  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}