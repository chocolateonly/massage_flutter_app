import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
/*
两行：
* h：180.rpx  crossAxisCount: 3, childAspectRatio: 2.1
*
* */
class RadioList extends StatefulWidget {
  var options=[];

  var selected;

  var isRow;

  var onChange;

  var childAspectRatio;

  var crossAxisCount;

  var height=180.rpx;

  RadioList({this.options,this.selected,this.isRow:false,this.onChange, this.crossAxisCount:3,this.childAspectRatio:2.1, this.height});
  @override
  _RadioListState createState() => _RadioListState();

}

class _RadioListState extends State<RadioList> {

  List getRadioList() {
    var list = [];

    for (var i=0;i<widget.options.length;i++){
      list.add(Item(i));
    }

    return list;
  }

  Widget Item(i){
    return Container(
      child: InkWell(
        onTap: (){
          widget.onChange(i);
        },
        child: Row(
          children: <Widget>[
            Radio(
              value: i,
              groupValue: widget.selected,
              onChanged: (index) {
                setState(() {
                  widget.onChange(index);
                });
              },
            ),
            Text(widget.options[i],style:TextStyle(fontSize: 26.rpx),overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRow?
        Container(
          height: widget.height,
          child: GridView.builder(
          physics: new NeverScrollableScrollPhysics(),		//禁用滑动事件
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: widget.crossAxisCount, childAspectRatio: widget.childAspectRatio),
          itemCount: widget.options.length,
          itemBuilder: (context, index) {
            return Item(index);
          }),
        )
        :Column(
      children: <Widget>[...getRadioList()],
    );
  }
}
