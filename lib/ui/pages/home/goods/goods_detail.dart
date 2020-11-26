import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:massageflutterapp/generated/l10n.dart';
import 'package:massageflutterapp/utils/size_fit.dart';
import 'package:massageflutterapp/ui/widgets/button/theme_button.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:massageflutterapp/config/resouce_manager.dart';
import 'package:massageflutterapp/config/router_manager.dart';
import 'package:massageflutterapp/provider/provider_widget.dart';
import 'package:massageflutterapp/view_model/home_model.dart';

import 'package:flutter_html/flutter_html.dart';

class GoodsDetailPage extends StatefulWidget {
  var id;

  GoodsDetailPage(this.id);

  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  var isFocus=false;
  @override
  Widget build(BuildContext context) {
    var title = S.of(context).detail;
    var goodsDetailTitle = S.of(context).goodsDetail;
    var submit = S.of(context).goBuy;

    openModel(){

      showModalBottomSheet(
          backgroundColor:Colors.transparent,
          context: context,
          builder: (_){
            return Container(
              decoration: BoxDecoration(
                color:Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10.rpx),topRight: Radius.circular(10.rpx))
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: SingleChildScrollView(
                      padding:EdgeInsets.all(20.rpx),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Image.network(ImageHelper.img,width:140.rpx,height: 140.rpx,),
                              SizedBox(width:10.rpx),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Expanded(
                                            child:Row(
                                              children: <Widget>[
                                                Text(S.of(context).priceUnit,style:TextStyle(color: Color(0xffEC1C24),fontSize: 26.rpx)),
                                                Text('2000.5',style:TextStyle(color: Color(0xffEC1C24),fontSize: 38.rpx ),overflow: TextOverflow.ellipsis,),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(S.of(context).stockNumUtil(12),style:TextStyle(color:   Color(0xff999999),fontSize: 24.rpx),overflow: TextOverflow.ellipsis,),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top:20.rpx),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('束缚带',style:TextStyle(color:Theme.of(context).accentColor,fontSize: 30.rpx)),
                                ChoiceItem()
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          flex:1,
                          child: Container(
                            padding: EdgeInsets.all(20.rpx),
                            child: CupertinoButton(
                                color: Color(0xff999999),
                                borderRadius:BorderRadius.circular(60.rpx),
                                child: Text(S.of(context).cancel,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                }
                            ),
                          ),
                        ),
                        Expanded(
                          flex:1,
                          child: Container(
                            padding: EdgeInsets.all(20.rpx),
                            child: CupertinoButton(
                                color: Theme.of(context).accentColor,
                                borderRadius:BorderRadius.circular(60.rpx),
                                child: Text(S.of(context).confirm,style: TextStyle(color: Colors.white,fontSize: 30.rpx),),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(RouteName.createAnOrder,arguments: ['']);
                                }
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      );
    }


    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
        ),
        body: ProviderWidget(
            builder: (context, model, child) {
              return Column(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverToBoxAdapter(
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: 542.rpx,
                                    child: Swiper(
                                      loop: true,
                                      autoplay: true,
                                      autoplayDelay: 5000,
                                      pagination: SwiperPagination(
                                        alignment: Alignment.bottomRight,
                                        builder: FractionPaginationBuilder(
                                          fontSize: 13.px,
                                          activeFontSize: 13.px,
                                          color: Colors.white,
                                          activeColor: Colors.white,
                                        ),
                                      ),
                                      itemCount: model.banners.length,
                                      itemBuilder: (ctx, index) {
                                        return InkWell(
                                            onTap: () {
                                              //Navigator.of(context).pushNamed(RouteName.shopDetail, arguments: [homeModel.banners[index].goodsId]);
                                            },
                                            child: Container(
                                              child: Image.asset(
                                                  ImageHelper.wrapAssets(
                                                      model.banners[index])),
                                            ) //fixme:BannerImage(homeModel.banners[index])
                                        );
                                      },
                                    ),
                                  ),
                                  Positioned(
                                    top:20.rpx,
                                    right:20.rpx,
                                    width:33.rpx,height: 27.rpx,
                                    child:  InkWell(
                                      onTap: (){
                                        print('sss');
                                        setState(() {
                                          isFocus=!isFocus;
                                        });
                                      },
                                      child: isFocus?Image.asset(ImageHelper.wrapAssets('icon_heart.png'),width:33.rpx,height: 27.rpx,):
                                      Image.asset(ImageHelper.wrapAssets('icon_heart_null.png'),width:33.rpx,height: 27.rpx,),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.all(20.rpx),
                                margin: EdgeInsets.only(bottom: 20.rpx),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '标题标题标题',
                                      style: TextStyle(
                                          color: Color(0xff333333),
                                          fontSize: 34.rpx),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '说明文字说明文字',
                                      style: TextStyle(
                                          color: Color(0xff999999),
                                          fontSize: 24.rpx),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 20.rpx,
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text(S.of(context).priceUnit,
                                            style: TextStyle(
                                                color: Color(0xffEC1C24),
                                                fontSize: 43.rpx)),
                                        Text(
                                          '2000.5',
                                          style: TextStyle(
                                              color: Color(0xffEC1C24),
                                              fontSize: 43.rpx),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          width: 10.rpx,
                                        ),
                                        Text(
                                          S.of(context).priceUnit,
                                          style: TextStyle(
                                            color: Color(0xff999999),
                                            fontSize: 33.rpx,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            decorationColor:
                                                const Color(0xff999999),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Text('299000.5',
                                              style: TextStyle(
                                                color: Color(0xff999999),
                                                fontSize: 33.rpx,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                decorationColor:
                                                    const Color(0xff999999),
                                              ),
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              //规格
                              Container(
                                padding: EdgeInsets.all(20.rpx),
                                margin: EdgeInsets.only(bottom: 20.rpx),
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () {
                                    openModel();
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Row(
                                          children: <Widget>[
                                            Text(
                                              S.of(context).select,
                                              style: TextStyle(
                                                  color: Color(0xff666666),
                                                  fontSize: 30.rpx),
                                              textAlign: TextAlign.left,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              width: 10.rpx,
                                            ),
                                            Expanded(
                                              child: Text(
                                               S.of(context).specs,
                                                style: TextStyle(
                                                    color: Color(0xff333333),
                                                    fontSize: 30.rpx),
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Color(0xff999999),
                                        size: 16,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              //取消
                              Container(
                                padding: EdgeInsets.all(20.rpx),
                                margin: EdgeInsets.only(bottom: 20.rpx),
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                                  S.of(context).cancelRule,
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
                                        Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.rpx,
                                                vertical: 6.rpx),
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.rpx)),
                                            child: Text(
                                              S.of(context).cancelRuleTip('10%'),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22.rpx),
                                              overflow: TextOverflow.ellipsis,
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.rpx,
                                    ),
                                    Text(
                                      '1.这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情这里是规则说明内容详情。 2.这里是规则说明内容详情这里',
                                      style: TextStyle(
                                          color: Color(0xff666666),
                                          fontSize: 24.rpx),
                                      maxLines: null,
                                    ),
                                  ],
                                ),
                              ),
                              //评价
                              Container(
                                padding: EdgeInsets.all(20.rpx),
                                margin: EdgeInsets.only(bottom: 20.rpx),
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
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        55.rpx),
                                                child: Image.network(
                                                    ImageHelper.img,
                                                    width: 80.rpx,
                                                    height: 80.rpx),
                                              ),
                                              SizedBox(
                                                width: 10.rpx,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Expanded(
                                                          child: Text(
                                                            '3453453',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xff999999),
                                                              fontSize: 30.rpx,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ),
                                                        Text(
                                                          '2020-10-10',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xff999999),
                                                            fontSize: 30.rpx,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 10.rpx,
                                                    ),
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
                                          Container(
                                            margin:
                                                EdgeInsets.only(top: 20.rpx),
                                            height:
                                                (7 / 3).ceil() * (194 + 40).rpx,
                                            child: GridView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing:
                                                            10.rpx,
                                                        mainAxisSpacing: 10.rpx,
                                                        childAspectRatio: 1),
                                                itemCount: 7,
                                                itemBuilder: (context, index) {
                                                  return Image.network(
                                                    ImageHelper.img,
                                                    width: 194.rpx,
                                                    height: 194.rpx,
                                                  );
                                                }),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(20.rpx),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      goodsDetailTitle,
                                      style: TextStyle(
                                          color: Color(0xff000000),
                                          fontSize: 30.rpx),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 20.rpx,
                                    ),
                                    Html(
                                      data: 'data',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ThemeButton(
                      title: submit,
                      onPressed: () {
                       openModel();
                      })
                ],
              );
            },
            model: HomeModel()));
  }


}

//标签式单选
class ChoiceItem extends StatefulWidget {
  @override
  _ChoiceItemState createState() => _ChoiceItemState();
}

class _ChoiceItemState extends State<ChoiceItem> {
  var _valueChoice=0;
  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 5.0, //主轴间距
        runSpacing: 8.0, //副轴间距
        children: List<Widget>.generate(5, (int index){
      return  ChoiceChip(
        label: Text("ChoiceChip $index",style: TextStyle(color:_valueChoice==index?Colors.white:Colors.black54),),
        selectedColor: Theme.of(context).accentColor, //选中的颜色
        disabledColor: Colors.orange[100], //没选中的颜色
        onSelected: (bool selected) {
          setState(() {
            _valueChoice =  index;
            print(_valueChoice);
          });
        },
        selected: _valueChoice == index,
        labelStyle: TextStyle(color: Colors.black54),
      );
    })
    );
    }
  }



