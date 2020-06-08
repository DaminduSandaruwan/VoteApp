import 'package:flutter/material.dart';
import 'package:vote_app/constant.dart';
import 'package:vote_app/widgets/shared_widget.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:100),
            child: Text(
              kAppName,
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ),
          SizedBox(height: 200,),
          LoginButton(
            label: 'Google Sign In',
            onPressed: (){},
          ),
          SizedBox(height: 10,),
          LoginButton(
            label: 'Anonymous Sign In',
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}