import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swivy/counter_bloc.dart';
import 'package:swivy/counter_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import './TermsConditions.dart';
import './AboutUs.dart';
import './ContactUs.dart';


class HomePage extends StatefulWidget {
  final FirebaseUser fbuser;
  final VoidCallback onTap;
  final String title;

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
              child: Center(child: Text('Drawer Header')),
              decoration: BoxDecoration(
                color: Colors.blue,
              )),
         _tile(context, 'Home', '', Icons.home, _goHome),
          new Divider(),
          new ListTile(
            title: new Text('About us'),
            onTap: () {
              Navigator.pop(context);
              _aboutus(context);
            },
          ),
          new Divider(),
          _tile(context, 'Contact us', '', Icons.smartphone, _contactus),
          new Divider(),
          new ListTile(
            title: new Text('Terms & Condition'),
            onTap: () {
              Navigator.pop(context);
              _termsConditions(context);
            },
          ),
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
                  RaisedButton(
                    child: const Text('Log Out'),
                    onPressed: () {
                      //logout
                      this.widget.onTap();
                      Navigator.pop(context);
                    },
                  ),
                  new Icon(FontAwesomeIcons.solidLaugh),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'You have pushed the button this many times:',
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

  //user defind methods

  void _contactus() async {
    print("Contact us...");
    Navigator.of(context1).push(MaterialPageRoute(builder: (context) => ContactUs()));
  }

  void _goHome() async {
    print("Go to Home...");
  }

  void _aboutus(BuildContext context1) async {
    print('about us..');
    Navigator.push(context1,
    MaterialPageRoute(builder: (context) => AboutUs()),); 
  }

  void _termsConditions(BuildContext context1) async {
    print('terms and conditions..');
    Navigator.push(context1,
    MaterialPageRoute(builder: (context) => TermsConditions()),);  
  }

  //custom list tile
  ListTile _tile(BuildContext context1, String title, String subtitle, IconData icon, VoidCallback methodname) => ListTile(
      title: Text(title,),
      subtitle: (subtitle.length == 0)? null : Text(subtitle),
      onTap: () {
            Navigator.pop(context1);
            methodname();
            },
      leading: Icon(
        icon,
        color: Colors.blue[400],
      ),
    );
}
