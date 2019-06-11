import 'package:flutter/material.dart';

//tool
import 'package:flutter_shop/tools/all_tool.dart';

class GoodsDetailPageBottomBtnWidget extends StatelessWidget {
  final TextStyle textStyle = TextStyle(
    color: Colors.white,
    fontSize: fitFontSize(14),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            width: fitPx(70.0),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.pink,
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print('点击了加入购物车');
              },
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                child: Text(
                  '加入购物车',
                  style: textStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                print('点击了立即购买');
              },
              child: Container(
                color: Colors.red,
                alignment: Alignment.center,
                child: Text(
                  '立即购买',
                  style: textStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
