import 'package:flutter/material.dart';

import '../config/palette.dart';
import '../data.dart';

class UpcomingRoomsList extends StatelessWidget {
  final List<Room> upcomingRoomsList;

  const UpcomingRoomsList({
    required this.upcomingRoomsList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.secondaryBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: upcomingRoomsList.map((e) {
          return Padding(
            padding: const EdgeInsets.only(left: 30, top: 8, bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(e.time),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (e.club.isNotEmpty)
                          Flexible(
                            child: Text(
                              e.club,
                              style: Palette.titleStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        Flexible(
                          child: Text(
                            e.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
