import 'package:SL_Explorer/models/notification_model.dart';
import 'package:SL_Explorer/services/firebase_services/notification_service.dart';
import 'package:flutter/material.dart';

class NotificationDrawer extends StatefulWidget {
  @override
  _NotificationDrawerState createState() => _NotificationDrawerState();
}

class _NotificationDrawerState extends State<NotificationDrawer> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    loadNotifications();
  }

  Future<void> loadNotifications() async {
    // Retrieve saved notifications from shared preferences
    notifications = await NotificationService.getNotifications();
    setState(() {});
    print('length: ${notifications.length}');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 60.0,
          margin: EdgeInsets.all(0.0),
          padding: EdgeInsets.all(0.0),
          child: DrawerHeader(
            child: Text(
              'All Notifications',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        ...notifications.map((notification) {
          return Dismissible(
            key: Key(notification.id.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red, // Background color when swiping
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (direction) {
              try{
                notifications.remove(notification);
                NotificationService.deleteNotification(notification.id);
              }catch(e){
                print(e.toString());
              }
            },
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              leading: SizedBox(
                width: 56.0,
                height: 56.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    notification.imgLink,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                notification.title,
                style: TextStyle(
                    fontSize: 14.0,
                  fontWeight: FontWeight.w500
                ),
                maxLines: 1, // Limit the title to one line
                overflow: TextOverflow.ellipsis, // Handle overflow by ellipsis
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.body,
                    style: TextStyle(fontSize: 12.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    '${notification.date}  |  ${notification.time}',
                    style: TextStyle(fontSize: 8.0),
                  ),
                ],
              ),
              onTap: () {
                // Handle onTap action
              },
            ),
          );
        }).toList(),
      ],
    );
  }
}