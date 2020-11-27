import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/global_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
class UploadPictureWidget extends StatefulWidget {
  var list; //图片数组
  var callback; //删除  添加  返回事件
  var max;

  UploadPictureWidget({this.list, this.max: 9, this.callback: null});

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
    var itemCount =
        new_list.length == widget.max ? new_list.length : new_list.length + 1;
    var isSub=false;
    return ProviderWidget<GlobalModel>(
      builder: (context,model,child){
       return Container(
          margin: EdgeInsets.only(top: 20.rpx),
          height: (itemCount / 3).ceil() * (194 + 40).rpx,
          child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.rpx,
                  mainAxisSpacing: 10.rpx,
                  childAspectRatio: 1),
              //达到最大数  显示所有图片
              //不足最大数  补一张加号图
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (index == new_list.length) {
                  //index 为最后一张  补一张加号图
                  return Container(
                      width: double.maxFinite,
                    child: InkWell(
                      onTap: () async {
                        if(isSub) return;
                         isSub=true;
                        var images = await uploadImages(context, widget.max - new_list.length);
                        isSub=false;
                        setState(() {
                          new_list.addAll(images);
                          widget.callback(new_list);
                        });
                      },
                      child: Container(
                        child: Image.asset(
                          ImageHelper.wrapAssets('icon_picture_add.png'),
                          width: 194.rpx,
                          height: 194.rpx,
                        ),
                      ),
                    )
                  );
                }

                return Stack(
                  fit:StackFit.expand,//占全
                  children: <Widget>[
                    Container(
                      child:CachedNetworkImage(
                          height: 194.rpx,
                          width: 194.rpx,
                          imageUrl: ImageHelper.wrapUrl(new_list[index]),
                          placeholder: (context, url) => Center(child: CupertinoActivityIndicator()),
                          errorWidget: (context, url, error) => Icon(Icons.error))

                    ),
                    Positioned(
                        child: InkWell(
                            onTap: (){
                              setState(() {
                                new_list.removeAt(index);
                                widget.callback(new_list);
                              });

                            },
                            child: Icon(Icons.cancel,color: Colors.grey,)
                        ),
                        top: 0,
                        right:0,

                    ),
                  ],
                );
              }),
        );
      },
      model: GlobalModel(),
    );
  }
}
