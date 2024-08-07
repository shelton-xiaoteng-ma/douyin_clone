import 'package:douyin_clone/constants.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.all(2),
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color(kBackgroundColor),
      body: Stack(
        children: [
          Center(
            child: buildFirstScreen(topScrollMenu[_selectedIndex]),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: InkWell(
              onTap: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              child: Icon(
                Icons.dehaze,
                color: Color(kActiveColor),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 60,
            height: 50,
            width: 300,
            child: ListView.builder(
              reverse: true,
              // controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: topScrollMenu.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${topScrollMenu[index]}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: _selectedIndex == index
                                ? Color(kActiveColor)
                                : Color(kInActiveColor),
                          ),
                        ),
                        _selectedIndex == index
                            ? Icon(
                                Icons.compare_arrows_sharp,
                                color: Color(kInActiveColor),
                                size: 20,
                              )
                            : SizedBox(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 80,
            right: 20,
            child: Icon(
              Icons.search,
              color: Color(kActiveColor),
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  Text buildFirstScreen(String menu) {
    return Text(
      'Video Screen For $menu',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    );
  }
}

const topScrollMenu = ['推荐', '本地', '商城', '关注', '团购', '精选', '直播'];
