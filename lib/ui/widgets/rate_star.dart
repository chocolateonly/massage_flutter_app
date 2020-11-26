import 'package:flutter/material.dart';

import 'package:massageflutterapp/utils/size_fit.dart';
class RateStar extends StatefulWidget {
  var currentVal;
  var callback;
  RateStar({this.currentVal:0,this.callback});
  @override
  _RateStarState createState() => _RateStarState();
}

class _RateStarState extends State<RateStar> {
  var current;
  @override
  void initState() {
    current=widget.currentVal;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Row(
      children: <Widget>[
        ...List.generate(5, (index){
          return getStart(context,index);
        })
      ],
    );
  }

  Widget getStart(BuildContext context,index) {
    return   Container(
      padding: EdgeInsets.symmetric(horizontal: 10.rpx),
      child: InkWell(
        onTap: (){
            setState(() {
              current=index;
            });
          widget.callback(current);
        },
        child: index<=current?Icon(Icons.star, color: Theme.of(context).accentColor, size:24,):
        Icon(Icons.star_border, color:  Color(0xff999999), size:24,),
      ),
    );
  }
}

