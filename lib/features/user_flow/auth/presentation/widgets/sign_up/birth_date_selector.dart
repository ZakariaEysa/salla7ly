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
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  List<String> days = List.generate(31, (index) => '${index + 1}');
  List<String> years = List.generate(
    100,
    (index) => '${DateTime.now().year - index}',
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildDropdown(
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
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
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
