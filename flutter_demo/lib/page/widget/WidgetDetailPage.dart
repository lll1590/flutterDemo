import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterdemo/page/base/BaseWidget.dart';
import 'package:flutterdemo/page/entity/WidgetInfoEntity.dart';

class WidgetDetailPage extends BaseWidget{

  WidgetInfoEntity widgetInfo;
  WidgetDetailPage({Key key, this.widgetInfo});

  @override
  _WidgetDetailPageState getState() => _WidgetDetailPageState(widgetInfo);
  
}

class _WidgetDetailPageState extends BaseWidgetState{

  WidgetInfoEntity widgetInfo;
  List<WidgetPropEntity> propList = new List();

  _WidgetDetailPageState(WidgetInfoEntity widgetInfo){
   this.widgetInfo = widgetInfo;

   propList.add(new WidgetPropEntity(name: widgetInfo.desc, desc: null));
   propList.addAll(widgetInfo.propList);
  }

  @override
  Widget buildWidget(BuildContext context) {
//    widgetInfo.propList.insert(0, new WidgetPropEntity(name: widgetInfo.desc, desc: null));
    return Scaffold(
      body: ListView.builder(
        itemCount: widgetInfo.propList.length,
          itemBuilder: (BuildContext context, int index, ){
            return getItems(index);
          }
      )
    );
  }

  @override
  void onCreate() {
    setAppBarTitle(widgetInfo.title);
  }

  @override
  void onPause() {
  }

  @override
  void onResume() {
  }

  @override
  void dispose(){
  }

  Widget getItems(int index){
    int xuhao = index + 1;
    WidgetPropEntity prop = propList.elementAt(index);
    String name = prop.name;
    String desc = prop.desc;
    if(xuhao == 1){
      return Padding(
        padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
        child: Text(
          "$xuhao.$name",
          style: TextStyle(
            color: Color(0xff000000),
            fontSize: ScreenUtil().setSp(32),
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
      );
    }else {
      return Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(24)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "$xuhao.$name",
                style: TextStyle(
                  color: Color(0xff000000),
                  fontSize: ScreenUtil().setSp(32),
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(24), ScreenUtil().setWidth(18), ScreenUtil().setWidth(24), 0),
                child: Text(
                  desc==null ? "" : desc,
                  style: TextStyle(
                    color: Color(0xff000000),
                    fontSize: ScreenUtil().setSp(24),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
      );
    }
  }
}