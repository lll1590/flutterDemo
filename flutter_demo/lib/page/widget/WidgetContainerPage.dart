import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/page/view/GridItemView.dart';

class WidgetContainerPage extends StatefulWidget {
  @override
  WidgetContainerPageState createState() => WidgetContainerPageState();
}

class WidgetContainerPageState extends State<WidgetContainerPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("组件Demo"),
        ),
        body: GridView.count(
          primary: false,
          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
          crossAxisSpacing: ScreenUtil().setWidth(2),
          mainAxisSpacing: ScreenUtil().setWidth(2),
          crossAxisCount: 3,
          children: <Widget>[
            getCard("/base_widget_container", "基础组件", "在构建您的第一个Flutter应用程序之前，您绝对需要了解这些widget。"),
            getCard("/screen_demo", "Material Components", "实现了Material Design 指南的视觉、效果、motion-rich的widget。"),
            getCard("/screen_demo", "Cupertino(iOS风格的widget)", "用于当前iOS设计语言的美丽和高保真widget。"),
            getCard("/screen_demo", "Layout", "排列其它widget的columns、rows、grids和其它的layouts。"),
            getCard("/screen_demo", "Text", "文本显示和样式"),
            getCard("/screen_demo", "Assets、图片、Icons", "管理assets, 显示图片和Icon。"),
            getCard("/screen_demo", "Input", "Material Components 和 Cupertino中获取用户输入的widget。"),
            getCard("/screen_demo", "动画和Motion", "在您的应用中使用动画。查看Flutter中的动画总览"),
            getCard("/screen_demo", "交互模型", "响应触摸事件并将用户路由到不同的页面视图（View）。"),
            getCard("/screen_demo", "样式", "管理应用的主题，使应用能够响应式的适应屏幕尺寸或添加填充。"),
            getCard("/screen_demo", "绘制和效果", "Widget将视觉效果应用到其子组件，而不改变它们的布局、大小和位置。"),
            getCard("/screen_demo", "Async", "Flutter应用的异步模型"),
            getCard("/screen_demo", "滚动", "滚动一个拥有多个子组件的父组件"),
            getCard("/screen_demo", "辅助功能", "给你的App添加辅助功能(这是一个正在进行的工作)"),
          ],
        ));
  }

  GridItemView getCard(var path, var title, var desc){
    return new GridItemView(path: path, title: title, desc: desc);
  }
}
