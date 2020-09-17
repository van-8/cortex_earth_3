import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FlockMembersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildSearch(),
          _buildMembers(),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildMembers() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      child: Column(
        children: [
          Text('Invite members'),
          Text('List of members'),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            height: 40,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://picsum.photos/200')),
                CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://picsum.photos/200')),
                CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://picsum.photos/200')),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      child: Column(
        children: [
          Text('Searchbar'),
        ],
      ),
    );
  }
}
