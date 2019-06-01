import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'home_page/home_page.dart';
import 'member_page.dart';
import 'package:flutter_shop/tools/tool_screen.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  // tabbar选显卡列表
  final List<BottomNavigationBarItem> bottomNavBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      title: Text('会员中心'),
    )
  ];

  // tabbar选项卡列表对应的界面列表
  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  int currentPageIndex = 0;
  Widget currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage = pages[currentPageIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToolScreen.initScreen(context: context, width: 750, height: 1336);
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      bottomNavigationBar: BottomNavigationBar(

        items: bottomNavBarItems,
        currentIndex: currentPageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) {
          setState(() {
            currentPageIndex = index;
            currentPage = pages[currentPageIndex];
          });
        },
      ),

      body: currentPage,
    );
  }
}
