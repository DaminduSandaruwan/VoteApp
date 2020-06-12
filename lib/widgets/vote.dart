import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_app/models/vote.dart';
import 'package:vote_app/state/vote.dart';

class VoteWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Vote activeVote = Provider.of<VoteState>(context).activeVote;
    List<String> options = List<String>();

    for(Map<String, int> option in activeVote.options){
      option.forEach((title, value) { 
        options.add(title);
      });
    }

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Text(
              activeVote.voteTitle,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ),
        ),
        for(String option in options)
          Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 8,
                  color: Colors.green,
                ),
                Container(
                  child: Text(
                    option,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
