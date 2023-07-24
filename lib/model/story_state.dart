import 'choice_model.dart';

class StoryState{
  StoryState({required this.text,required this.choices,required this.win,required this.lose});
  String text;
  List<Choice> choices;
  bool win;
  bool lose;
}