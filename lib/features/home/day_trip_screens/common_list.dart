import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:SL_Explorer/constants/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonListPage extends StatefulWidget {

  final String pageTitle;
  final void Function(int, int) onDoubleArrowTapped;
  final Widget customButton;
  final String additionalText;
  final List<String> tabTitles;
  final List<List<String>> imagePathsByDuration;
  final List<List<String>> titlesByDuration;
  final List<List<String>> descriptionsByDuration;
  final List<int> itemCountsByTab;

  const CommonListPage(
      {Key? key,
      required this.pageTitle,
      required this.onDoubleArrowTapped,
      required this.customButton,
      required this.additionalText,
      required this.tabTitles,
        required this.imagePathsByDuration,
        required this.titlesByDuration,
        required this.descriptionsByDuration,
        required this.itemCountsByTab,

      })
      : super(key: key);

  @override
  State<CommonListPage> createState() => _CommonListPageState();
}

class _CommonListPageState extends State<CommonListPage> {
  late PageController _pageController;
  int _currentPage = 0;
  List<bool> isExpandedList = List.generate(11, (index) => false);

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _onTextClicked(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onDoubleArrowClicked(int cardIndex) {
    widget.onDoubleArrowTapped(_currentPage, cardIndex);
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.pageTitle,
          style: GoogleFonts.poppins(
              fontSize: 22.0, color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: _height * 0.005,
                horizontal: _width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: _height * 0.001,
                  ),
                  Text(
                    widget.additionalText,
                    style: GoogleFonts.poppins(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  widget.customButton,
                  SizedBox(
                    height: _height * 0.01,
                  ),
                  CustomNavigationBar(
                    currentPage: _currentPage,
                    onTextClicked: _onTextClicked,
                    tabTitles: widget.tabTitles,
                  ),
                ],
              ),
            ),
            Container(
              height: _height * 0.7,
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: List.generate(
                  widget.tabTitles.length,
                  (tabIndex) => Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: _height * 0.005,
                        horizontal: _width * 0.04,
                      ),
                      child: _buildListView(tabIndex),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListView _buildListView(int tabIndex) {
    return ListView.builder(
      itemCount: widget.itemCountsByTab[tabIndex],
      itemBuilder: (context, index)
    {
      if (_currentPage < widget.imagePathsByDuration.length &&
          index < widget.imagePathsByDuration[_currentPage].length) {
        return Card(
          color: Colors.white,
          child: ExpansionTile(
            backgroundColor: Colors.white,
            collapsedBackgroundColor: Colors.white,
            trailing: IconButton(
              icon: Icon(Icons.keyboard_double_arrow_right_rounded),
              onPressed: () {
                _onDoubleArrowClicked(index);
              },
            ),
            collapsedIconColor: logoColor,
            title: SizedBox(
              height: 80.0,
              child:
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.imagePathsByDuration[_currentPage][index],
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.titlesByDuration[_currentPage][index],
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0),
                      ),
                    ],
                  ),
                )
              ]),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, right: 24.0, left: 24.0, bottom: 8.0),
                child: Text(
                  widget.descriptionsByDuration[_currentPage][index],
                  style: GoogleFonts.poppins(
                      color: Color(0xFF21231E),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              // const Text("isAdmin: No")
            ],
          ),
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
          primary: Color(0xFFfd8103),
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

class CustomNavigationBar extends StatelessWidget {
  final int currentPage;
  final Function(int) onTextClicked;
  final List<String> tabTitles;

  CustomNavigationBar({
    required this.currentPage,
    required this.onTextClicked,
    required this.tabTitles,
  });

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: _width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          tabTitles.length,
          (index) => GestureDetector(
            onTap: () => onTextClicked(index),
            child: Text(
              tabTitles[index],
              style: TextStyle(
                fontSize: 16.0,
                fontWeight:
                    currentPage == index ? FontWeight.bold : FontWeight.normal,
                color: currentPage == index ? Color(0xFFfd8103) : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
