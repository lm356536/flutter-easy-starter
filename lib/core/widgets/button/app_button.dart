import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';
import 'package:flutter_easy_starter/core/widgets/button/animated_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 按钮类型
enum AppButtonType {
  /// 主按钮 - 品牌色填充
  primary,

  /// 次按钮 - 背景色填充
  secondary,

  /// 危险按钮 - 错误色填充
  danger,

  /// 幽灵按钮 - 透明背景 + 品牌色文字
  ghost,

  /// 描边按钮 - 透明背景 + 品牌色边框
  outline,

  /// 文字按钮 - 仅文字
  text,
}

/// 按钮尺寸
enum AppButtonSize {
  /// 小号 - 32
  small,

  /// 中号 - 44 (默认)
  medium,

  /// 大号 - 52
  large,
}

/// 应用统一按钮组件。
///
/// 基于 [AnimatedButton] 封装，集成点击缩放、触觉反馈、涟漪效果。
/// 支持 6 种按钮类型、3 种尺寸、loading/disabled 状态，自动适配暗亮主题。
///
/// 使用示例：
/// ```dart
/// AppButton(
///   label: '登录',
///   onPressed: _login,
///   type: AppButtonType.primary,
/// )
///
/// AppButton(
///   label: '删除',
///   icon: Icon(LucideIcons.trash_2),
///   onPressed: _delete,
///   type: AppButtonType.danger,
///   expanded: true,
/// )
///
/// AppButton(
///   label: '提交中',
///   onPressed: _submit,
///   isLoading: true,
/// )
/// ```
class AppButton extends StatelessWidget {
  /// 按钮文本
  final String? label;

  /// 前置图标
  final Widget? icon;

  /// 自定义子组件（优先级高于 label + icon）
  final Widget? customChild;

  /// 点击回调
  final VoidCallback? onPressed;

  /// 按钮类型，默认 [AppButtonType.primary]
  final AppButtonType type;

  /// 按钮尺寸，默认 [AppButtonSize.medium]
  final AppButtonSize size;

  /// 是否显示加载状态
  final bool isLoading;

  /// 是否撑满父容器宽度
  final bool expanded;

  /// 是否禁用
  final bool disabled;

  /// 渐变背景（优先级高于 backgroundColor 和 type 默认色）
  final LinearGradient? gradient;

  /// 自定义背景色（覆盖 type 默认色）
  final Color? backgroundColor;

  /// 自定义文字/图标色（覆盖 type 默认色）
  final Color? foregroundColor;

  const AppButton({
    super.key,
    this.label,
    this.icon,
    this.customChild,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.size = AppButtonSize.medium,
    this.isLoading = false,
    this.expanded = false,
    this.disabled = false,
    this.gradient,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// 是否可点击（需同时满足有回调、非禁用、非加载中）
  bool get _canTap => onPressed != null && !disabled && !isLoading;

  /// 是否处于活跃视觉状态（非禁用时即为活跃，加载中保持颜色）
  bool get _visualActive => !disabled;

  @override
  Widget build(BuildContext context) {
    final canTap = _canTap;
    final visualActive = _visualActive;
    return AnimatedButton(
      onTap: canTap ? onPressed : null,
      scaleDown: type == AppButtonType.text ? 0.98 : 0.95,
      enableRipple: canTap,
      rippleColor: _rippleColor(context),
      borderRadius: BorderRadius.circular(_borderRadius),
      child: _buildContainer(context, visualActive),
    );
  }

  // ------ 几何属性 ------

  double get _borderRadius {
    switch (size) {
      case AppButtonSize.small:
        return 8.r;
      case AppButtonSize.medium:
        return 10.r;
      case AppButtonSize.large:
        return 12.r;
    }
  }

  double get _height {
    switch (size) {
      case AppButtonSize.small:
        return 32.w;
      case AppButtonSize.medium:
        return 44.w;
      case AppButtonSize.large:
        return 52.w;
    }
  }

  double get _horizontalPadding {
    switch (size) {
      case AppButtonSize.small:
        return 16.w;
      case AppButtonSize.medium:
        return 20.w;
      case AppButtonSize.large:
        return 24.w;
    }
  }

  double get _iconSize {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 20;
    }
  }

  double get _textFontSize {
    switch (size) {
      case AppButtonSize.small:
        return 13.sp;
      case AppButtonSize.medium:
        return 14.sp;
      case AppButtonSize.large:
        return 16.sp;
    }
  }

  // ------ 颜色系统（主题感知） ------

  Color? _rippleColor(BuildContext context) {
    if (gradient != null) return Colors.white;
    if (foregroundColor != null) return foregroundColor;
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.danger:
        return Colors.white;
      case AppButtonType.secondary:
      case AppButtonType.ghost:
      case AppButtonType.outline:
      case AppButtonType.text:
        return context.primary;
    }
  }

