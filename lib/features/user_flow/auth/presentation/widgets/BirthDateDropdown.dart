import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BirthDateDropdown<T> extends StatelessWidget {
  final String hintText;
  final T? selectedValue;
  final List<T> itemsList;
  final ValueChanged<T?> onChanged;

  const BirthDateDropdown({
    required this.hintText,
    required this.selectedValue,
    required this.itemsList,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 100.w,
      height: 51.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFF9C24D9), width: 2.w),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: DropdownButton<T>(
        menuMaxHeight: 200.h,
        value: selectedValue,
        hint: Text(
          hintText,
          style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
        ),
        dropdownColor: const Color(0xFF2E1371),
        icon: Image.asset(
          'assets/images/arrow_down.png',
          width: 16.w,
          height: 16.h,
        ),
        items: itemsList.map((T item) {
          return DropdownMenuItem<T>(
            value: item,
            child: Text(
              item.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox.shrink(),
      ),
    );
  }
}
