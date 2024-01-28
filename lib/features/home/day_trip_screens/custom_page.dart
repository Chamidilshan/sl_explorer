import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPage extends StatefulWidget {
  final String pageTitle;
  final List<String> tabTitles;
  final List<List<TripDetails>> tabContents;
  final void Function(int, int) onDoubleArrowTapped;
  final Widget customButton;
  final String additionalText;


  const CustomPage({
    Key? key,
    required this.pageTitle,
    required this.tabTitles,
    required this.tabContents,
    required this.onDoubleArrowTapped,
    required this.customButton,
    required this.additionalText,
  }) : super(key: key);

  @override
  State<CustomPage> createState() => _CustomPageState();
}

class TripDetails {
  final String title;
  final String imagePath;
  final String description;

  TripDetails({
    required this.title,
    required this.imagePath,
    required this.description,
  });
}

class _CustomPageState extends State<CustomPage> {
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
          style: TextStyle(
            color: Colors.black,
            fontSize: _width * 0.04,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            height: _height * 0.001,
          ),
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
                  CommonText(
                    text: widget.additionalText,
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
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.tabContents[tabIndex].length,
      itemBuilder: (_, index) {
        TripDetails trip = widget.tabContents[tabIndex][index];

        return Column(
          children: [
            TripCard(
              trip: trip,
              isExpanded: isExpandedList[index],
              onCardTap: () {
                setState(() {
                  isExpandedList[index] = !isExpandedList[index];
                });
              },
              onDoubleArrowTap: () {
                _onDoubleArrowClicked(index);
              },
            ),
            if (isExpandedList[index])
              Container(
                padding: EdgeInsets.all(_width * 0.04),
                child: Text(trip.description),
              ),
            //Divider(),
          ],
        );
      },
    );
  }
}

class TripCard extends StatelessWidget {
  final TripDetails trip;
  final bool isExpanded;
  final VoidCallback onCardTap;
  final VoidCallback onDoubleArrowTap;

  const TripCard({
    Key? key,
    required this.trip,
    required this.isExpanded,
    required this.onCardTap,
    required this.onDoubleArrowTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onCardTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Container(
          width: _width,
          height: _height * 0.075,
          child: Column(
            children: [
              ListTile(
                title: Text(trip.title),
                leading: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: _height * 0.005,
                    horizontal: _width * 0.04,
                  ),
                  child: Container(
                    width: _width * 0.15,
                    height: _height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        trip.imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.double_arrow_outlined,
                    color: Color(0xFFfd8103),
                  ),
                  onPressed: onDoubleArrowTap,
                ),
              ),
            ],
          ),
        ),
      ),
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
  static void showTripsPopup(BuildContext context, String title, List<PopupTrip> trips) {
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
                fontWeight: currentPage == index
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: currentPage == index
                    ? Color(0xFFfd8103)
                    : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CommonText extends StatelessWidget {
  final String text;

  const CommonText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black,
        fontSize: _width * 0.025,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        height: _height * 0.001,
      ),
    );
  }
}