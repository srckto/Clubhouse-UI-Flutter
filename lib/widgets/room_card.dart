import 'package:clubhouse/config.dart/palette.dart';
import 'package:clubhouse/screens/room_screen.dart';
import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class RoomCard extends StatelessWidget {
  final Room room;
  const RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RoomScreen(room: room))),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(room.club),
                const SizedBox(height: 3),
                Text(room.name, style: Palette.titleStyle),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 28,
                              top: 20,
                              child: UserProfileImage(imageURL: room.speakers[1].imageUrl, imageSize: 48),
                            ),
                            UserProfileImage(imageURL: room.speakers[0].imageUrl, imageSize: 48),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers.map((e) {
                              return Text(
                                "${e.givenName} ${e.familyName}",
                                style: Palette.nameSpeakerRoomStyle,
                              );
                            }),
                            SizedBox(height: 5),
                            Text.rich(
                              TextSpan(children: [
                                TextSpan(
                                  text: "${room.speakers.length + room.followedBySpeakers.length + room.others.length} ",
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.person,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: "  ${room.speakers.length} ",
                                ),
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.chat_bubble,
                                    size: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ], style: TextStyle(color: Colors.grey[600])),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
