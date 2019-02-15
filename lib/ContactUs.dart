import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: Center(
        child: new ListView(
          children: <Widget>[
            SizedBox(
              height: 270,
              child: Card(
                child: Column(
                  children: [
                     _infotile(
                        context, '11 Wall Street', 'New York, NY', Icons.home,
                        () {
                      print("address");
                    }),
                    Divider(),
                    _infotile(
                        context, '+1 (408) 123-4567', '', Icons.phone,
                        () {
                      print("call the number");
                    }),
                    _infotile(
                        context, 'swivy@example.org', '', Icons.email,
                        () {
                      print("email to open");
                    }),
                    _infotile(
                        context, 'www.swivy-example.org', '', Icons.computer,
                        () {
                      print("website to open");
                    }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // custom list tile
  ListTile _infotile(BuildContext context, String title, String subtitle,
          IconData icon, VoidCallback onTap) =>
      ListTile(
        title: Text(title),
        subtitle: (subtitle.length == 0) ? null : Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
        onTap: onTap,
      );
}
