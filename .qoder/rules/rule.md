---
trigger: always_on
---

# Flutter Easy Starter 组件开发规范

## 一、目录结构与命名规范

1. **目录组织**：通用组件放 `lib/core/widgets/`（如 `selection_controls/app_switch.dart`），业务页面按 Feature-First 放 `lib/features/xxx/`，样式常量在 `lib/core/theme/`。

2. **组件命名**：通用组件统一使用 `App` 前缀（如 `AppSwitch`、`AppCheckbox`、`AppButton`），语义清晰且与项目主题一致。类名大驼峰（PascalCase），文件命名使用小写+下划线。

3. **单一职责**：组件只做 UI 渲染和事件回调，不包含业务逻辑。例如 `AppCheckboxItem` 只负责展示选中态和触发 `onChanged`，不处理具体的业务状态。

## 二、参数与接口设计规范

1. **必填参数**：核心属性（label、onChanged 等）必须用 `required` 设为必传，避免空值异常。

2. **回调判空**：所有交互回调使用 `onTap?()` 安全调用，或 `if (onChanged != null) onChanged!()` 判断后调用。

3. **泛型支持**：如 `AppRadioGroup<T>` 支持泛型 `selectedValue` 和 `options`，提高类型安全和复用性。

4. **默认值**：尽可能提供合理的默认参数覆盖 80% 场景，特殊场景通过可选参数配置。

5. **注释**：为组件和核心参数添加文档注释，说明用途、参数含义及适用场景。

## 三、颜色取值原则

颜色取值取决于**背景类型**，而非固定使用白色：

1. **品牌色背景**（primary/error/success/info 等固定颜色）：使用 `Colors.white`。这些背景不随主题变化，白色永远可见。

2. **主题色背景**（surface/background/surfaceVariant 等随暗亮变化）：使用 `context.textPrimary`，它会根据主题自动切换（暗色→白色，亮色→深色）。

3. **禁止**：在主题色背景上硬编码 `Colors.white`，否则亮色模式下文字不可见。

4. **选中态组件**（Switch/Radio/Checkbox）的 label 文字如果在 `context.surface` 背景上，必须使用 `context.textPrimary`。

## 四、主题架构规范（Seed Color）

1. **主色唯一入口**：`AppColors.primary`，通过 `ColorScheme.fromSeed(seedColor: AppColors.primary)` 自动派生整套调色板。

2. **换色成本**：更换主色只需修改 `AppColors.primary` 一行代码，所有 Material 组件自动适配。

3. **禁止**：在组件中直接引用具体颜色值（如 `Color(0xFF007AFF)`），必须通过 `AppColors.xxx` 或 `context.xxx` 引用。

4. `app_theme.dart` 的子主题配置只保留非颜色的定制项（shape、padding、font 等），颜色部分由 colorScheme 自动处理。

## 五、布局与屏幕适配规范

1. **8pt 网格**：组件的内边距、外边距、间距遵循 8 的倍数，使用 `AppSpacing` 常量引用（xs=4, sm=8, md=12, lg=16, xl=20, xxl=24）。

2. **屏幕适配**：使用 `flutter_screenutil`，宽度用 `.w`，字号用 `.sp`，圆角用 `.r`。

3. **弹性布局**：优先使用 `Expanded`、`Flexible` 实现自适应，避免固定高度。

4. **嵌套控制**：Widget 嵌套不超过 4-6 层，过深必须拆分为独立子组件。

## 六、性能优化与代码质量规范

1. **const 构造函数**：静态展示组件必须提供 `const` 构造函数，避免不必要重建。

2. **列表优化**：长列表使用 `ListView.builder` 或 `SliverList`，列表项设唯一 Key。

3. **组件复用**：重复 2 次以上的 UI 片段必须封装为独立组件，禁止复制粘贴。

4. **防御性编程**：网络图片加载处理 `placeholder` 和 `errorBuilder`；异步操作考虑 loading/error/empty 三态。

5. **避免 setState 穿透**：局部状态使用 `StatefulWidget`，避免通过 `setState` 刷新整个页面。

## 七、组件文档注释规范

1. 每个通用组件类添加 `///` 三斜线文档注释，说明用途和适用场景。

2. 核心构造参数（特别是 `required` 参数）添加文档注释。

3. 示例格式：

```dart
/// 应用统一的复选框组件。
///
/// 支持选中/未选中状态切换，在 [surface] 背景上自动适配文字颜色。
/// [label] 复选框的标签文字
/// [checked] 当前是否选中
/// [onChanged] 选中状态变化回调，返回新状态
```
