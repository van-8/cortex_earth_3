import 'package:flutter/material.dart';
import 'package:polls/polls.dart';

class FlockInfoScreen extends StatefulWidget {
  @override
  _FlockInfoScreenState createState() => _FlockInfoScreenState();
}

class _FlockInfoScreenState extends State<FlockInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildPurpose(),
          _buildNextMeeting(),
          _buildCurrentlyReading(),
          _buildPoll(),
        ],
      ),
    );
  }

  Widget _buildPurpose() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
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

  Widget _buildPoll() {
    double option1 = 2.0;
    double option2 = 0.0;
    double option3 = 2.0;
    double option4 = 3.0;

    String user = "king@mail.com";
    Map usersWhoVoted = {
      'sam@mail.com': 3,
      'mike@mail.com': 4,
      'john@mail.com': 1,
      'kenny@mail.com': 1
    };
    String creator = "eddy@mail.com";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Polls(
        children: [
          // This cannot be less than 2, else will throw an exception
          Polls.options(title: '7.5 Lessons about the Brain', value: option1),
          Polls.options(title: 'On Intelligence', value: option2),
          Polls.options(title: 'Why Trust Science', value: option3),
          Polls.options(title: 'Principles of Neural Design', value: option4),
        ],
        question: Text(
          'What book should we review next?',
          textAlign: TextAlign.center,
        ),
        currentUser: user,
        creatorID: creator,
        voteData: usersWhoVoted,
        userChoice: usersWhoVoted[user],
        onVoteBackgroundColor: Colors.blue,
        leadingBackgroundColor: Colors.blue,
        backgroundColor: Colors.white,
        onVote: (choice) {
          setState(() {
            usersWhoVoted[user] = choice;
          });
          if (choice == 1) {
            setState(() {
              option1 += 1.0;
            });
          }
          if (choice == 2) {
            setState(() {
              option2 += 1.0;
            });
          }
          if (choice == 3) {
            setState(() {
              option3 += 1.0;
            });
          }
          if (choice == 4) {
            setState(() {
              option4 += 1.0;
            });
          }
        },
      ),
    );
  }
}
