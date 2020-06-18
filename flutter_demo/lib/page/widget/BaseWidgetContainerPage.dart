import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/page/base/BaseWidget.dart';
import 'package:flutterdemo/page/entity/WidgetInfoEntity.dart';
import 'package:flutterdemo/page/enum/WidgetEnum.dart';
import 'package:flutterdemo/page/view/GridItemView.dart';

class BaseWidgetContainerPage extends BaseWidget{
  @override
  _BaseWidgetContainerPageState getState() => _BaseWidgetContainerPageState();
}

class _BaseWidgetContainerPageState extends BaseWidgetState{
  @override
  Widget buildWidget(BuildContext context) {
    // TODO: implement buildWidget
    return Scaffold(
      body: GridView.count(
        primary: false,
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        crossAxisSpacing: ScreenUtil().setWidth(2),
        mainAxisSpacing: ScreenUtil().setWidth(2),
        crossAxisCount: 3,
        children: <Widget>[
          getCardWithParams(0, "Container", "一个拥有绘制、定位、调整大小的 widget。"),
          getCardWithParams(1, "Row", "在水平方向上排列子widget的列表。"),
          getCardWithParams(2, "Column", "在垂直方向上排列子widget的列表。"),
          getCardWithParams(3, "Image", "一个显示图片的widget"),
          getCardWithParams(4, "Text", "单一格式的文本"),
          getCardWithParams(5, "Icon", "A Material Design icon."),
          getCardWithParams(6, "RaisedButton", "Material Design中的button， 一个凸起的材质矩形按钮"),
          getCardWithParams(7, "Scaffold", "Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。"),
          getCardWithParams(8, "Appbar", "一个Material Design应用程序栏，由工具栏和其他可能的widget（如TabBar和FlexibleSpaceBar）组成。"),
          getCardWithParams(9, "FlutterLogo", "Flutter logo, 以widget形式. 这个widget遵从IconTheme。"),
          getCardWithParams(10, "Placeholder", "一个绘制了一个盒子的的widget，代表日后有widget将会被添加到该盒子中"),
        ],
      ));
  }

  @override
  void onCreate() {
    // TODO: implement onCreate
    setAppBarTitle("基础组件");
    setAppBarRightTitle("");
    _list = initData();
  }

  @override
  void onPause() {
    // TODO: implement onPause
  }

  @override
  void onResume() {
    // TODO: implement onResume
  }

  GridItemView getCard(var path, var title, var desc){
    return new GridItemView(path: path, title: title, desc: desc);
  }

  GridItemView getCardWithParams(int index, var title, var desc){
    return new GridItemView.withParams(widgetInfo: _list.elementAt(index), title: title, desc: desc);
  }

  List<WidgetInfoEntity> _list = null;

  List<WidgetInfoEntity> initData(){
    List<WidgetInfoEntity> list = new List();
    WidgetInfoEntity info = new WidgetInfoEntity(index:WidgetEnum.Container, title: "Container",
        desc: "Container将会是我们以后最常用的控件之一，Container是单容器类控件，即只包含一个子控件。Container可以装饰和定位子控件，例如设置背景颜色、形状等",
        propList: getContainerPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Row, title: "Row",
        desc: "在Row和Column中有一个非常重要的概念：MainAxisAlignment（主轴）和CrossAxisAlignment（交叉轴），简单来说，MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴，比如Row的主轴是水平方向，交叉轴是垂直方向，而Column的主轴是垂直方向，交叉轴是水平方向。Row和Column是多子控件的容器类控件，Row控件水平布局，Column控件垂直布局。",
        propList: getRowColumnPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Column, title: "Column",
        desc: "在Row和Column中有一个非常重要的概念：MainAxisAlignment（主轴）和CrossAxisAlignment（交叉轴），简单来说，MainAxisAlignment（主轴）就是与当前控件方向一致的轴，而CrossAxisAlignment（交叉轴）就是与当前控件方向垂直的轴，比如Row的主轴是水平方向，交叉轴是垂直方向，而Column的主轴是垂直方向，交叉轴是水平方向。Row和Column是多子控件的容器类控件，Row控件水平布局，Column控件垂直布局。",
        propList: getRowColumnPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Image, title: "Image",
        desc: "顾名思义，该控件是用来展示图片的",
        propList: getImagePropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Text, title: "Text",
        desc: "Text是显示文本的组件，最常用的组件，都没有之一",
        propList: getTextPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Icon, title: "Icon",
        desc: "Icon是图标控件，Icon不具有交互属性，如果想要交互，可以使用IconButton，另外Icon是具有方向性（Directionality）的，但通常情况下不会在Icon中设置textDirection，而是使用顶级控件中的设置",
        propList: getIconPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.RaisedButton, title: "RaisedButton",
        desc: "Material Design中的button， 一个凸起的材质矩形按钮",
        propList: getRaisedButtonPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.Scaffold, title: "Scaffold",
        desc: "Scaffold实现了Material风格的基本布局结构，它提供了展示drawers、snack bars和bottom sheets的功能",
        propList: getScaffoldPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.AppBar, title: "AppBar",
        desc: "AppBar是material风格的应用程序栏",
        propList: getAppBarPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.FlutterLogo, title: "FlutterLogo",
        desc: "FlutterLogo是一个显示Flutter Logo的控件，虽然FlutterLogo使用起来比较简单，但其实现并不简单，首先FlutterLogo是一个动画控件（AnimatedContainer实现），其次FlutterLogo是通过Painter绘制出来",
        propList: getFlutterLogoPropList());
    list.add(info);
    info = new WidgetInfoEntity(index:WidgetEnum.PlaceHolder, title: "PlaceHolder",
        desc: "Placeholder是一个占位符控件，用于当没有准备好构建组件时，可以使用Placeholder进行占位",
        propList: getPlaceHolderPropList());
    list.add(info);

    return list;
  }

