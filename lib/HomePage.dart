import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swivy/counter_bloc.dart';
import 'package:swivy/counter_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './TermsConditions.dart';
import './About.dart';
import './ContactUs.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser fbuser;
  final VoidCallback onTap;
  final String title;
  int _selectedIndex = 0;

  HomePage({Key key, this.title, @required this.fbuser, @required this.onTap})
      : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return new BlocProvider(
        bloc: _counterBloc, child: CounterWidget(widget: widget));
  }

  @override
  void dispose() {
    super.dispose();
    _counterBloc.dispose();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HomePage widget;

  BuildContext get context1 => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: new Drawer(
          child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          new DrawerHeader(
              child: Center(
                child: _headerView(),
              ),
              padding: EdgeInsets.only(),
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
          _tile(context, 'About', '', FontAwesomeIcons.info, () {
            Navigator.pop(context);
            _aboutUs(context);
          }),
          new Divider(),
          _tile(context, 'Contact Us', '', Icons.email, () {
            Navigator.pop(context);
            _contactUs(context);
          }),
          new Divider(),
          _tile(context, 'Terms & Conditions', '', FontAwesomeIcons.fileAlt,
              () {
            Navigator.pop(context);
            _termsConditions(context);
          }),
          new Divider(),
        ],
      )),
      body: BlocBuilder(
          bloc: BlocProvider.of<CounterBloc>(context),
          builder: (context, CounterState state) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Text("Hi, ${this.widget.fbuser.displayName}"),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    child: const Text('Log Out'),
                    onPressed: () {
                      // logout
                      this.widget.onTap();
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Your counter value is:',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${state.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            );
          }),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.message), title: Text('Notifications')),
        ],
        currentIndex: this.widget._selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onIncrement(),
            tooltip: 'Increment',
            heroTag: "tag1",
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () =>
                BlocProvider.of<CounterBloc>(context).onDecrement(),
            tooltip: 'Decrement',
            heroTag: "tag2",
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  Widget _headerView() => Container(
          child: Column(
        children: <Widget>[
          ClipOval(
              child: Image.network(
            widget.fbuser.photoUrl,
            fit: BoxFit.cover,
            width: 90.0,
            height: 90.0,
          )),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Text(
              widget.fbuser.displayName,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ));

  // user defind methods

  void _contactUs(BuildContext context1) async {
    print("Contact Us...");
    Navigator.push(
        context1, MaterialPageRoute(builder: (context) => ContactUs()));
  }

  void _aboutUs(BuildContext context1) async {
    print('About Us...');
    Navigator.push(
      context1,
      MaterialPageRoute(builder: (context) => About()),
    );
  }

  void _termsConditions(BuildContext context1) async {
    print('Terms & Conditions...');
    Navigator.push(
      context1,
      MaterialPageRoute(builder: (context) => TermsConditions()),
    );
  }

  void _onItemTapped(int index) {
    //setState(() {
    this.widget._selectedIndex = index;
    print("item taped $index");
    // });
  }

  // custom list tile
  ListTile _tile(BuildContext context, String title, String subtitle,
          IconData icon, VoidCallback onTap) =>
      ListTile(
        title: Text(
          title,
        ),
        subtitle: (subtitle.length == 0) ? null : Text(subtitle),
        onTap: onTap,
        leading: Icon(
          icon,
          color: Colors.grey[600],
        ),
      );
}
