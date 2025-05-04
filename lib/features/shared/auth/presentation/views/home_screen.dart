import 'package:flutter/cupertino.dart';
import 'package:salla7ly/widgets/scaffold/scaffold_f.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldF(body: Center(child: Text("Home Page")));
  }
}
