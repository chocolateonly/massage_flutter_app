import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';

class UploadPictureWidget extends StatefulWidget {
  var list; //图片数组
  var callback; //删除  添加  返回事件
  UploadPictureWidget({this.list, callback: null});

  @override
  _UploadPictureWidgetState createState() => _UploadPictureWidgetState();
}

class _UploadPictureWidgetState extends State<UploadPictureWidget> {
  var new_list;

  @override
  void initState() {
    // TODO: implement initState
    new_list = widget.list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.rpx),
      height: (new_list.length / 3).ceil() * (194 + 40).rpx,
      child: GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10.rpx,
              mainAxisSpacing: 10.rpx,
              childAspectRatio: 1),
          itemCount: new_list.length+1,
          itemBuilder: (context, index) {
            if (index == new_list.length && index != 8) {
              return InkWell(
                onTap: () async {
                  var images = await uploadImages(context, 9);
                  widget.callback();
                },
                child: Container(
                  width: 194.rpx,
                  height: 194.rpx,
                  child: Image.asset(
                    ImageHelper.wrapAssets('icon_picture_add.png'),
                    width: 194.rpx,
                    height: 194.rpx,
                  ),
                ),
              );
            }

            return Image.network(
              new_list[index],
              width: 194.rpx,
              height: 194.rpx,
            );
          }),
    );
  }
}
