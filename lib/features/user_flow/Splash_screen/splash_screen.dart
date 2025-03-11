import 'package:flutter/material.dart';
import 'package:salahly/utils/navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateTo(context: context, screen: Container());
      },
      child: Container(
        child: Text("hello"),
      ),
    );
  }
}

// class ThemeToggleScreenExample extends ConsumerWidget {
//   const ThemeToggleScreenExample({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final isDark = ref.watch(themeProvider); // مراقبة حالة الثيم

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Theme Switcher"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Current Theme: ${isDark ? 'Dark' : 'Light'}",
//               style: Theme.of(context).textTheme.bodyLarge,
//             ),
//             SizedBox(height: 20.h),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(themeProvider.notifier).state = !isDark; 
//                 HiveStorage.set(
//                     HiveKeys.isDark, !isDark);
//               },
//               child: const Text("Toggle Theme"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
