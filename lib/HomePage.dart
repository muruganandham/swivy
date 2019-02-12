import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swivy/counter_bloc.dart';
import 'package:swivy/counter_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the home_page object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
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
}
