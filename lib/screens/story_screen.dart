import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/choice_model.dart';
import '../model/story_model.dart';
import '../model/story_state.dart';

class StoryScreen extends StatefulWidget {
  const StoryScreen({super.key});

  @override
  State<StoryScreen> createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {

  Story story =  Story(
    states: [
      StoryState(
        text: 'این داستان شروع است...',
        lose: false,
        win: false,
        choices: [
          Choice(text: 'برو به مسیر A', nextStateIndex: 1),
          Choice(text: 'برو به مسیر B', nextStateIndex: 2),
        ],
      ),
      StoryState(
        lose: false,
        win: true,
        text: 'تبریک شما برنده شدید!',
        choices: [
          Choice(text: 'شروع مجدد', nextStateIndex: 0),
          Choice(text: 'برو به مسیر A2', nextStateIndex: 0),
        ],
      ),
      StoryState(
        lose: true,
        win: false,
        text: 'داداش.....مردی، خدا رحمتت کنه',
        choices: [
          Choice(text: 'شروع مجدد بازی', nextStateIndex: 0),
          Choice(text: 'برو به مسیر B2', nextStateIndex: 0),
        ],
      ),
      // وضعیت‌های بعدی داستان...
    ],
  );
  int currentStoryIndex = 0;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              // story poster
              SizedBox(
                  width: size.width,
                  height: size.height / 2.5,
                  child: Image.asset("assets/images/poster.jpg",fit: BoxFit.fill)),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: size.width,
                  height: size.height / 1.6,
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                    color: Colors.white
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8,16,8,8),
                    child: Column(
                      children: [
                        // story txt
                        SizedBox(
                          width: size.width,
                            height: size.height / 2.2,
                            child: Text(
                               story.states[currentStoryIndex].text,
                                style: GoogleFonts.vazirmatn(fontSize: 14),textAlign: TextAlign.center)),
                        // btns
                        if(!story.states[currentStoryIndex].win && !story.states[currentStoryIndex].lose)...[
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(Colors.lightBlue),
                                minimumSize: MaterialStatePropertyAll(Size(size.width / 1.2,40)),
                              ),
                              onPressed: () {
                                setState(() {
                                  int nextIndex = story.states[currentStoryIndex].choices.first.nextStateIndex;
                                  currentStoryIndex = nextIndex;
                                });
                              },
                              child: Text(story.states[currentStoryIndex].choices.first.text,
                                  style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold))
                          ),
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(Colors.pinkAccent),
                                minimumSize: MaterialStatePropertyAll(Size(size.width / 1.2,40)),
                              ),
                              onPressed: () {
                                int nextIndex = story.states[currentStoryIndex].choices.last.nextStateIndex;
                                setState(() {
                                  currentStoryIndex = nextIndex;
                                });
                              },
                              child: Text(story.states[currentStoryIndex].choices.last.text
                                  ,style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold))
                          )
                        ] else if(story.states[currentStoryIndex].win || story.states[currentStoryIndex].lose )...[
                          ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: const MaterialStatePropertyAll(Colors.red),
                                minimumSize: MaterialStatePropertyAll(Size(size.width / 1.2,40)),
                              ),
                              onPressed: () {
                                setState(() {
                                  currentStoryIndex = 0;
                                });
                              },
                              child: Text("شروع مجدد"
                                  ,style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold))
                          )
                        ]
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
