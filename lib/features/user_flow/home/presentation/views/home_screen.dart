import 'package:flutter/cupertino.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../shared/auth/presentation/views/sign_in.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const ScaffoldF(
      // body: Center(child: Text("Home Screen")),
      body: SignInScreen(),
    );
  }
}
