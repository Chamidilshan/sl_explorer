import 'package:SL_Explorer/constants/constants.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:SL_Explorer/models/wishlist_model.dart';

class WishlistApiService{
  final String apiUrl = '$baseUrl/api/v1/wishlists';

  Future<Wishlist> fetchWishlist(String _uid) async {
    final resp = await http.get(Uri.parse('$apiUrl/$_uid'));
    print(resp.statusCode);
    print(resp.body);

    if (resp.statusCode == 200) {
      final Wishlist data = jsonDecode(resp.body);
      return data;
    } else {
      throw Exception('Failed to load wishlists');
    }
  }
}