import 'package:flutter/material.dart';
import 'package:vote_app/service.dart';
import 'package:vote_app/models/vote.dart';


class VoteState with ChangeNotifier{
  List<Vote> _voteList = List<Vote>();
  Vote _activeVote;
  String _selectedOptionInActiveVote;

  void loadVoteList(){
    _voteList = getVoteList();
    notifyListeners();
  }

  void clearState(){
    _activeVote=null;
    _selectedOptionInActiveVote=null;
  }

  List <Vote> get voteList => _voteList;
  Vote get activeVote => _activeVote;
  String get selectedOptionInActiveVote => _selectedOptionInActiveVote;

  set activeVote(newValue){
    _activeVote = newValue;
    notifyListeners();
  }

  set selectedOptionInActiveVote(String newValue){
    _selectedOptionInActiveVote = newValue;
    notifyListeners();
  }

}