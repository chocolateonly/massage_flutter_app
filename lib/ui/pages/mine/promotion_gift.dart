import 'package:flutter/material.dart';
import 'package:massageflutterapp/generated/l10n.dart';
class PromotionGiftPage extends StatefulWidget {

  @override
  _PromotionGiftPageState createState() => _PromotionGiftPageState();
}

class _PromotionGiftPageState extends State<PromotionGiftPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).promotionGift),
      ),
      body: Container(

      ),
    );
  }
}
