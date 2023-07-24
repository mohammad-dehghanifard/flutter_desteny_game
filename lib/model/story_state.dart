import 'choice_model.dart';

class StoryState{
  StoryState({required this.text,required this.choices});
  String text;
  List<Choice> choices;
}