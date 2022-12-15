import 'package:flutter/material.dart';
import 'package:shop_app/shared/shared_pre.dart';

import 'onbording.dart';

class Setting extends StatelessWidget {
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.library_books_sharp,
                  size: 35.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Your orders',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.local_offer,
                  size: 35.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'offers',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

            Row(
              children: [
                Icon(
                  Icons.notifications,
                  size: 35.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

            Row(
              children: [
                Icon(
                  Icons.help,
                  size: 35.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Get help',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),

            Row(
              children: [
                Icon(
                  Icons.info,
                  size: 35.0,
                ),
                SizedBox(
                  width: 20.0,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
