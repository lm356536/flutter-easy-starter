import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';

/// Tech Blue 主题配置
///
/// 特点：
/// - 纯黑背景（深色模式）/ 浅灰背景（浅色模式）
/// - 科技蓝强调色贯穿始终
/// - 半透明玻璃效果
/// - iOS 风格
class AppTheme {
  AppTheme._();

  static ThemeData get dark => _buildTheme(Brightness.dark);
  static ThemeData get light => _buildTheme(Brightness.light);

  static ThemeData _buildTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;

    // ============================================================
    // Color tokens — 按 brightness 切换
    // ============================================================
    final Color background =
        isDark ? AppColors.background : const Color(0xFFF5F5F7);
    final Color surface = isDark ? AppColors.surface : const Color(0xFFFFFFFF);
    final Color onSurface = isDark ? AppColors.white : const Color(0xFF1C1C1E);
    final Color textSecondary =
        isDark ? AppColors.lightGrey : const Color(0xFF8E8E93);
    final Color dividerColor =
        isDark ? AppColors.divider : const Color(0xFFE5E5EA);
    final Color borderColor =
        isDark ? AppColors.border : const Color(0xFFE5E5EA);
    final Color inputFill =
        isDark ? AppColors.glassWhite : const Color(0xFFF2F2F7);
    final Color surfaceVariant =
        isDark ? AppColors.surfaceVariant : const Color(0xFFF2F2F7);
    final Color trackGrey =
        isDark ? AppColors.tertiaryGrey : const Color(0xFFE5E5EA);
    final Color thumbGrey =
        isDark ? AppColors.lightGrey : const Color(0xFFC7C7CC);

    // ============================================================
    // TextTheme — 按亮度切换颜色
    // ============================================================
    TextTheme buildTextTheme() {
      final TextStyle primaryText = TextStyle(
        fontFamily: AppTypography.fontFamily,
        color: onSurface,
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

      // ============================================================
      // 颜色方案
      // ============================================================
      colorScheme: isDark
          ? const ColorScheme.dark(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              secondary: AppColors.pink,
              onSecondary: AppColors.white,
              surface: AppColors.surface,
              onSurface: AppColors.white,
              error: AppColors.error,
              onError: AppColors.white,
              outline: AppColors.border,
              background: AppColors.background,
            )
          : const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              secondary: AppColors.pink,
              onSecondary: AppColors.white,
              surface: Color(0xFFFFFFFF),
              onSurface: Color(0xFF1C1C1E),
              error: AppColors.error,
              onError: AppColors.white,
              outline: Color(0xFFE5E5EA),
              background: Color(0xFFF5F5F7),
            ),

      scaffoldBackgroundColor: background,

      // ============================================================
      // AppBar
      // ============================================================
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: background,
        foregroundColor: onSurface,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          color: onSurface,
          fontSize: AppTypography.subtitle,
          fontWeight: AppTypography.semiBold,
          letterSpacing: -0.5,
        ),
        toolbarHeight: 56,
      ),

      // ============================================================
      // 底部导航
      // ============================================================
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: isDark ? AppColors.white : AppColors.primary,
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
        color: surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        margin: EdgeInsets.zero,
      ),

      // ============================================================
      // ElevatedButton
      // ============================================================
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          disabledBackgroundColor: trackGrey,
          disabledForegroundColor: textSecondary,
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.semiBold,
            letterSpacing: -0.2,
          ),
        ),
      ),

      // ============================================================
      // OutlinedButton
      // ============================================================
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          side: BorderSide(color: borderColor, width: 1),
          foregroundColor: onSurface,
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.semiBold,
            letterSpacing: -0.2,
          ),
        ),
      ),

      // ============================================================
      // TextButton
      // ============================================================
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          textStyle: const TextStyle(
            fontFamily: AppTypography.fontFamily,
            fontSize: AppTypography.body,
            fontWeight: AppTypography.medium,
          ),
        ),
      ),

      // ============================================================
      // 输入框
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
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          borderSide: const BorderSide(color: AppColors.error, width: 1.5),
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
        textColor: onSurface,
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.bodyLarge,
          fontWeight: AppTypography.regular,
          color: onSurface,
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
      // 开关 — iOS 风格
      // ============================================================
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.white;
          }
          return thumbGrey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return trackGrey;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ============================================================
      // 复选框
      // ============================================================
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        side: BorderSide(color: borderColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.sm),
        ),
      ),

      // ============================================================
      // 单选框
      // ============================================================
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primary;
          }
          return borderColor;
        }),
      ),

      // ============================================================
      // 底部弹窗
      // ============================================================
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
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
        backgroundColor: surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.xl),
        ),
        titleTextStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.headline,
          fontWeight: AppTypography.bold,
          color: onSurface,
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
      // 浮动按钮
      // ============================================================
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        extendedPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      ),

      // ============================================================
      // TabBar
      // ============================================================
      tabBarTheme: TabBarThemeData(
        labelColor: onSurface,
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
        indicatorColor: AppColors.primary,
        dividerColor: dividerColor,
      ),

      // ============================================================
      // Chip
      // ============================================================
      chipTheme: ChipThemeData(
        backgroundColor: surfaceVariant,
        selectedColor: AppColors.primary,
        labelStyle: TextStyle(
          fontFamily: AppTypography.fontFamily,
          fontSize: AppTypography.body,
          fontWeight: AppTypography.medium,
          color: onSurface,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
          side: BorderSide.none,
        ),
      ),

      // ============================================================
      // 进度指示器
      // ============================================================
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: AppColors.primary,
        linearMinHeight: 3,
        linearTrackColor: trackGrey,
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
        backgroundColor: onSurface,
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
          color: onSurface,
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
        color: surface,
        elevation: 0,
      ),
    );
  }
}
