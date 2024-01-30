import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateBox extends StatefulWidget {
  @override
  _DateBoxState createState() => _DateBoxState();
}

class _DateBoxState extends State<DateBox> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MMMM/yyyy').format(selectedDate);

    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              'Date : ',
              style: TextStyle(fontSize: 16),
            ),
            VerticalDivider(
              color: Colors.black,
              thickness: 1,
              indent: 8,
              endIndent: 8,
            ),
            Text(
              formattedDate,
              style: TextStyle(fontSize: 16),
            ),
             // Add spacer to push the icon to the right
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Icon(
                Icons.calendar_today,
                size: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
