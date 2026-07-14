import 'package:flutter/material.dart';

/// ============================================
/// Flutter Easy Starter - Dark Social Design System
/// Theme: Dark Dating/Social App Style
/// ============================================

/// 颜色系统 - Dark Social 风格
class AppColors {
  AppColors._();

  // === 基础色 ===
  /// 纯黑背景
  static const Color black = Color(0xFF000000);

  /// 深灰表面
  static const Color darkGrey = Color(0xFF1C1C1E);

  /// 次级深灰
  static const Color secondaryDark = Color(0xFF2C2C2E);

  /// 第三级灰
  static const Color tertiaryGrey = Color(0xFF3A3A3C);

  /// 中灰
  static const Color mediumGrey = Color(0xFF48484A);

  /// 浅灰
  static const Color lightGrey = Color(0xFF8E8E93);

  /// 极浅灰
  static const Color lighterGrey = Color(0xFFADADB0);

  /// 纯白文字
  static const Color white = Color(0xFFFFFFFF);

  // === 强调色 ===
  /// 主强调色 - 紫色（类似社交App的点赞/匹配色）
  static const Color primary = Color(0xFFAF52DE);

  /// 紫色浅色
  static const Color primaryLight = Color(0xFFBF5AF2);

  /// 紫色深色
  static const Color primaryDark = Color(0xFF9F49C9);

  /// 粉红强调
  static const Color pink = Color(0xFFFF2D55);

  /// 红色
  static const Color red = Color(0xFFFF3B30);

  /// 橙色
  static const Color orange = Color(0xFFFF9500);

  /// 强调色（用于按钮、标签等）
  static const Color accent = Color(0xFFFF2D55);

  /// 黄色
  static const Color yellow = Color(0xFFFFCC00);

  /// 绿色 - 在线状态/成功
  static const Color green = Color(0xFF34C759);

  /// 青色
  static const Color teal = Color(0xFF5AC8FA);

  /// 蓝色
  static const Color blue = Color(0xFF007AFF);

  // === 功能色 ===
  /// 成功
  static const Color success = Color(0xFF34C759);

  /// 警告
  static const Color warning = Color(0xFFFF9500);

  /// 错误
  static const Color error = Color(0xFFFF3B30);

  /// 信息
  static const Color info = Color(0xFF5AC8FA);

  // === 玻璃效果 ===
  /// 玻璃白
  static const Color glassWhite = Color(0x26FFFFFF);

  /// 玻璃白浓
  static const Color glassWhiteStrong = Color(0x40FFFFFF);

  /// 玻璃黑
  static const Color glassBlack = Color(0x26000000);

  // === 页面背景 ===
  /// 页面背景 - 纯黑
  static const Color background = Color(0xFF000000);

  /// 卡片表面 - 深灰
  static const Color surface = Color(0xFF1C1C1E);

  /// 次级表面
  static const Color surfaceVariant = Color(0xFF2C2C2E);

  // === 文字色 ===
  /// 主文字 - 纯白
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// 次级文字
  static const Color textSecondary = Color(0xFF8E8E93);

  /// 三级文字
  static const Color textTertiary = Color(0xFF48484A);

  /// 禁用文字
  static const Color textDisabled = Color(0xFF3A3A3C);

  // === 边框与分隔 ===
  /// 分隔线
  static const Color divider = Color(0xFF2C2C2E);

  /// 边框
  static const Color border = Color(0xFF3A3A3C);
}

/// BuildContext 主题感知颜色扩展
///
/// 使用方式：context.background / context.surface / context.white
/// 替代 AppColors.xxx 静态常量，根据当前主题自动返回对应色值。
/// 只需在 widget 的 build 方法中用 context.xxx 即可获得正确的暗色/亮色。
/// 品牌色（primary、red、green 等）不随主题变化，保持原值。
extension ThemeColorsX on BuildContext {
  ThemeData get _t => Theme.of(this);
  bool get _isDark => _t.brightness == Brightness.dark;

  Color _c(Color dark, Color light) => _isDark ? dark : light;

  // === 基础色 ===
  Color get black => AppColors.black;
  Color get darkGrey => _c(AppColors.darkGrey, const Color(0xFFF5F5F7));
  Color get secondaryDark =>
      _c(AppColors.secondaryDark, const Color(0xFFE5E5EA));
  Color get tertiaryGrey => _c(AppColors.tertiaryGrey, const Color(0xFFE5E5EA));
  Color get mediumGrey => _c(AppColors.mediumGrey, const Color(0xFFC7C7CC));
  Color get lightGrey => AppColors.lightGrey;
  Color get lighterGrey => AppColors.lighterGrey;
  Color get white => _c(AppColors.white, const Color(0xFF1C1C1E));

