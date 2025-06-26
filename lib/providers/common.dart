import 'package:flutter/material.dart';
import 'package:zuv_delivery_driver/model/index.dart';

class CommonProvider extends ChangeNotifier {
  List<DeliveryData> movies = [];
  List<String> wishListIds = [];
  int currentIdx = 0;
  bool isLoggedIn = false;

  void setMovies(List<DeliveryData> data) {
    movies = data;
    notifyListeners();
  }

  List<DeliveryData> get wishMovies =>
      movies.where((element) => isWishMovie(element)).toList();

  void addWishList(String id) {
    if (wishListIds.contains(id)) {
      wishListIds.remove(id);
    } else {
      wishListIds.add(id);
    }
    notifyListeners();
  }

  bool isWishMovie(DeliveryData data) {
    return wishListIds.any((element) => element == data.id);
  }

  void changeCurrentIdx(int idx) {
    currentIdx = idx;
    notifyListeners();
  }
}
