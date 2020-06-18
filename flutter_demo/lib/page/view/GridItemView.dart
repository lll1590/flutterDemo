import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:flutterdemo/page/entity/WidgetInfoEntity.dart';
import 'package:flutterdemo/page/widget/WidgetDetailPage.dart';

class GridItemView extends StatelessWidget{

  String path, title, desc;
  WidgetInfoEntity widgetInfo;

  GridItemView({Key key, @required this.path, @required this.title, @required this.desc}):super(key:key);

  GridItemView.withParams({Key key, @required this.widgetInfo, @required this.title, @required this.desc}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shadowColor: Colors.black12,
        elevation: ScreenUtil().setWidth(1),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            side: BorderSide(
                color: Colors.black12,
                width: 1,
                style: BorderStyle.solid
            )
        ),
        child: GestureDetector(
            onTap: (){
              if(path != null) {
                Navigator.of(context).pushNamed(path);
              }else{
                Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context) => new WidgetDetailPage(widgetInfo: widgetInfo)));
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        height: ScreenUtil().setHeight(70),
                        child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left:ScreenUtil().setWidth(20), top:ScreenUtil().setWidth(2), right:ScreenUtil().setWidth(20), bottom: 0),
                              child:Text(
                                title,
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontSize: ScreenUtil().setSp(30),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                        )
                    ),
                    Container(
                        height: ScreenUtil().setHeight(70),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child:
                          Padding(
                            padding: EdgeInsets.only(left:ScreenUtil().setWidth(20), top:ScreenUtil().setWidth(12), right:ScreenUtil().setWidth(20), bottom: 0),
                            child:Text(
                              desc,
                              style: TextStyle(
                                color: Color(0xff555555),
                                fontSize: ScreenUtil().setSp(24),
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left:ScreenUtil().setWidth(20), top:ScreenUtil().setWidth(2), right:ScreenUtil().setWidth(20), bottom: ScreenUtil().setWidth(2)),
                      child:Text(
                        "查看",
                        style: TextStyle(
                          color: Color(0xff0091EA),
                          fontSize: ScreenUtil().setSp(28),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: ScreenUtil().setHeight(3),
                    color: Color(0xff0091EA),
                  ),
                )
              ],
            )
        )
    );
  }

}