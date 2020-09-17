import 'package:flutter/material.dart';

class FlockInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildPurpose(),
          _buildNextMeeting(),
          _buildCurrentlyReading(),
        ],
      ),
    );
  }

  Widget _buildPurpose() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      child: Column(
        children: [
          Text('Purpose of this flock'),
          Text('Code of Conduct'),
          Text('Announcements'),
        ],
      ),
    );
  }

  Widget _buildCurrentlyReading() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
      child: Column(
        children: [
          Text('Currently Reading'),
          Text('List of articles'),
        ],
      ),
    );
  }

  Widget _buildNextMeeting() {
    return Container(
      child: Column(
        children: [
          Text('Upcoming Meetings'),
          Text('Meeting Details'),
          Text('+ Meeting'),
        ],
      ),
    );
  }
}
