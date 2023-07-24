import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StoryScreen extends StatelessWidget {
  const StoryScreen({super.key});

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
                            child: Text("متن داستان اصلی",style: GoogleFonts.vazirmatn(fontSize: 14),textAlign: TextAlign.center)),
                        // btns
                        ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: const MaterialStatePropertyAll(Colors.lightBlue),
                              minimumSize: MaterialStatePropertyAll(Size(size.width / 1.2,40)),
                            ),
                            onPressed: () {},
                            child: Text("انتخاب اول",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold))
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Colors.pinkAccent),
                            minimumSize: MaterialStatePropertyAll(Size(size.width / 1.2,40)),
                          ),
                            onPressed: () {},
                            child: Text("انتخاب دوم",style: GoogleFonts.vazirmatn(fontSize: 16,fontWeight: FontWeight.bold))
                        )
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
