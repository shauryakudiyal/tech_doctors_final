import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .25,
        color: Colors.cyan,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(
                          'Repair Your Gadgets',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1,
                            fontSize: 18
                          ),
                        ),
                        SizedBox(height: 20,),
                SizedBox(
                  width: 100,
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      isRepeatingAnimation: true,
                      animatedTexts: [
                        FadeAnimatedText('Repair \nAnything',
                        duration: Duration(seconds: 4)),
                        FadeAnimatedText('Anytime',
                            duration: Duration(seconds: 4)),
                        FadeAnimatedText('Anywhere',
                            duration: Duration(seconds: 4)),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                      ],
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        color: Colors.white,
                        oppositeShadowLightSource: true,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network('https://firebasestorage.googleapis.com/v0/b/tech-doctors.appspot.com/o/gadgets.png?alt=media&token=e420762c-e23a-47fd-a41d-ac4ac06b22b4'),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    style: NeumorphicStyle(color: Colors.white),
                    child: Text('Repair Mobile', textAlign: TextAlign.center,),
                  )),
                  SizedBox(width: 10,),
                  Expanded(child: NeumorphicButton(
                    onPressed: (){},
                    style: NeumorphicStyle(color: Colors.white),
                    child: Text('Repair PC', textAlign: TextAlign.center,),
                  )),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
