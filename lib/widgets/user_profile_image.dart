import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String imageURL;
  final double imageSize;

  const UserProfileImage({required this.imageURL, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 9, left: 7),
      child: Container(
        height: imageSize.toDouble(),
        width: imageSize.toDouble(),
        child: CircleAvatar(
          backgroundImage: NetworkImage(imageURL),
        ),
      ),
    );
  }
}