  Color? _bgColor(BuildContext context, bool isActive) {
    if (gradient != null) return null;
    if (backgroundColor != null) return backgroundColor!;
    switch (type) {
      case AppButtonType.primary:
        return isActive ? context.primary : context.surfaceVariant;
      case AppButtonType.secondary:
        return isActive
            ? context.surfaceVariant
            : context.surfaceVariant.withValues(alpha: 0.6);
      case AppButtonType.danger:
        return isActive
            ? context.error.withValues(alpha: 0.9)
            : context.surfaceVariant;
      case AppButtonType.ghost:
      case AppButtonType.outline:
      case AppButtonType.text:
        return Colors.transparent;
    }
  }

  Color _fgColor(BuildContext context, bool isActive) {
    if (gradient != null) return Colors.white;
    if (foregroundColor != null) return foregroundColor!;
    switch (type) {
      case AppButtonType.primary:
      case AppButtonType.danger:
        return Colors.white;
      case AppButtonType.secondary:
        return isActive ? context.textPrimary : context.textSecondary;
      case AppButtonType.ghost:
      case AppButtonType.outline:
      case AppButtonType.text:
        return isActive ? context.primary : context.textSecondary;
    }
  }

  BoxBorder? _border(BuildContext context, bool isActive) {
    if (type != AppButtonType.outline) return null;
    return Border.all(
      color: isActive ? context.primary : context.divider,
      width: 1.5,
    );
  }

  List<BoxShadow>? _shadow(BuildContext context, bool isActive) {
    if (gradient != null) {
      if (!isActive) return null;
      return [
        BoxShadow(
          color: gradient!.colors.first.withValues(alpha: 0.3),
          blurRadius: 10,
          spreadRadius: 0,
        ),
      ];
    }
    if (type != AppButtonType.primary && type != AppButtonType.danger)
      return null;
    if (!isActive) return null;
    return [
      BoxShadow(
        color: (_bgColor(context, isActive) ?? Colors.transparent)
            .withValues(alpha: 0.3),
        blurRadius: 8,
        spreadRadius: 0,
      ),
    ];
  }

  // ------ 构建 ------

  Widget _buildContainer(BuildContext context, bool isActive) {
    final body = customChild ?? _buildBody(context, isActive);

    final button = Container(
      width: expanded ? double.infinity : null,
      height: _height,
      padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
      decoration: BoxDecoration(
        color: _bgColor(context, isActive),
        gradient: gradient,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: _border(context, isActive),
        boxShadow: _shadow(context, isActive),
      ),
      child: body,
    );

    // 渐变按钮禁用时降低透明度
    if (gradient != null && !isActive)
      return Opacity(opacity: 0.5, child: button);
    return button;
  }

  Widget _buildBody(BuildContext context, bool isActive) {
    if (isLoading) return _buildLoading(context, isActive);
    return _buildTextContent(context, isActive);
  }

  Widget _buildTextContent(BuildContext context, bool isActive) {
    final showLabel = label != null;
    final showIcon = icon != null;
    if (!showLabel && !showIcon) return const SizedBox.shrink();

    final children = <Widget>[];
    if (showIcon) {
      children.add(icon!);
      if (showLabel) children.add(SizedBox(width: 8.w));
    }
    if (showLabel) {
      children.add(
        Text(
          label!,
          style: TextStyle(
            fontSize: _textFontSize,
            fontWeight: FontWeight.w600,
            color: _fgColor(context, isActive),
          ),
        ),
      );
    }
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }

  Widget _buildLoading(BuildContext context, bool isActive) {
    final showLabel = label != null;
    final children = <Widget>[
      SizedBox(
        width: _iconSize,
        height: _iconSize,
        child: CircularProgressIndicator(
          strokeWidth: 2.5,
          valueColor:
              AlwaysStoppedAnimation<Color>(_fgColor(context, isActive)),
        ),
      ),
    ];
    if (showLabel) {
      children.add(SizedBox(width: 8.w));
      children.add(
        Text(
          label!,
          style: TextStyle(
            fontSize: _textFontSize,
            fontWeight: FontWeight.w600,
            color: _fgColor(context, isActive),
          ),
        ),
      );
    }
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
