import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 多选组的单个选项数据。
class AppCheckboxOption<T> {
  final T value;
  final String label;

  const AppCheckboxOption({
    required this.value,
    required this.label,
  });
}

/// 应用统一的多选组组件。
///
/// 带动画的 iOS 风格复选框组，支持泛型数据类型。
/// [values] 当前选中的值集合
/// [options] 选项列表
/// [onChanged] 选中变化回调，返回 toggle 的值
/// [direction] 排列方向，默认为水平
class AppCheckboxGroup<T> extends StatelessWidget {
  final Set<T> values;
  final List<AppCheckboxOption<T>> options;
  final ValueChanged<T> onChanged;
  final Axis direction;

  const AppCheckboxGroup({
    super.key,
    required this.values,
    required this.options,
    required this.onChanged,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (int i = 0; i < options.length; i++) {
      list.add(_CheckboxItem(
        label: options[i].label,
        isChecked: values.contains(options[i].value),
        onTap: () => onChanged(options[i].value),
      ));
      if (i < options.length - 1) {
        list.add(SizedBox(width: 16.w));
      }
    }

    if (direction == Axis.horizontal) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}

class _CheckboxItem extends StatelessWidget {
  final String label;
  final bool isChecked;
  final VoidCallback onTap;

  const _CheckboxItem({
    required this.label,
    required this.isChecked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              color: isChecked ? context.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(
                color: isChecked ? context.primary : context.lightGrey,
                width: 2,
              ),
            ),
            child: isChecked
                ? Icon(LucideIcons.check, color: Colors.white, size: 14)
                : null,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: isChecked ? context.textPrimary : context.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
