// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:SL_Explorer/features/home/home_page.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:SL_Explorer/constants/utils/styles.dart';
//
//
// class services extends StatefulWidget {
//   @override
//   _servicesState createState() => _servicesState();
// }
//
// class _servicesState extends State<services> {
//   @override
//   Widget build(BuildContext context) {
//     final _width = MediaQuery.of(context).size.width;
//     final _height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Services'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Get.to(HomePage());
//           },
//         ),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(
//           vertical: _height * 0.005,
//           horizontal: _width * 0.04,
//         ),
//         child: CardList(),
//       ),
//     );
//   }
// }
//
// class CardList extends StatefulWidget {
//   @override
//   _CardListState createState() => _CardListState();
// }
//
// class _CardListState extends State<CardList> {
//   List<String> titles = [
//     'Medical Services',
//     'Restaurants',
//     'Spa',
//     'Ayurveda Spa',
//     'Clubs',
//     'Surfing Water Sport places'
//   ];
//   List<String> imageUrls = [
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//     'https://le-cdn.website-editor.net/s/9618d51fa2784d00b15c5b25bfe4c3f0/dms3rep/multi/opt/Malediven-512fb461-288w.jpeg?Expires=1709267366&Signature=H6ssWkkW~ZvRkRTQiYpi4S3n0RITJ9KEKIysaaTLG0J9Fj7ZkHHK0BALNYjXWVbNUIvD3Jr-AjtwJLODxg9j0IVUS743AG8syzNM-EbP-JJV0GzFw59QYXyCXwsp2Yl~K70tcaTirqZWYV9PE-g4Bxbc89Lwc77HZMDz5mmuJ6HtipLzuIaWACDHLU0bUiQKqXQZn6YPBknk8G986aR6IpmDpRiL-C7hta83fIccdgJDp9lELV5f-cCA47t2MHud~7a9lBTmdhqboku7NVjaVD7O8L4yx4oXa-y7laXrS0ekBBldtAvHI6uz-jlfUFUeUaA5-udxTrH4D2V2feA1mA__&Key-Pair-Id=K2NXBXLF010TJW',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: 6,
//       itemBuilder: (context, index) {
//         return Card(
//             color: Colors.white,
//             child: ExpansionTile(
//               backgroundColor: Colors.white,
//               collapsedBackgroundColor: Colors.white,
//               trailing: IconButton(
//                 icon: Icon(Icons.keyboard_double_arrow_right_rounded),
//                 onPressed: () {},
//               ),
//               collapsedIconColor: logoColor,
//               title: SizedBox(
//                 height: 80.0,
//                 child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(8.0),
//                         child: Image.network(
//                           imageUrls[index],
//                           height: 80.0,
//                           width: 80,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(width: 10.0,),
//                       Flexible(
//                         flex: 2,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               titles[index],
//                               style: GoogleFonts.poppins(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16.0),
//                             ),
//                           ],
//                         ),
//                       )
//                     ]),
//               ),
//             )
//         );
//       },
//     );
//   }
// }
//
