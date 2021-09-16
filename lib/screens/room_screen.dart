import 'dart:math';

import 'package:clubhouse/widgets/room_user_profile.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clubhouse/data.dart';

class RoomScreen extends StatelessWidget {
  final Room room;

  const RoomScreen({required this.room});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 120,
        leading: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.black,
          ),
          icon: Icon(CupertinoIcons.chevron_down),
          label: Text("All Rooms"),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.doc, size: 29),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {},
            child: UserProfileImage(imageURL: currentUser.imageUrl, imageSize: 33),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(room.club.toUpperCase(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      )),
                  IconButton(
                    icon: Icon(CupertinoIcons.ellipsis),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
                child: Text(
              room.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            )),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 3,
                children: room.speakers.map((user) {
                  return RoomUserProfile(
                    userSelect: user,
                    size: 66,
                    isSpeaker: true,
                    isMute: Random().nextBool(),
                    isNew: Random().nextBool(),
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Followed By Speakers",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                childAspectRatio: 0.9,
                children: room.followedBySpeakers.map((user) {
                  return RoomUserProfile(
                    userSelect: user,
                    size: 66,
                    isNew: Random().nextBool(),
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Others in this room",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20),
              sliver: SliverGrid.count(
                mainAxisSpacing: 20,
                crossAxisCount: 4,
                childAspectRatio: 0.9,
                children: room.others.map((user) {
                  return RoomUserProfile(
                    userSelect: user,
                    size: 66,
                    isNew: Random().nextBool(),
                  );
                }).toList(),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        height: 65,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(text: "👋 Leave quietly", style: TextStyle(color: Colors.red[500], fontSize: 17)),
                  ]),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.add),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.hand_raised),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
