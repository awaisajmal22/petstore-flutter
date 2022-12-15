import 'package:flutter/cupertino.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> get items {
    return [...data];
  }
  
}
