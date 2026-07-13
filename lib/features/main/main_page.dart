import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_easy_starter/core/theme/app_colors.dart';
import 'package:flutter_easy_starter/features/intro/intro_page.dart';
import 'package:flutter_easy_starter/features/message/message_page.dart';
import 'package:flutter_easy_starter/features/profile/profile_page.dart';
import 'package:flutter_easy_starter/features/travel/pages/travel_home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 主框架页面 - 底部导航
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const IntroPage(),
    const TravelHomePage(),
    const MessagePage(),
    const ProfilePage(),
  ];

  void switchToTab(int index) {
    if (index >= 0 && index < _pages.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    const double barHeight = 80;
    const double indicatorWidth = 56;
    const double indicatorHeight = 42;

    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surface.withValues(alpha: 0.55),
            border: Border(
              top: BorderSide(
                color: AppColors.white.withValues(alpha: 0.08),
                width: 0.5,
              ),
            ),
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: barHeight.w,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final itemWidth = constraints.maxWidth / 4;
                  final indicatorLeft = _currentIndex * itemWidth +
                      (itemWidth - indicatorWidth) / 2;
                  final indicatorTop = (barHeight.w - indicatorHeight) / 2;

                  return Stack(
                    children: [
                      // 滑动指示器 - 毛玻璃背景上平滑滑动的选中条
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOutCubic,
                        left: indicatorLeft,
                        top: indicatorTop,
                        child: Container(
                          width: indicatorWidth,
                          height: indicatorHeight,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(
                              indicatorHeight / 2,
                            ),
                          ),
                        ),
                      ),
                      // Tab 项
                      Row(
                        children: [
                          _buildNavItem(
                            0,
                            Icons.info_outline,
                            Icons.info,
                            '介绍',
                            itemWidth,
                          ),
                          _buildNavItem(
                            1,
                            Icons.travel_explore_outlined,
                            Icons.travel_explore,
                            '探索',
                            itemWidth,
                          ),
                          _buildNavItem(
                            2,
                            Icons.chat_bubble_outline,
                            Icons.chat_bubble,
                            '消息',
                            itemWidth,
                          ),
                          _buildNavItem(
                            3,
                            Icons.person_outline,
                            Icons.person,
                            '我的',
                            itemWidth,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    IconData activeIcon,
    String label,
    double itemWidth,
  ) {
    final isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        width: itemWidth,
        height: 80.w,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.primary : AppColors.lightGrey,
              size: 24,
            ),
            SizedBox(height: 4.w),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? AppColors.primary : AppColors.lightGrey,
                fontSize: 10.sp,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// IndexedStack 实现
class IndexedStack extends StatelessWidget {
  final int index;
  final List<Widget> children;

  const IndexedStack({
    super.key,
    required this.index,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: children.asMap().entries.map((entry) {
        return Offstage(
          offstage: entry.key != index,
          child: TickerMode(
            enabled: entry.key == index,
            child: entry.value,
          ),
        );
      }).toList(),
    );
  }
}
