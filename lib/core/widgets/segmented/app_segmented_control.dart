import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 分段选择器的单个选项数据。
class AppSegmentedOption<T> {
  final T value;
  final String label;

  const AppSegmentedOption({
    required this.value,
    required this.label,
  });
}

/// 应用统一的分段选择器组件。
///
/// 带动画的 iOS 风格分段控件，支持泛型数据类型。
/// [value] 当前选中的值
/// [options] 选项列表
/// [onChanged] 选中变化回调，返回选中项的值
class AppSegmentedControl<T> extends StatelessWidget {
  final T value;
  final List<AppSegmentedOption<T>> options;
  final ValueChanged<T> onChanged;

  const AppSegmentedControl({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: context.background,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: options.asMap().entries.map((entry) {
          final option = entry.value;
          final isSelected = option.value == value;
          return GestureDetector(
            onTap: () => onChanged(option.value),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.w),
              decoration: BoxDecoration(
                color: isSelected ? context.surface : Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                option.label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? context.textPrimary : context.lightGrey,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
