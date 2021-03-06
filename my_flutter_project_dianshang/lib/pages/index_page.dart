import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'member_page.dart';


class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车')
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心')
    )
  ];

  final List tabsItem = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage()
  ];

  int _currentIndex = 0;
  var _currentPage;

  @override
  void initState() { 
    _currentPage = tabsItem[_currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {   
     return Scaffold(
      backgroundColor: Color.fromRGBO(245, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _currentPage = tabsItem[_currentIndex];
          });
        },
        currentIndex: _currentIndex,
      ),
      body: _currentPage,
     );
  }
}