  List<WidgetPropEntity> getPlaceHolderPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "color", desc: "颜色");
    list.add(prop);prop = WidgetPropEntity(name: "strokeWidth", desc: "线粗");
    list.add(prop);prop = WidgetPropEntity(name: "fallbackHeight", desc: "指定无限宽高属性情况下的高度");
    list.add(prop);prop = WidgetPropEntity(name: "fallbackWidth", desc: "指定无限宽高属性情况下的宽度");
    list.add(prop);
    return list;
  }

  List<WidgetPropEntity> getFlutterLogoPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "size", desc: "大小");
    list.add(prop);prop = WidgetPropEntity(name: "colors", desc: "颜色");
    list.add(prop);prop = WidgetPropEntity(name: "style", desc: "显示Flutter文字标识");
    list.add(prop);prop = WidgetPropEntity(name: "markOnly", desc: "只显示logo");
    list.add(prop);prop = WidgetPropEntity(name: "horizontal", desc: "flutter文字显示在logo右面");
    list.add(prop);prop = WidgetPropEntity(name: "stacked", desc: "flutter文字显示在logo下面");
    list.add(prop);prop = WidgetPropEntity(name: "动画", desc: "curve+duration");
    list.add(prop);
    return list;
  }

  List<WidgetPropEntity> getAppBarPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "leading", desc: "属性通常设置返回按钮，如果leading属性未设置，且Scaffold设置了Drawer则显示打开Drawer的图标；如果leading属性未设置，Scaffold也未设置Drawer，此时如果有前一个路由，则显示BackButton");
    list.add(prop);prop = WidgetPropEntity(name: "automaticallyImplyLeading", desc: "可以通过设置该属性为false改变leading属性行为");
    list.add(prop);prop = WidgetPropEntity(name: "title", desc: "应用栏上的标题，一般设置Text文本");
    list.add(prop);prop = WidgetPropEntity(name: "centerTitle", desc: "设置标题居中");
    list.add(prop);prop = WidgetPropEntity(name: "actions", desc: "在程序栏的右边，可以设置多个功能按钮");
    list.add(prop);prop = WidgetPropEntity(name: "bottom", desc: "通常请求下设置TabBar");
    list.add(prop);prop = WidgetPropEntity(name: "elevation", desc: "阴影");
    list.add(prop);prop = WidgetPropEntity(name: "shape", desc: "形状");
    list.add(prop);prop = WidgetPropEntity(name: "backgroundColor", desc: "背景");
    list.add(prop);

    return list;
  }

  List<WidgetPropEntity> getScaffoldPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "appBar", desc: "顶部Header");
    list.add(prop);prop = WidgetPropEntity(name: "body", desc: "内容显示区域");
    list.add(prop);prop = WidgetPropEntity(name: "drawer", desc: "左边抽屉");
    list.add(prop);prop = WidgetPropEntity(name: "endDrawer", desc: "右边抽屉");
    list.add(prop);prop = WidgetPropEntity(name: "bottomNavigationBar", desc: "底部导航");
    list.add(prop);prop = WidgetPropEntity(name: "persistentFooterButtons", desc: "位于body之下，bottomNavigationBar之上，不会随着body滚动而滚动");
    list.add(prop);prop = WidgetPropEntity(name: "bottomSheet", desc: "位于persistentFooterButtons之上");
    list.add(prop);
    return list;
  }

  List<WidgetPropEntity> getRaisedButtonPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "onPressed", desc: "为null或不设置时，按钮是禁用状态");
    list.add(prop);prop = WidgetPropEntity(name: "onHighlightChanged", desc: "为高亮变化回调，按下时处于高亮状态，抬起处于不高亮状态");
    list.add(prop);prop = WidgetPropEntity(name: "textColor", desc: "字体颜色");
    list.add(prop);prop = WidgetPropEntity(name: "disabledTextColor", desc: "禁用状态下字体颜色");
    list.add(prop);prop = WidgetPropEntity(name: "color", desc: "背景颜色");
    list.add(prop);prop = WidgetPropEntity(name: "disabledColor", desc: "禁用状态下背景颜色");
    list.add(prop);prop = WidgetPropEntity(name: "highlightColor", desc: "高亮颜色，按下时的颜色");
    list.add(prop);prop = WidgetPropEntity(name: "splashColor", desc: "水波纹颜色，按下松开会有水波纹效果");
    list.add(prop);prop = WidgetPropEntity(name: "elevation", desc: "按钮阴影");
    list.add(prop);prop = WidgetPropEntity(name: "highlightElevation", desc: "高亮阴影");
    list.add(prop);prop = WidgetPropEntity(name: "disabledElevation", desc: "禁用阴影");
    list.add(prop);prop = WidgetPropEntity(name: "shape", desc: "设置按钮的形状，比如设置为圆形");
    list.add(prop);prop = WidgetPropEntity(name: "其他Button：", desc: "FlatButton、OutlineButton用法和RaisedButton一样");
    list.add(prop);prop = WidgetPropEntity(name: "FlatButton", desc: "FlatButton是一个扁平的按钮");
    list.add(prop);prop = WidgetPropEntity(name: "OutlineButton", desc: "OutlineButton 是一个带边框的按钮");
    list.add(prop);

    return list;
  }

  List<WidgetPropEntity> getTextPropList(){
    List<WidgetPropEntity> list = List();
    WidgetPropEntity prop = WidgetPropEntity(name: "style", desc: "tyle是文本的样式，可以设置颜色、字体、大小、背景颜色等等，具体参考TextStyle");
    list.add(prop);prop = WidgetPropEntity(name: "textAlign", desc: "textAlign参数是文本的对齐方式");
    list.add(prop);prop = WidgetPropEntity(name: "textDirection", desc: "textDirection是指文本的方向，有TextDirection.ltr从左到右和TextDirection.rtl从右到左，阿拉伯等国家的文字就是从右到左");
    list.add(prop);prop = WidgetPropEntity(name: "softWrap和overflow", desc: "softWrap表示是否自动换行，设置为false时，显示不全的文本将会按照overflow的设置的方式显示，比如以省略号结尾");
    list.add(prop);prop = WidgetPropEntity(name: "overflow", desc: "clip：直接裁剪；fade：越来越透明；ellipsis：省略号结尾；visible：依然显示，此时将会溢出父组件");
    list.add(prop);prop = WidgetPropEntity(name: "textScaleFactor", desc: "textScaleFactor是文字缩放系数");
    list.add(prop);
    return list;
  }

  List<WidgetPropEntity> getImagePropList(){
    List<WidgetPropEntity> list = new List();
    WidgetPropEntity prop = new WidgetPropEntity(name: "加载网络图片", desc: "Image.network(url, width, height)");
    list.add(prop);prop = new WidgetPropEntity(name: "加载本地图片", desc: "在pubspec.yaml文件中添加assets,指定图片名称，也可以只指定图片目录(这样就可以将该目录下所有图片加载进来)；然后通过Image.asset(path, width, height)");
    list.add(prop);prop = new WidgetPropEntity(name: "加载sd卡图片", desc: "在pubspec.yaml文件中添加第三方库:path_provider;如果是Android，还得去Android目录下的Mainfest中声明权限；然后通过Image.file(File(path), width, height)");
    list.add(prop);prop = new WidgetPropEntity(name: "填充属性fit：", desc: null);
    list.add(prop);prop = new WidgetPropEntity(name: "fill", desc: "完全填充，宽高比可能会变");
    list.add(prop);prop = new WidgetPropEntity(name: "contain", desc: "等比拉伸，直到一边填充满");
    list.add(prop);prop = new WidgetPropEntity(name: "cover", desc: "等比拉伸，直到2边都填充满，此时一边可能超出范围");
    list.add(prop);prop = new WidgetPropEntity(name: "fitWidth", desc: "等比拉伸，宽填充满");
    list.add(prop);prop = new WidgetPropEntity(name: "fitHeight", desc: "等比拉伸，高填充满");
    list.add(prop);prop = new WidgetPropEntity(name: "none", desc: "不拉伸，超出范围截取");
    list.add(prop);prop = new WidgetPropEntity(name: "scaleDown", desc: "只缩小，等比");
    list.add(prop);

    return list;
  }

  List<WidgetPropEntity> getRowColumnPropList(){
    List<WidgetPropEntity> list = new List();
    WidgetPropEntity prop = new WidgetPropEntity(name:  "主轴对齐方式", desc: "Row控件的主轴mainAxisAlignment对齐方式默认值是MainAxisAlignment.start，即子控件从开始处排列，这个开始处不一定是屏幕的左边，是从左到右还是从右到左排列取决于文本方向textDirection属性，比如阿拉伯文本方向是从右到左的");
    list.add(prop);
    prop = new WidgetPropEntity(name:  "交叉轴对齐方式", desc: "和主轴相对应的就是交叉轴crossAxisAlignment，交叉轴对齐方式默认是居中。Row控件的高度是依赖子控件高度，因此子控件高都一样时，Row的高和子控件高相同，此时是无法体现交叉轴对齐方式，修改3个颜色块高分别为50，100，150，这样Row的高是150");
    list.add(prop);
    prop = new WidgetPropEntity(name:  "textDirection和verticalDirection", desc: "属性textDirection控制水平方向布局，值包含TextDirection.ltr(从左到右)和TextDirection.rtl(从右到左)，verticalDirection控制垂直方向布局，值包含VerticalDirection.up(从上到下)和VerticalDirection.down(从下到上)");
    list.add(prop);
    prop = new WidgetPropEntity(name:  "主轴尺寸", desc: "主轴尺寸由mainAxisSize属性控制，仅有min和max两种方式，默认是max方法。min表示尽可能小，而max表示尽可能大");
    list.add(prop);
    return list;
  }

  List<WidgetPropEntity> getContainerPropList(){
    List<WidgetPropEntity> list = new List();
    WidgetPropEntity prop = new WidgetPropEntity(name:  "无任何参数设置", desc: "Container内的子控件不会发生任何外观上的变化");
    list.add(prop);
    prop = new WidgetPropEntity(name: "设置背景颜色(color)", desc: "没有其他参数设置时，Container将会根据子控件自行调整大小");
    list.add(prop);
    prop = new WidgetPropEntity(name: "padding 和 margin", desc: "使用：EdgeInsets.all(20)，padding表示内边距，margin表示外边距");
    list.add(prop);
    prop = new WidgetPropEntity(name: "Decoration 装饰", desc: "decoration属性可以设置子控件的背景颜色、形状、圆角、边框等；相关类：BoxDecoration、Border、BorderRadius、BoxFit、BoxShape");
    list.add(prop);
    prop = new WidgetPropEntity(name: "Alignment 对齐方式", desc: "设置对齐方式后，Container将会充满其父控件，相当于Android中match_parent,不在是根据子控件调整大小,如果需要固定宽高，需要设置width、height(或constraints)属性约束");
    list.add(prop);
    prop = new WidgetPropEntity(name: "transform 变换", desc: "通过transform可以旋转、平移、缩放Container");
    list.add(prop);

    return list;
  }

  List<WidgetPropEntity> getIconPropList() {
    List<WidgetPropEntity> list = new List();
    WidgetPropEntity prop = WidgetPropEntity(name: "使用之前", desc: "在pubspec.yaml文件中声明：flutter:uses-material-design:true;该功能默认开启");
    list.add(prop);prop = WidgetPropEntity(name: "使用方式", desc: "如：Icon(Icon.add，size:20, color:Color.red)");
    list.add(prop);prop = WidgetPropEntity(name: "AssetImage", desc: "AssetImage控件是根据图片绘制图标，就是图片上的透明通道不绘制，而不透明的地方使用设置的颜色绘制，");
    list.add(prop);prop = WidgetPropEntity(name: "AssetImage使用：", desc: "ImageIcon(AssetImage('images/name1.png'),size: 100, color: Colors.blue,)");
    list.add(prop);
    return list;
  }
}