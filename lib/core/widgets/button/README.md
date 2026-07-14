# 按钮组件 AppButton

统一按钮组件，基于 `AnimatedButton` 封装，集成点击缩放、触觉反馈、涟漪效果，自动适配暗亮主题。

## 快速上手

```dart
import 'package:flutter_easy_starter/core/widgets/button/app_button.dart';

AppButton(
  label: '登录',
  onPressed: _login,
)
```

## 按钮类型

| 类型 | 样式 | 使用场景 |
|------|------|----------|
| `primary`（默认） | 品牌色填充 + 投影 | 主要操作（提交、确认、登录） |
| `secondary` | 背景色填充 | 次要操作（取消、返回） |
| `danger` | 错误色填充 + 投影 | 危险操作（删除、退出、重置） |
| `ghost` | 透明背景 + 品牌色文字 | 轻量操作（查看详情、更多） |
| `outline` | 透明背景 + 品牌色描边 | 强调但非主要操作（下载、预览） |
| `text` | 纯文字，无背景无边框 | 极轻量操作（关闭、跳过） |

```dart
AppButton(label: '主要', onPressed: _action)
AppButton(label: '次要', onPressed: _action, type: AppButtonType.secondary)
AppButton(label: '删除', onPressed: _action, type: AppButtonType.danger)
AppButton(label: '查看', onPressed: _action, type: AppButtonType.ghost)
AppButton(label: '预览', onPressed: _action, type: AppButtonType.outline)
AppButton(label: '跳过', onPressed: _action, type: AppButtonType.text)
```

## 尺寸

| 尺寸 | 高度 | 圆角 | 字号 |
|------|------|------|------|
| `small` | 32w | 8r | 13sp |
| `medium`（默认） | 44w | 10r | 14sp |
| `large` | 52w | 12r | 16sp |

```dart
AppButton(label: '小', size: AppButtonSize.small)
AppButton(label: '中')  // 默认
AppButton(label: '大', size: AppButtonSize.large)
```

## 核心特性

### Loading 状态

显示旋转动画 + 文字，颜色保持活跃态，不可点击：

```dart
AppButton(label: '提交中', isLoading: true)
```

### 禁用状态

按钮变灰，不可点击：

```dart
AppButton(label: '提交', disabled: true)
```

### 图标按钮

**纯图标**（无文字）—— 自动变为正方形，半透明背景：

```dart
AppButton(
  icon: Icon(LucideIcons.heart, color: context.red, size: 20),
  onPressed: _like,
  backgroundColor: context.red,  // 背景自动取 15% 透明度
)
```

**图标 + 文字**：

```dart
AppButton(
  icon: Icon(LucideIcons.download, size: 18),
  label: '下载',
  onPressed: _download,
)
```

### 渐变按钮

使用 `gradient` 参数覆盖纯色背景：

```dart
AppButton(
  label: '蓝色渐变',
  onPressed: _action,
  gradient: const LinearGradient(
    colors: [Color(0xFF0A84FF), Color(0xFF5AC8FA)],
  ),
)
```

### 撑满宽度

```dart
AppButton(label: '提交', expanded: true)
```

### 自定义颜色

覆盖 `type` 的默认配色：

```dart
AppButton(
  label: '自定义',
  backgroundColor: context.orange,
  foregroundColor: Colors.white,
)
```

## 颜色优先级

```
gradient > backgroundColor > type 默认色
```

## 完整示例

```dart
AppButton(
  label: '提交订单',
  icon: Icon(LucideIcons.shopping_cart),
  onPressed: _submit,
  type: AppButtonType.primary,
  size: AppButtonSize.large,
  expanded: true,
  isLoading: _isLoading,
)
```

## 迁移说明

- `CommonButton` 已废弃，请使用 `AppButton` 替代
- 替换对照：`CommonButton(text:)` → `AppButton(label:)`, `ButtonType` → `AppButtonType`
