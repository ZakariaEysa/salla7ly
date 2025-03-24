import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لصف أزرار اختيار نوع الحساب
class AccountTypeButtonsRow extends StatefulWidget {
  final VoidCallback onUserPressed;
  final VoidCallback onCraftsmanPressed;

  const AccountTypeButtonsRow({
    Key? key,
    required this.onUserPressed,
    required this.onCraftsmanPressed,
  }) : super(key: key);

  @override
  State<AccountTypeButtonsRow> createState() => _AccountTypeButtonsRowState();
}

class _AccountTypeButtonsRowState extends State<AccountTypeButtonsRow> {
  // تعريف متغير لتتبع الاختيار الحالي (افتراضياً المستخدم)
  bool _isUserSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        children: [
          // زر المستخدم (الجزء الأزرق)
          Expanded(
            child: Material(
              color: _isUserSelected
                  ? const Color(0xFF0066FF)
                  : const Color(0xFF0066FF).withOpacity(0.7),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isUserSelected = true;
                  });
                  widget.onUserPressed();
                },
                child: Center(
                  child: Text(
                    S.of(context).userButton,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight:
                          _isUserSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // زر الحرفي (الجزء الأبيض)
          Expanded(
            child: Material(
              color: !_isUserSelected
                  ? Colors.white
                  : Colors.white.withOpacity(0.8),
              child: InkWell(
                onTap: () {
                  setState(() {
                    _isUserSelected = false;
                  });
                  widget.onCraftsmanPressed();
                },
                child: Center(
                  child: Text(
                    S.of(context).craftsmanButton,
                    style: TextStyle(
                      color: const Color(0xFF0066FF),
                      fontSize: 24.sp,
                      fontWeight:
                          !_isUserSelected ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
