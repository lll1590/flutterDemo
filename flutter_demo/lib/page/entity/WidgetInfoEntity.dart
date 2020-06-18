import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/page/enum/WidgetEnum.dart';

class WidgetInfoEntity{
  WidgetEnum index;
  String title;
  String desc;
  List<WidgetPropEntity> propList;

  WidgetInfoEntity({@required this.index, @required this.title, @required this.desc, @required this.propList});
}

class WidgetPropEntity{
  String name;
  String desc;

  WidgetPropEntity({@required this.name, @required this.desc});
}