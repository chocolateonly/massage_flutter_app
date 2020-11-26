import 'package:flutter/material.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class MassagistDetailPage extends StatefulWidget {
  var id;
  MassagistDetailPage(id);
  @override
  _MassagistDetailPageState createState() => _MassagistDetailPageState();
}

class _MassagistDetailPageState extends State<MassagistDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text( S.of(context).detail),
        centerTitle: true,
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          FocusScope.of(context).requestFocus(new FocusNode());
          return true;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 888.rpx,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 200.rpx,
                      decoration:BoxDecoration(
                          color:Theme.of(context).accentColor //背景颜色 Theme.of(context).accentColor
                      ),
                    ),
                    Positioned(
                      top:0.rpx,
                      left:20.rpx,
                      right:20.rpx,
                      child: Card(
                        shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Image.network(ImageHelper.img,height: 776.rpx,),
                              Container(
                                padding:EdgeInsets.all(20.rpx),
                                decoration: BoxDecoration(
                                  border: Border(top: BorderSide(color: Color(0xffeeeeee))),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex:1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('姓名',style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx ),overflow: TextOverflow.ellipsis,),
                                          SizedBox(width:10.rpx),
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical:6.rpx,horizontal: 10.rpx),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.rpx),
                                                border: Border.all(color: Theme.of(context).accentColor)
                                            ),
                                            child: Row(
                                              children: <Widget>[
                                                Image.asset(ImageHelper.wrapAssets('massagist_level1.png'),width: 24.rpx,height: 19.rpx,),
                                                SizedBox(width:10.rpx),
                                                Text('${S.of(context).levelAbb} 1',style:TextStyle(color:Theme.of(context).accentColor,fontSize: 24.rpx ),overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: (){
                                        //todo
                                        Navigator.of(context).pushNamed(RouteName.myServiceProve);
                                      },
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Image.asset(ImageHelper.wrapAssets('m_d_service_icon.png'),width: 36.rpx,height:36.rpx,),
                                          SizedBox(width:10.rpx),
                                          Text(S.of(context).serviceAbility,style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx ),overflow: TextOverflow.ellipsis,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.rpx),
                child: Card(
                  shape:  RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.rpx)),
                  child:Container(
                    padding:EdgeInsets.all(20.rpx),
                    decoration: BoxDecoration(
                      border: Border(top: BorderSide(color: Color(0xffeeeeee))),
                    ),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex:1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  //todo
                                  Navigator.of(context).pushNamed(RouteName.healthyInfo,arguments: ['show']);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Image.asset(ImageHelper.wrapAssets('m_d_profile_icon.png'),width: 36.rpx,height:36.rpx,),
                                    SizedBox(width:10.rpx),
                                    Text(S.of(context).healthyInfo,style:TextStyle(color: Color(0xff333333),fontSize: 30.rpx ),overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            //todo
                            Navigator.of(context).pushNamed(RouteName.myServiceProve);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('11月11日',style:TextStyle(color: Color(0xff666666),fontSize: 34.rpx ),overflow: TextOverflow.ellipsis,),
                              SizedBox(width:10.rpx),
                              Text('36.7℃',style:TextStyle(color: Color(0xff333333),fontSize: 34.rpx ),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) ,
                ),
              ),
              //评价
              Container(
                padding: EdgeInsets.all(20.rpx),
                margin: EdgeInsets.only(bottom: 20.rpx,left: 20.rpx,right: 20.rpx),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 6.rpx,
                                height: 30.rpx,
                                color: Theme.of(context)
                                    .accentColor,
                              ),
                              SizedBox(
                                width: 10.rpx,
                              ),
                              Expanded(
                                child: Text(
                                  '${S.of(context).comment}(0)',
                                  style: TextStyle(
                                      color: Color(0xff000000),
                                      fontSize: 30.rpx),
                                  overflow:
                                  TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff999999),
                              size: 16,
                            )),
                      ],
                    ),
                    //评价项
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.rpx),
                      child: Column(
                        children: <Widget>[
                          //信息
                          Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(55.rpx),
                                child: Image.network(ImageHelper.img, width: 80.rpx, height: 80.rpx),
                              ),
                              SizedBox(width: 10.rpx,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text('3453453', style: TextStyle(color: Color(0xff999999), fontSize: 30.rpx,), overflow: TextOverflow.ellipsis,),
                                        ),
                                        Text('2020-10-10', style: TextStyle(color: Color(0xff999999), fontSize: 30.rpx,),overflow: TextOverflow.ellipsis,),
                                      ],
                                    ),
                                    SizedBox(height: 10.rpx,),
                                    Row(
                                      children: <Widget>[
                                        ...List.generate(5, (index){
                                          return index<=3? Icon(Icons.star, color: Theme.of(context).accentColor, size: 20,):
                                          Icon(Icons.star_border, color: Color(0xff999999), size: 20,);
                                        }),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
//                          //图片
                          Container(
                            margin: EdgeInsets.only(top: 20.rpx), 
                            height: (7 / 3).ceil() * (194 + 40).rpx,
                            child: GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 10.rpx,
                                    mainAxisSpacing: 10.rpx,
                                    childAspectRatio: 1
                                ),
                                itemCount: 7,
                                itemBuilder: (context, index) {
                                  return Image.network(
                                    ImageHelper.img,
                                    width: 194.rpx,
                                    height: 194.rpx,
                                  );
                                }),
                          ),
                          //项目
                          Container(
                            width: double.maxFinite,
                            padding:EdgeInsets.all(20.rpx),
                            color: Color(0xffeeeeee),
                            child: Text('服务项目：妈咪产前护理配套',style:TextStyle(color: Color(0xff999999),fontSize: 26.rpx ),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
