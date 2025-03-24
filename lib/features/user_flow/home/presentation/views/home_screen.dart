import 'package:flutter/cupertino.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const  ScaffoldF(
      body: Center(child: Text("Home Screen")),
    );
  }
}
