import 'package:flutter/material.dart';
class RadioList extends StatefulWidget {
  var options=[];

  var selected;

  var isRow;

  var onChange;

  RadioList({this.options,this.selected,this.isRow:false,this.onChange});
  @override
  _RadioListState createState() => _RadioListState();

}

class _RadioListState extends State<RadioList> {

  List getRadioList() {
    var list = [];

    for (var i=0;i<widget.options.length;i++){
      list.add(
        Container(
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
                Text(widget.options[i])
              ],
            ),
          ),
        ),
      );
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return widget.isRow?Row(
      children: <Widget>[...getRadioList()],
    ):Column(
      children: <Widget>[...getRadioList()],
    );
  }
}
