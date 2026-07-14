import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 单选组的单个选项数据。
class AppRadioOption<T> {
  final T value;
  final String label;

  const AppRadioOption({
    required this.value,
    required this.label,
  });
}

/// 应用统一的单选组组件。
///
/// 带动画的 iOS 风格单选按钮组，支持泛型数据类型。
/// [value] 当前选中的值
/// [options] 选项列表
/// [onChanged] 选中变化回调，返回选中项的值
/// [direction] 排列方向，默认为水平
class AppRadioGroup<T> extends StatelessWidget {
  final T value;
  final List<AppRadioOption<T>> options;
  final ValueChanged<T> onChanged;
  final Axis direction;

  const AppRadioGroup({
    super.key,
    required this.value,
    required this.options,
    required this.onChanged,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];
    for (int i = 0; i < options.length; i++) {
      list.add(_RadioItem(
        label: options[i].label,
        isSelected: options[i].value == value,
        onTap: () => onChanged(options[i].value),
      ));
      if (i < options.length - 1) {
        list.add(SizedBox(width: 20.w));
      }
    }

    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      children: list,
    );
  }
}

class _RadioItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _RadioItem({
    required this.label,
    required this.isSelected,
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
              color: isSelected ? context.primary : Colors.transparent,
              borderRadius: BorderRadius.circular(11.r),
              border: Border.all(
                color: isSelected ? context.primary : context.lightGrey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Icon(LucideIcons.check, color: Colors.white, size: 14)
                : null,
          ),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: isSelected ? context.textPrimary : context.lightGrey,
            ),
          ),
        ],
      ),
    );
  }
}
