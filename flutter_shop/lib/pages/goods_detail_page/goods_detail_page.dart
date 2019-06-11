import 'package:flutter/material.dart';

class GoodsDetailPage extends StatefulWidget {
  @override
  _GoodsDetailPageState createState() => _GoodsDetailPageState();
}

class _GoodsDetailPageState extends State<GoodsDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
//      onWillPop: () {
//        print('onWillPop');
//        Navigator.of(context).pop('哈哈哈哈');
//
//        return Future.value(false);
//      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('商品详情页'),
          leading: IconButton(
            icon:  BackButtonIcon(),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: () {
              Navigator.pop(context,{'name' : 'cff'});
            },
          ),
        ),
        body: Container(
          color: Colors.orange,
        ),
      ),
    );
  }
}
