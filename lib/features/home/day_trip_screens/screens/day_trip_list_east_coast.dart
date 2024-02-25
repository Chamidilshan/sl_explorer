import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:SL_Explorer/common/widgets/shimmer_effect_widget.dart';
import 'package:SL_Explorer/models/day_trip_packages_model.dart';
import 'package:SL_Explorer/providers/day_trips_provider.dart';
import 'package:SL_Explorer/services/api_services/day_trips_api_service.dart';
import 'package:provider/provider.dart';
import '../widgets/day_trip_card.dart';
import 'package:shimmer/shimmer.dart';

class DayTripListPage_EastCoast extends StatefulWidget {
  final String categoryName;
  const DayTripListPage_EastCoast({Key? key, required this.categoryName})
      : super(key: key);

  @override
  State<DayTripListPage_EastCoast> createState() => _DayTripListPageState();
}

class _DayTripListPageState extends State<DayTripListPage_EastCoast>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<DayTrip> dayTrips = [];
  DayTripsApiService apiService = DayTripsApiService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    loadDayTripPackages();
  }

  loadDayTripPackages() async {
    try {
      final dayTripProvider =
          Provider.of<DayTripProvider>(context, listen: false);

      List<DayTrip> fetchedDayTrips = [];
      List<String> packageCategoryNames = ['East Coast Excursions'];

      for (String packageCategoryName in packageCategoryNames) {
        for (int i = 1; i <= 3; i++) {
          List<DayTrip> trips =
              await apiService.fetchDayTripsByCategoryAndDuration(
                  packageCategoryName, i.toString());
          fetchedDayTrips.addAll(trips);
        }
      }

      dayTripProvider.setDayTrips(fetchedDayTrips);
      setState(() {
        dayTrips = fetchedDayTrips;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dayTrips.isNotEmpty
                ? Text(
                    '${dayTrips[0].packageCategoryName}',
                    style: GoogleFonts.poppins(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: 200,
                      height: 24,
                      color: Colors.grey[300],
                    ),
                  ),
            Text(
              'Tap the cards to view a short description about the tour.',
              style: GoogleFonts.montserrat(
                fontSize: 12.0,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            dayTrips.isNotEmpty
                ? Text(
                    '${dayTrips[0].packageTitle}',
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                : Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor:
                        Colors.grey[100]!, // Use your desired gradient
                    child: Container(
                      width: 200,
                      height: 18,
                      color: Colors.grey[300],
                    ),
                  ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            CustomButton(onPressed: () {}),
            TabBar(
              controller: _tabController,
              labelColor: logoColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: logoColor,
              tabs: [
                Tab(text: 'One Day'),
                Tab(text: 'Two Days'),
                Tab(text: 'Three Days'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildTripList(1),
                  _buildTripList(2),
                  _buildTripList(3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTripList(int duration) {
    List<DayTrip> filteredTrips = [];
    if (dayTrips.isNotEmpty) {
      filteredTrips =
          dayTrips.where((trip) => trip.packageDays == duration).toList();
    }

    return ListView.builder(
      itemCount: filteredTrips.isEmpty ? 4 : filteredTrips.length,
      itemBuilder: (context, index) {
        if (filteredTrips.isEmpty) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 100.0, // Adjust the height as needed
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        } else {
          return DayTripListCard(
            imgLink: filteredTrips[index].packageCoverImage,
            titleText: filteredTrips[index].packageName,
            descriptionText: filteredTrips[index].packageShortDescription,
            dayTrips: dayTrips,
            index: index,
          );
        }
      },
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;

    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFfd8103),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: Text(
          'Ongoing Trips',
          style: TextStyle(
            color: Colors.white,
            fontSize: _width * 0.025,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

class PopupTrip {
  final String title;
  final String description;
  final int durationInDays;

  PopupTrip({
    required this.title,
    required this.description,
    required this.durationInDays,
  });
}

class PopupBuilder {
  static void showTripsPopup(
      BuildContext context, String title, List<PopupTrip> trips) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: trips.map((trip) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('- ${trip.title}'),
                Text('  Description: ${trip.description}'),
                Text('  Duration: ${_getDurationText(trip.durationInDays)}'),
                SizedBox(height: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  static String _getDurationText(int durationInDays) {
    if (durationInDays == 1) {
      return '1 Day';
    } else {
      return '$durationInDays Days';
    }
  }
}
