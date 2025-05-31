import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salla7ly/generated/l10n.dart';

/// كلاس لصف أزرار اختيار نوع الحساب
class AccountTypeButtonsRow extends StatefulWidget {
  final VoidCallback onUserPressed;
  final VoidCallback onCraftsmanPressed;

  const AccountTypeButtonsRow({
    super.key,
    required this.onUserPressed,
    required this.onCraftsmanPressed,
  });

  @override
  State<AccountTypeButtonsRow> createState() => _AccountTypeButtonsRowState();
}

class _AccountTypeButtonsRowState extends State<AccountTypeButtonsRow> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
              color: theme.colorScheme.primary,
              child: InkWell(
                onTap: () {
                  widget.onUserPressed();
                },
                child: Center(
                  child: Text(
                    S.of(context).userButton,
                    style: TextStyle(
                      color: theme.textTheme.bodyMedium?.color,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // زر الحرفي (الجزء الأبيض)
          Expanded(
            child: Material(
              color: theme.textTheme.bodyMedium?.color,
              child: InkWell(
                onTap: () {
                  widget.onCraftsmanPressed();
                },
                child: Center(
                  child: Text(
                    S.of(context).craftsmanButton,
                    style: TextStyle(
                      color: theme.colorScheme.primary,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
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