  // === 强调色（品牌色，不随主题变化） ===
  Color get primary => AppColors.primary;
  Color get primaryLight => AppColors.primaryLight;
  Color get primaryDark => AppColors.primaryDark;
  Color get pink => AppColors.pink;
  Color get red => AppColors.red;
  Color get orange => AppColors.orange;
  Color get accent => AppColors.accent;
  Color get yellow => AppColors.yellow;
  Color get green => AppColors.green;
  Color get teal => AppColors.teal;
  Color get blue => AppColors.blue;

  // === 功能色 ===
  Color get success => AppColors.success;
  Color get warning => AppColors.warning;
  Color get error => AppColors.error;
  Color get info => AppColors.info;

  // === 玻璃效果 ===
  Color get glassWhite => _c(AppColors.glassWhite, const Color(0x1A000000));
  Color get glassWhiteStrong =>
      _c(AppColors.glassWhiteStrong, const Color(0x33000000));
  Color get glassBlack => AppColors.glassBlack;

  // === 页面背景 ===
  Color get background => _c(AppColors.background, const Color(0xFFF5F5F7));
  Color get surface => _c(AppColors.surface, const Color(0xFFFFFFFF));
  Color get surfaceVariant =>
      _c(AppColors.surfaceVariant, const Color(0xFFF2F2F7));

  // === 文字色 ===
  Color get textPrimary => _c(AppColors.textPrimary, const Color(0xFF1C1C1E));
  Color get textSecondary => AppColors.textSecondary;
  Color get textTertiary => _c(AppColors.textTertiary, const Color(0xFFC7C7CC));
  Color get textDisabled => _c(AppColors.textDisabled, const Color(0xFFE5E5EA));

  // === 边框与分隔 ===
  Color get divider => _c(AppColors.divider, const Color(0xFFE5E5EA));
  Color get border => _c(AppColors.border, const Color(0xFFE5E5EA));
}

// 保持 AppShadows 中引用的 AppColors 兼容
// 注意：AppShadows 中的方法不是 getter，暂时不动

/// 间距系统 - 8pt 网格
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double xxxl = 32;
  static const double xxxxl = 48;
}

/// 圆角系统
class AppRadius {
  AppRadius._();

  /// 小圆角 - 标签、小按钮
  static const double sm = 8;

  /// 标准圆角 - 按钮、输入框
  static const double md = 12;

  /// 卡片圆角
  static const double lg = 16;

  /// 大卡片
  static const double xl = 20;

  /// 超大圆角 - 底部弹窗
  static const double xxl = 24;

  /// 圆形
  static const double full = 999;
}

/// 字体系统
class AppTypography {
  AppTypography._();

  // === 字体族 ===
  static const String fontFamily = '.SF Pro Text';

  // === 字重 ===
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;

  // === 字号 ===
  static const double caption = 12;
  static const double body = 15;
  static const double bodyLarge = 17;
  static const double subtitle = 19;
  static const double title = 22;
  static const double headline = 28;
  static const double display = 34;
}

/// 阴影系统 - Dark 模式下几乎无阴影
class AppShadows {
  AppShadows._();

  static const List<BoxShadow> none = [];

  /// 微弱发光（用于强调元素）
  static const List<BoxShadow> glow = [
    BoxShadow(
      color: Color(0x40AF52DE),
      blurRadius: 20,
      spreadRadius: 0,
    ),
  ];

  /// 紫色发光
  static List<BoxShadow> purpleGlow({double opacity = 0.4}) {
    return [
      BoxShadow(
        color: AppColors.primary.withValues(alpha: opacity),
        blurRadius: 20,
        spreadRadius: 2,
      ),
    ];
  }

  /// 金色发光（VIP专属）
  static List<BoxShadow> goldGlow({double opacity = 0.5}) {
    return [
      BoxShadow(
        color: const Color(0xFFFFD700).withValues(alpha: opacity),
        blurRadius: 25,
        spreadRadius: 3,
      ),
    ];
  }
}

/// 动画时长
class AppDurations {
  AppDurations._();

  static const Duration fast = Duration(milliseconds: 150);
  static const Duration normal = Duration(milliseconds: 200);
  static const Duration slow = Duration(milliseconds: 300);
}

/// 缓动曲线
class AppEasings {
  AppEasings._();

  static const Curve standard = Curves.easeInOut;
  static const Curve enter = Curves.easeOut;
  static const Curve exit = Curves.easeIn;
  static const Curve spring = Curves.easeOutCubic;
}
