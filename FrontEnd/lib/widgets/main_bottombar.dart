import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:twitterclone/features/main_page/bloc/main_bloc.dart';

class MainBottomNavBar extends StatelessWidget {
  const MainBottomNavBar(
      {super.key, required this.mainBloc, required this.pageController});
  final MainBloc mainBloc;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      onTap: (value) {
        switch (value) {
          case 0:
            mainBloc.add(HomeClickedEvent());
            break;
          case 1:
            mainBloc.add(SearchClickedEvent());
            break;
          case 2:
            mainBloc.add(CommunitiesClickedEvent());
            break;
          case 3:
            mainBloc.add(NotificationClickedEvent());
            break;
          case 4:
            mainBloc.add(MessagesClickedEvent());
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.transparent,
          icon: Icon(
            Icons.home_filled,
            color: Colors.grey[400],
            size: 30,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.search,
            color: Colors.grey[400],
            size: 30,
          ),
          label: "Search",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.person_2,
            color: Colors.grey[400],
            size: 30,
          ),
          label: "Communities",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.bell,
            color: Colors.grey[400],
            size: 30,
          ),
          label: "Notification",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.email_outlined,
            color: Colors.grey[400],
            size: 30,
          ),
          label: "Messages",
        ),
      ],
    );
  }
}
