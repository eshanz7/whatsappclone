import 'package:flutter/material.dart';
import 'package:whatsappclone/chat_screen.dart';
import 'package:whatsappclone/constants.dart';
import 'package:whatsappclone/status_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  int currentIndex = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =
        TabController(length: 4, vsync: this, initialIndex: currentIndex);

    tabController.addListener(() {
      currentIndex = tabController.index;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: appBarColor,
              floating: true,
              pinned: true,
              leadingWidth: 150,
              leading: Padding(
                padding: EdgeInsets.only(left: 12, top: 15),
                child: Text(
                  "WhatsApp",
                  style: TextStyle(
                      color: textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              bottom: TabBar(
                labelColor: selectedColor,
                unselectedLabelColor: textColor,
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                indicatorWeight: 2.5,
                dividerColor: appBarColor,
                isScrollable: true,
                labelPadding: EdgeInsets.zero,
                indicatorColor: selectedColor,
                indicatorSize: TabBarIndicatorSize.tab,
                controller: tabController,
                tabs: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                    child: Tab(
                      icon: Image.asset(
                        'assets/multiple-users-silhouette.png',
                        height: 20,
                        width: 20,
                        color: currentIndex == 0 ? selectedColor : textColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Tab(
                      text: 'Chats',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Tab(
                      text: 'Status',
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Tab(
                      text: 'Calls',
                    ),
                  ),
                ],
              ),
              actions: [
                Image.asset(
                  'assets/camera.png',
                  height: 22,
                  width: 22,
                  color: textColor,
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.search,
                  color: textColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Icon(
                  Icons.more_vert,
                  color: textColor,
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            )
          ];
        },
        body: TabBarView(
          controller: tabController,
          children: [
            Container(),
            ChatScreen(),
            StatusScreen(),
            Container()
          ],
        )
      ),
      backgroundColor: secColor,
    );
  }
}
