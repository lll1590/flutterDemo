import 'package:flutter/material.dart';
import 'package:flutterdemo/page/base/BaseFunction.dart';
import 'package:flutterdemo/page/base/BuildConfig.dart';

import 'NavigatorManager.dart';

abstract class BaseWidget extends StatefulWidget{
  BaseWidgetState baseWidgetState;
  @override
  BaseWidgetState createState() {
    baseWidgetState = getState();
    return baseWidgetState;
  }

  BaseWidgetState getState();
  String getStateName() {
    return baseWidgetState.getWidgetName();
  }
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> with BaseFuntion, WidgetsBindingObserver{

  //平台信息
  bool isAndroid = BuildConfig.isAndroid;
  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记

  @override
  void initState() {
    super.initState();
    print("创建之初调用一次 类似于onCreate");
    initBaseCommon(this);
    NavigatorManger().addWidget(this);
    WidgetsBinding.instance.addObserver(this);
    onCreate();
    if(mounted){}
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("在initState之后调用，可以在这个方法中跨组件拿到数据");
  }

  @override
  void didUpdateWidget(T oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("当组件的状态改变的时候就会调用,比如调用了setState");
  }

  @override
  void deactivate() {
    //说明是被覆盖了
    if (NavigatorManger().isSecondTop(this)) {
      if (!_onPause) {
        onPause();
        _onPause = true;
      } else {
        onResume();
        _onPause = false;
      }
    } else if (NavigatorManger().isTopPage(this)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
    print("在离开和回到页面的时候都会调用");
  }

  @override
  void dispose() {
    super.dispose();
    print("销毁的时候调用");
    WidgetsBinding.instance.removeObserver(this);
    _onResumed = false;
    _onPause = false;

    //把改页面 从 页面列表中 去除
    NavigatorManger().removeWidget(this);
    //取消网络请求
//    HttpManager.cancelHttp(getWidgetName());
  }

  @override
  Widget build(BuildContext context) {
    print("创建Widget的地方，在离开和回到页面的时候都会调用");
    if (!_onResumed) {
      //说明是 初次加载
      if (NavigatorManger().isTopPage(this)) {
        _onResumed = true;
        onResume();
      }
    }
    return Scaffold(
      body: getBaseView(context),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    //此处可以拓展 是不是从前台回到后台
    if (state == AppLifecycleState.resumed) {
      //on resume
      if (NavigatorManger().isTopPage(this)) {
        onForeground();
        onResume();
      }
    } else if (state == AppLifecycleState.paused) {
      //onpause
      if (NavigatorManger().isTopPage(this)) {
        onBackground();
        onPause();
      }
    }
    super.didChangeAppLifecycleState(state);
  }
}

