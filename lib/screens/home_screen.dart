import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_app/models/vote.dart';
import 'package:vote_app/state/vote.dart';
import 'package:vote_app/widgets/vote_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentStep = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //loading Votes
    Future.microtask(() {
      Provider.of<VoteState>(context, listen: false).clearState();
      Provider.of<VoteState>(context, listen: false).loadVoteList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stepper(
              type: StepperType.horizontal,
              currentStep: _currentStep,
              steps: [
                getStep(
                  title: 'Choose',
                  child: VoteListWidget(),
                  isActive: true,
                ),
                getStep(
                  title: 'Vote',
                  child: Text('Vote Content'),
                  isActive: _currentStep >= 1 ? true : false,
                ),
              ],
              onStepContinue: (){
                setState(() {
                  _currentStep = (_currentStep+1)>1 ? 1 : _currentStep + 1;
                });
              },
              onStepCancel: (){
                setState(() {
                  _currentStep = (_currentStep-1)<0 ? 0 : _currentStep - 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
  Step getStep({String title, Widget child, bool isActive = false}){
    return Step(
      title: Text(title),
      content: child,
      isActive: isActive,
    );
  }
}