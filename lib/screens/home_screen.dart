import 'package:clubhouse/widgets/room_card.dart';
import 'package:clubhouse/widgets/upcoming_Rooms_List.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.search, size: 25),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.envelope_open, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.calendar, size: 26),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell, size: 26),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: UserProfileImage(imageURL: currentUser.imageUrl, imageSize: 33),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 25, 20, 30),
            children: [
              UpcomingRoomsList(upcomingRoomsList: upcomingRoomsList),
              const SizedBox(height: 12),
              ...roomsList.map((e) => RoomCard(room: e)).toList(),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).scaffoldBackgroundColor.withOpacity(0.1),
                ]),
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text.rich(
                TextSpan(
                  children: [
                    WidgetSpan(
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                    TextSpan(
                      text: " Start a room",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 40,
            child: Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.circle_grid_3x3_fill,
                    size: 28,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
