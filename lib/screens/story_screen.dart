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
        title: "شهر در محاصره",
        text: 'در خیمه شورای جنگ قدم میزنی که درست بیرون شهر زیبای الموت واقع شده. خرچند پدرت پادشاه،آشکارا اعلام کرده میخواهد شهر دچار دردسر نشود، اما برادران بزرگت – توس ، وارث تاج و تخت و گرسیو فرمانده سپاه امپراتوری – همراه عمویت نظام تصمیم به حمله گرفته اند. تو با حمله مخالفی اما عومیت نظام ادعا میکند ملکه الموت سلاح در اختیار دشمنان ایران قرار داده. چیکار میکنی؟ حمله میکنی یا همچنان با جنگ مخالفت میکنی؟',
        lose: false,
        win: false,
        choices: [
          Choice(text: 'مخالفت با جنگ', nextStateIndex: 1),
          Choice(text: 'حمله به شهر در کنار برادرانت', nextStateIndex: 2),
        ],
      ),
      StoryState(
        title: "تبریک برنده شدی،عموی شما خائن بود!",
        lose: false,
        win: true,
        text: 'با برادران و عمویت مخالفت میکنی و با افراد وفادارت جلوی حمله به شهر رو میگیری اما محصاره شهر رو رها نمیکنی. یک پیک برای پدرت میفرستی و منتظر دستور پدرت میمونی. پیک به همراه پدرت برمیگرده و متوجه میشی که عموی تو قصد داشته با تصرف شهر و استفاده از سلاح جادویی که در اختیار ملکه شهر بوده پادشاهی رو تصرف کنه و پدرت رو بکشه. تو پاداش میگیری و عموی خائنت اعدام میشه.',
        choices: [
          Choice(text: 'شروع مجدد', nextStateIndex: 0),
          Choice(text: 'برو به مسیر A2', nextStateIndex: 0),
        ],
      ),
      StoryState(
        title: "داداش عموت خائن بود زد همتون رو کشت :|",
        lose: true,
        win: false,
        text: 'به همراه عمو و برادرانت به شهر حمله میکنید و به راحتی موفق میشید شهر رو فتح کنید. عموت نظام پیکی رو به سمت پدرت میفرسته و ازش میخواد برای جشن پیروزی به الموت بیاد. فردا شب پدرت به الموت میاد و با خشم وارد تالار جشن میشه. پدرت از کاری که کردین عصبانی شده و میخواد شما رو محاکمه کنه اما ناگهان تعداد زیادی ادم کش وارد تالار میشن و تو به همراه پدر ، برادر ها و تمام افرادتون رو میکشن. عموت نظام با لبخند تاج پادشاهی پدرت رو برمیداره و روی سر خودش میزاره.',
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
                    padding: const EdgeInsets.fromLTRB(16,24,16,8),
                    child: Column(
                      children: [
                        // title
                        Text(
                    story.states[currentStoryIndex].title,
                        style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                        const SizedBox(height: 16),
                        // story txt
                        SizedBox(
                          width: size.width,
                            height: size.height / 2.4,
                            child: Text(
                               story.states[currentStoryIndex].text,
                                style: GoogleFonts.vazirmatn(fontSize: 14),textAlign: TextAlign.justify)),
                        // btn
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
