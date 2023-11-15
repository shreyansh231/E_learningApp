import 'package:dashboard/gpt/screens/chat_screen.dart';
import 'package:dashboard/gpt/shrey.dart';
import 'package:dashboard/widgets/screens/category_screens.dart';
import 'package:flutter/cupertino.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Widget> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      CategoryScreen(),
      Shrey(),
    ];
    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.systemGrey6,
        activeColor: CupertinoColors.activeBlue,
        currentIndex: _selectedIndex,
        onTap: _selectedPage,
        items:const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'DashBoard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble),
            label: 'Chat Support',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (BuildContext context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle:
                    Text(_selectedIndex == 0 ? 'DashBoard' : 'Chat Support'),
                    leading: CupertinoButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(CupertinoIcons.back),
                ),
              ),
              // drawer: MainDrawer(),
              child: _pages[_selectedIndex],
            );
          },
        );
      },
    );
  }
}

