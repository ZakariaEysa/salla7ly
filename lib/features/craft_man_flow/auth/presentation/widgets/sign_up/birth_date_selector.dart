import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BirthDateSelector extends StatefulWidget {
  const BirthDateSelector({super.key});

  @override
  State<BirthDateSelector> createState() => _BirthDateSelectorState();
}

class _BirthDateSelectorState extends State<BirthDateSelector> {
  String? selectedMonth = 'May';
  String? selectedDay = '12';
  String? selectedYear = '2002';

  final List<String> months = [
    'Jan',
    'Feb',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<String> days = List.generate(31, (index) => '${index + 1}');
  List<String> years = List.generate(
    70,
    (index) => '${DateTime.now().year - 15 - index}',
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDropdown(
            context: context,
            value: selectedMonth,
            items: months,
            onChanged: (value) {
              setState(() {
                selectedMonth = value;
              });
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildDropdown(
            context: context,
            value: selectedDay,
            items: days,
            onChanged: (value) {
              setState(() {
                selectedDay = value;
              });
            },
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _buildDropdown(
            context: context,
            value: selectedYear,
            items: years,
            onChanged: (value) {
              setState(() {
                selectedYear = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required void Function(String?)? onChanged,
    required BuildContext context,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        dropdownColor: const Color(0xFF1B1F32),
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14.sp,
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.white70,
        ),
        underline: const SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
