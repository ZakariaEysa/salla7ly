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
//                 final newTheme = !isDark;
//                 ref.read(themeProvider.notifier).state =
//                     newTheme; // تغيير الـ Theme
//                 HiveStorage.set(HiveKeys.isDark, newTheme); // حفظ التغيير
//               },
//               child: const Text("Toggle Theme"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
