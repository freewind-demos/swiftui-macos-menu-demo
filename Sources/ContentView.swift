import SwiftUI

struct ContentView: View {
    @State private var selectedColor = "蓝色"
    @State private var showAlert = false

    let colors = ["蓝色", "红色", "绿色", "黄色"]

    var body: some View {
        Form {
            Section("基础 Menu") {
                Menu("选择颜色") {
                    ForEach(colors, id: \.self) { color in
                        Button(color) {
                            selectedColor = color
                        }
                    }
                }
                Text("选择了: \(selectedColor)")
                    .foregroundColor(.secondary)
            }

            Section("带图标的 Menu") {
                Menu {
                    Button {
                        selectedColor = "蓝色"
                    } label: {
                        Label("蓝色", systemImage: "circle.fill")
                    }

                    Button {
                        selectedColor = "红色"
                    } label: {
                        Label("红色", systemImage: "circle.fill")
                    }

                    Divider()

                    Button {
                        selectedColor = "绿色"
                    } label: {
                        Label("绿色", systemImage: "circle.fill")
                    }
                } label: {
                    Label("颜色选择", systemImage: "paintpalette")
                }
            }

            Section("嵌套菜单") {
                Menu("文件操作") {
                    Button("新建") {}
                    Button("打开") {}
                    Button("保存") {}

                    Divider()

                    Menu("导出") {
                        Button("导出为 PDF") {}
                        Button("导出为图片") {}
                        Button("导出为文本") {}
                    }

                    Divider()

                    Button("关闭") {}
                }
            }

            Section("Alert 弹窗") {
                Button("显示 Alert") {
                    showAlert = true
                }
                .alert("标题", isPresented: $showAlert) {
                    Button("取消", role: .cancel) {}
                    Button("确定") {}
                    Button("删除", role: .destructive) {}
                } message: {
                    Text("这是提示信息内容")
                }
            }

            Section("确认对话框") {
                Button("显示确认") {
                    showAlert = true
                }
            }
        }
        .formStyle(.grouped)
        .padding()
    }
}
