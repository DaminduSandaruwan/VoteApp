import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_app/state/vote.dart';
import 'package:vote_app/models/vote.dart';


class VoteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<VoteState>(
      builder: (context,voteState,child){
        return Column(
          children: <Widget>[
            for (Vote vote in voteState.voteList)
            Card(
              child:ListTile(
                title:Container(
                  padding:EdgeInsets.all(15.0),
                  child:Text(
                    vote.voteTitle,
                    style: TextStyle(
                      fontSize:18,
                      color:Colors.black,
                    ),
                  ),
                ),
              ), 
            )
          ],
        );
      },
    );
  }
}