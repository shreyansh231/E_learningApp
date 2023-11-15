import 'package:dashboard/ui/widgets/overlay.dart';
import 'package:dashboard/theme/box_icons_icons.dart';
import 'package:dashboard/theme/config.dart';
import 'package:dashboard/ui/pages/leaderboard.dart';
import 'package:dashboard/ui/pages/planner.dart';
import 'package:dashboard/ui/pages/videos.dart';
import 'package:dashboard/ui/widgets/sectionHeader.dart';
import 'package:dashboard/ui/widgets/topBar.dart';
import 'package:dashboard/ui/widgets/videoCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;

class Home extends StatefulWidget {
  final onMenuTap;
  const Home({super.key, this.onMenuTap});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tabNo = 0;
  late bool overlayVisible;
  CupertinoTabController? controller;
  @override
  void initState() {
    overlayVisible = false;
    controller = CupertinoTabController(initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        CupertinoTabScaffold(
          backgroundColor: Colors().secondColor(1),
          controller: controller,
          tabBar: CupertinoTabBar(
            onTap: (value) {
              setState(() {
                tabNo = value;
              });
            },
            activeColor: material.Colors.lightBlue,
            inactiveColor: Color(0xFFADADAD),
            items: [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: tabNo == 0 ? "Home" : '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.calendar),
                label: tabNo == 1 ? "Planner" : '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.pen),
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.video_camera_solid),
                label: tabNo == 3 ? "Videos" : '',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.list_dash),
                label: tabNo == 4 ? "Leaderboard" : '',
              ),
            ],
          ),
          tabBuilder: (context, index) => (index == 0)
              ? HomePage(
                  onMenuTap: widget.onMenuTap,
                )
              : (index == 1)
                  ? PlannerPage(
                      onMenuTap: widget.onMenuTap,
                    )
                  : (index == 2)
                      ? Container(
                          color: CupertinoColors.activeOrange,
                        )
                      : (index == 3)
                          ? VideosPage(
                              onMenuTap: widget.onMenuTap,
                            )
                          : LeaderboardPage(
                              onMenuTap: widget.onMenuTap,
                            ),
        ),
        Positioned(
            bottom: 0,
            child: GestureDetector(
              child: const SizedBox(
                height: 60,
                width: 80,
                child: Text(""),
              ),
              onTap: () {},
            )),
        overlayVisible ? OverlayWidget() : Container(),
        Positioned(
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFABDCFF),
                      Color(0xFF0396FF),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 25,
                        color: Color(0xFF03A9F4).withOpacity(0.4),
                        offset: Offset(0, 4))
                  ],
                  borderRadius: BorderRadius.circular(500)),
              child: material.FloatingActionButton(
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: material.Colors.transparent,
                  child: overlayVisible
                      ? Icon(material.Icons.close)
                      : Icon(CupertinoIcons.pencil),
                  onPressed: () {
                    setState(() {
                      overlayVisible = !overlayVisible;
                    });
                  }),
            )),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  final onMenuTap;
  HomePage({
    Key? key,
    required this.onMenuTap,
  }) : super(key: key);

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Scheduled Classes'),
        leading: CupertinoButton(
          // padding: EdgeInsets.all(10),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      backgroundColor: Colors().secondColor(1),
      child: Padding(
        padding: EdgeInsets.only(top:30),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverFixedExtentList(
                      delegate: SliverChildListDelegate.fixed([Container()]),
                      itemExtent: MediaQuery.of(context).size.height * 0.25),
                  SliverToBoxAdapter(
                    child: SectionHeader(
                      text: 'Recommended Lectures',
                      onPressed: () {},
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 245,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return VideoCard(long: false);
                        },
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SectionHeader(
                      text: 'Revision Lectures',
                      onPressed: () {},
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 245,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return VideoCard(long: false);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: TopBar(
                controller: controller,
                expanded: true,
                onMenuTap: onMenuTap,
              ),
            )
          ],
        ),
      ),
    );
  }
}
