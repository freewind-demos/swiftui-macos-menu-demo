# SwiftUI macOS Menu 菜单

## 简介

演示 SwiftUI 中 Menu 的用法，用于创建下拉菜单和弹出菜单。

## 快速开始

```bash
cd swiftui-macos-menu-demo
xcodegen generate
open SwiftUIMenuDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 Menu

```swift
Menu("选择颜色") {
    Button("蓝色") { }
    Button("红色") { }
    Button("绿色") { }
}
```

### Menu label

```swift
Menu {
    Button("选项1") { }
    Button("选项2") { }
} label: {
    Label("菜单", systemImage: "gear")
}
```

### 嵌套菜单

```swift
Menu("文件") {
    Button("新建") { }
    Menu("导出") {
        Button("PDF") { }
        Button("图片") { }
    }
}
```

### Alert 弹窗

```swift
@State private var showAlert = false

Button("显示") {
    showAlert = true
}
.alert("标题", isPresented: $showAlert) {
    Button("取消", role: .cancel) { }
    Button("确定") { }
} message: {
    Text("消息内容")
}
```

## 完整示例

```swift
struct ContentView: View {
    @State private var showAlert = false

    var body: some View {
        VStack {
            Menu("操作") {
                Button("开始") { }
                Button("停止") { }
                Divider()
                Button("重置") { }
            }

            Button("显示弹窗") {
                showAlert = true
            }
            .alert("确认", isPresented: $showAlert) {
                Button("取消", role: .cancel) { }
                Button("确认") { }
            } message: {
                Text("确定要执行此操作吗？")
            }
        }
    }
}
```

## 完整讲解（中文）

### Menu 的用途

- 点击后显示下拉选项
- 用于工具栏或按钮的子菜单
- 适合分组显示多个相关操作

### Alert 的用途

- 显示重要提示
- 需要用户确认
- 可以有多个按钮（取消、确认、删除等）

### 按钮角色

- `.cancel` - 取消按钮
- `.destructive` - 删除/危险操作
- 默认是普通按钮
