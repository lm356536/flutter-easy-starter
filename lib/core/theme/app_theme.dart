import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';

/// Tech Blue 主题配置
///
/// 特点：
/// - 纯黑背景（深色模式）/ 浅灰背景（浅色模式）
/// - 科技蓝强调色贯穿始终
/// - 半透明玻璃效果
/// - iOS 风格
///
/// 换主色只需修改 [AppColors.primary]，[ColorScheme.fromSeed] 自动派生整套调色板，
/// 所有 Material 组件自动适配，无需手动配置颜色。
class AppTheme {
  AppTheme._();

  static ThemeData get dark => _buildTheme(Brightness.dark);
  static ThemeData get light => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    // ============================================================
    // ColorScheme — 由种子色自动派生，换主色只改 AppColors.primary
    // ============================================================
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      // 覆盖自动生成的值，保持精准品牌色
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.pink,
      onSecondary: AppColors.white,
      surface: isDark ? AppColors.surface : const Color(0xFFFFFFFF),
      onSurface: isDark ? AppColors.white : const Color(0xFF1C1C1E),
      error: AppColors.error,
      onError: AppColors.white,
      outline: isDark ? AppColors.border : const Color(0xFFE5E5EA),
    );

    // 自定义 token — colorScheme 无法覆盖的细节
    final Color background =
        isDark ? AppColors.background : const Color(0xFFF5F5F7);
    final Color textSecondary =
        isDark ? AppColors.lightGrey : const Color(0xFF8E8E93);
    final Color inputFill =
        isDark ? AppColors.glassWhite : const Color(0xFFF2F2F7);
    final Color dividerColor =
        isDark ? AppColors.divider : const Color(0xFFE5E5EA);

    // ============================================================
    // TextTheme — 按亮度切换颜色
    // ============================================================
    TextTheme buildTextTheme() {
      final TextStyle primaryText = TextStyle(
        fontFamily: AppTypography.fontFamily,
        color: colorScheme.onSurface,
      );
      final TextStyle secondaryText = TextStyle(
        fontFamily: AppTypography.fontFamily,
        color: textSecondary,
      );

      return TextTheme(
        displayLarge: primaryText.copyWith(
          fontSize: 34,
          fontWeight: AppTypography.bold,
          letterSpacing: -0.5,
        ),
        displayMedium: primaryText.copyWith(
          fontSize: 28,
          fontWeight: AppTypography.bold,
          letterSpacing: -0.5,
        ),
        displaySmall: primaryText.copyWith(
          fontSize: 22,
          fontWeight: AppTypography.bold,
          letterSpacing: -0.5,
        ),
        headlineLarge: primaryText.copyWith(
          fontSize: 28,
          fontWeight: AppTypography.bold,
          letterSpacing: -0.5,
        ),
        headlineMedium: primaryText.copyWith(
          fontSize: 22,
          fontWeight: AppTypography.bold,
          letterSpacing: -0.5,
        ),
        headlineSmall: primaryText.copyWith(
          fontSize: 19,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.5,
        ),
        titleLarge: primaryText.copyWith(
          fontSize: 19,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.5,
        ),
        titleMedium: primaryText.copyWith(
          fontSize: 17,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.5,
        ),
        titleSmall: primaryText.copyWith(
          fontSize: 15,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.3,
        ),
        bodyLarge: primaryText.copyWith(
          fontSize: 17,
          fontWeight: AppTypography.regular,
          letterSpacing: -0.3,
        ),
        bodyMedium: secondaryText.copyWith(
          fontSize: 15,
          fontWeight: AppTypography.regular,
          letterSpacing: -0.2,
        ),
        bodySmall: secondaryText.copyWith(
          fontSize: 13,
          fontWeight: AppTypography.regular,
          letterSpacing: -0.1,
        ),
        labelLarge: primaryText.copyWith(
          fontSize: 15,
          fontWeight: AppTypography.medium,
          letterSpacing: -0.2,
        ),
        labelMedium: secondaryText.copyWith(
          fontSize: 13,
          fontWeight: AppTypography.medium,
          letterSpacing: -0.1,
        ),
        labelSmall: secondaryText.copyWith(
          fontSize: 11,
          fontWeight: AppTypography.medium,
          letterSpacing: 0,
        ),
      );
    }

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,

      // ============================================================
      // AppBar
      // ============================================================
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: background,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: colorScheme.onSurface,
          fontSize: AppTypography.subtitle,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.5,
        ),
        toolbarHeight: 56,
      ),

      // ============================================================
      // 底部导航 — 颜色由 colorScheme 自动处理
      // ============================================================
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: isDark ? AppColors.white : colorScheme.primary,
        unselectedItemColor: textSecondary,
        selectedLabelStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 11,
          fontWeight: AppTypography.medium,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: 11,
          fontWeight: AppTypography.regular,
        ),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),

      // ============================================================
      // 卡片
      // ============================================================
      cardTheme: CardThemeData(
        elevation: 0,
        color: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        margin: EdgeInsets.zero,
      ),

      // ============================================================
      // ElevatedButton — 颜色由 colorScheme.primary 自动处理
      // ============================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.semiBold,
            letterSpacing: -0.2,
          ),
        ),
      ),

      // ============================================================
      // OutlinedButton — 颜色由 colorScheme 自动处理
      // ============================================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.semiBold,
            letterSpacing: -0.2,
          ),
        ),
      ),

      // ============================================================
      // TextButton — 颜色由 colorScheme 自动处理
      // ============================================================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.medium,
          ),
        ),
      ),

      // ============================================================
      // 输入框 — 聚焦边框颜色跟随 colorScheme.primary
      // ============================================================
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: inputFill,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: BorderSide(color: colorScheme.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: BorderSide(color: colorScheme.error, width: 1.5),
        ),
        hintStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: textSecondary,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.regular,
        ),
        labelStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: textSecondary,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.medium,
        ),
        errorStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: AppColors.error,
          fontSize: AppTypography.caption,
          fontWeight: AppTypography.medium,
        ),
        prefixIconColor: textSecondary,
        suffixIconColor: textSecondary,
      ),

      // ============================================================
      // 文字主题
      // ============================================================
      textTheme: buildTextTheme(),

      // ============================================================
      // 分隔线
      // ============================================================
      dividerTheme: DividerThemeData(
        color: dividerColor,
        thickness: 0.5,
        space: 1,
      ),

      // ============================================================
      // 列表项
      // ============================================================
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        minLeadingWidth: 40,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        iconColor: textSecondary,
        textColor: colorScheme.onSurface,
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.bodyLarge,
          fontWeight: AppTypography.regular,
          color: colorScheme.onSurface,
          letterSpacing: -0.3,
        ),
        subtitleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.regular,
          color: textSecondary,
          letterSpacing: -0.2,
        ),
      ),

      // ============================================================
      // 底部弹窗
      // ============================================================
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xxl),
          ),
        ),
        clipBehavior: Clip.antiAlias,
      ),

      // ============================================================
      // 对话框
      // ============================================================
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.headline,
          fontWeight: AppTypography.bold,
          color: colorScheme.onSurface,
          letterSpacing: -0.5,
        ),
        contentTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.regular,
          color: textSecondary,
          letterSpacing: -0.2,
        ),
      ),

      // ============================================================
      // FAB — 颜色由 colorScheme 自动处理
      // ============================================================
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        extendedPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),

      // ============================================================
      // TabBar — indicator 颜色由 colorScheme 自动处理
      // ============================================================
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: textSecondary,
        labelStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.semiBold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.regular,
        ),
        dividerColor: dividerColor,
      ),

      // ============================================================
      // Chip — 选中态颜色由 colorScheme 自动处理
      // ============================================================
      chipTheme: ChipThemeData(
        labelStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.medium,
          color: colorScheme.onSurface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          side: BorderSide.none,
        ),
      ),

      // ============================================================
      // 进度指示器 — 颜色由 colorScheme.primary 自动处理
      // ============================================================
      progressIndicatorTheme: ProgressIndicatorThemeData(
        linearMinHeight: 3,
      ),

      // ============================================================
      // 滚动条
      // ============================================================
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(3),
        thumbColor: WidgetStateProperty.all(textSecondary),
        radius: const Radius.circular(AppRadius.sm),
        minThumbLength: 40,
      ),

      // ============================================================
      // SnackBar
      // ============================================================
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.onSurface,
        contentTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.medium,
          color: isDark ? AppColors.white : AppColors.background,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      // ============================================================
      // 工具提示
      // ============================================================
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: colorScheme.onSurface,
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
        textStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.caption,
          fontWeight: AppTypography.medium,
          color: isDark ? AppColors.white : AppColors.background,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // ============================================================
      // BottomAppBar
      // ============================================================
      bottomAppBarTheme: BottomAppBarThemeData(
        color: colorScheme.surface,
        elevation: 0,
      ),
    );
  }
}
