
import 'package:vote_app/models/vote.dart';
import 'package:uuid/uuid.dart';

List<Vote> getVoteList(){
  //Mock Data
  List <Vote> voteList = List<Vote>();

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best web Frontend Frameworks?',
      options: [
        {'React': 80},
        {'Svelte': 40},
        {'Vue': 20},      
      ],
    )
  );

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best Backend Frameworks?',
      options: [
        {'Django': 70},
        {'Php': 60},
        {'Laravel': 40},      
      ],
    )
  );

  voteList.add(
    Vote(
      voteId: Uuid().v4(),
      voteTitle: 'Best Mobile Frameworks?',
      options: [
        {'Flutter': 70},
        {'React Native': 10},
        {'Xamarin': 1},      
      ],
    )
  );
  
  return voteList;
} 