import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Super Wigets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Super Widgets  Catelogue'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showPopupMenu(context),
              child: const Text("Popup menu box"),
            ),
            ElevatedButton(
              onPressed: () => _showSnackBar(context),
              child: const Text("Snackbar"),
            ),
            ElevatedButton(
              onPressed: () => _showModelBottomSheet(context),
              child: const Text("Bottom sheet"),
            ),
            ElevatedButton(
              onPressed: () => _simpleTextFieldBox(context),
              child: const Text("TextField box"),
            ),
          ],
        ),
      ),
    );
  }
}

void _showPopupMenu(BuildContext context) async {
  await showMenu(
    context: context,
    position: const RelativeRect.fromLTRB(50, 400, 00, 59),
    items: [
      PopupMenuItem(child: const Text("subscribe"), onTap: () {}),
      PopupMenuItem(child: const Text("like"), onTap: () {}),
      PopupMenuItem(child: const Text("comment"), onTap: () {}),
    ],
    elevation: 8.0,
  );
}

void _showSnackBar(BuildContext context) async {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text("Subscribe"),
      backgroundColor: Colors.black,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: "okey",
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}

void _showModelBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    elevation: 8.0,
    // backgroundColor: ,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox(
        height: 400,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Subscribe"),
            const Text("Like"),
            const Text("Comment"),
            const Text("Share"),
            ElevatedButton(
              onPressed: () {
                // Do something
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        ),
      );
    },
  );
}

_simpleTextFieldBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("TextField Box"),
        actions: [
          const Expanded(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Full Name",
                hintText: "type",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //DO something
              Navigator.pop(context);
            },
            child: const Text("Submit"),
          ),
        ],
      );
    },
  );
}
