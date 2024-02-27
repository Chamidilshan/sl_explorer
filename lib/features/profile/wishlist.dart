import 'package:SL_Explorer/models/wishlist_model.dart';
import 'package:SL_Explorer/providers/wishlist_provider.dart';
import 'package:SL_Explorer/services/api_services/wishlist_api_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../common/widgets/Numbered_shimmer_effect.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late Wishlist wishes;
  bool retrieved = false;
  WishlistApiService apiService = WishlistApiService();
  User? _user;

  @override
  void initState(){
    super.initState();
    _getCurrentUser();
    //print(_user!.uid);
    loadWishlist();
    //load packages
    // loadRoundTripPackages();
  }


  Future<void> _getCurrentUser() async {
    User? user = _auth.currentUser;
    if (user != null) {
      setState(() {
        _user = user;
      });
    }
  }

  loadWishlist() async {
    try{
      final wishlistProvider = Provider.of<WishlistProvider>(context, listen: false);
      Wishlist fetchedWishlist = await apiService.fetchWishlist(_user!.uid);
      wishlistProvider.setWishlists(fetchedWishlist.wishes);

      print("\n\n\n\n\n");
      print(fetchedWishlist);
      print(fetchedWishlist.wishes);

      setState(() {
        wishes = fetchedWishlist;
        retrieved = true;
      });

      // final Wishlist wishlist = Wishlist.fromJson(wishes);
      // print(wishlist.userId); // Output: yourUserId
      print(wishes); // Output: [wish1, wish2, wish3]
    }catch(e){
      print(e.toString());
    }
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: GoogleFonts.merriweather(
            //color: Colors.black,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(253, 129, 3, 1.0),
        shadowColor: const Color.fromRGBO(0, 0, 0, 1.0),
        surfaceTintColor: const Color.fromRGBO(0, 0, 0, 1.0),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 20.0,
          letterSpacing: 1.0,
        ),
        centerTitle: true,
      ),


      
      // body:
      // ListView(
      //   children: [
      //     retrieved == false
      //         ? SizedBox(
      //       height: 200 * 1,//count
      //       child: NumberedShimmerWidgets(
      //         height: 180.0, count: 1,),
      //     )
      //         :
      //     orders.isEmpty
      //         ?Padding(
      //       padding: const EdgeInsets.all(30.0),
      //       child: Center(child: Text("No Orders Yet")),
      //     )
      //         :SizedBox(
      //       height: orders.length * 200,
      //       child: ListView.builder(
      //           physics: NeverScrollableScrollPhysics(),//to top scrolling
      //           itemCount: orders.length,
      //           itemBuilder: (context, index){
      //             return OrderCard(
      //               order: orders[index],
      //               index: index,
      //             );
      //           }
      //       ),
      //     ),
      //   ],
      // ),




    );
  }
}
