import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vote_app/models/vote.dart';
import 'package:vote_app/state/vote.dart';
import 'package:vote_app/widgets/vote.dart';
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
                  child: VoteWidget(),
                  isActive: _currentStep >= 1 ? true : false,
                ),
              ],
              onStepContinue: (){
                if(_currentStep==0){
                  if(step2Required()){
                    setState(() {
                      _currentStep = (_currentStep+1)>1 ? 1 : _currentStep + 1;
                    });
                  } else{
                    showSnackBar(context, 'Please a Select Vote First!');
                  }
                } 
                else if(_currentStep==1){
                   if(step3Required()){
                     Navigator.pushReplacementNamed(context, '/result');
                   }else{
                     showSnackBar(context, 'Please Mark Your Vote!');
                   }
                }                
              },
              onStepCancel: (){
                if(_currentStep <=0){
                  Provider.of<VoteState>(context).activeVote=null;
                }
                else if(_currentStep <= 1){
                  Provider.of<VoteState>(context).selectedOptionInActiveVote=null;
                }                
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

  bool step2Required(){
    if(Provider.of<VoteState>(context).activeVote==null){
      return false;
    }
    return true;
  }

  bool step3Required(){
    if(Provider.of<VoteState>(context).selectedOptionInActiveVote==null){
      return false;
    }
    return true;
  }

  void showSnackBar(BuildContext context, String msg){
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(fontSize: 15),
        ),
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