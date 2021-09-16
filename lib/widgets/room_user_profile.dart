import 'package:clubhouse/widgets/user_profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:clubhouse/data.dart';

class RoomUserProfile extends StatelessWidget {
  final User userSelect;
  final double size;
  final bool isNew;
  final bool isMute;
  final bool isSpeaker;

  const RoomUserProfile({
    required this.userSelect,
    this.size = 48,
    this.isNew = false,
    this.isMute = false,
    this.isSpeaker = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            UserProfileImage(imageURL: userSelect.imageUrl, imageSize: size),
            if (isNew)
              Positioned(
                left: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Text("🎉", style: TextStyle(fontSize: 17)),
                ),
              ),
            if (isSpeaker && isMute)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Icon(CupertinoIcons.mic, size: 19),
                ),
              ),
            if (isSpeaker && !isMute)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 6,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Icon(CupertinoIcons.mic_off, size: 19),
                ),
              ),
          ],
        ),
        SizedBox(height: 5),
        Flexible(
          child: Text(
            userSelect.givenName,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
