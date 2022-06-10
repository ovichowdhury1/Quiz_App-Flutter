import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp1/constants.dart';
import 'package:quizapp1/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
         appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        leading: Padding(
        padding: const EdgeInsets.all(8.0),
         child: Image.asset(
                   "assets/logo.png",
             ),
          ),
        ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 2),
              Container(
                width: 300.0,
                height: 300.0,
                child: ClipRect(
                  child: Image(
                    image: AssetImage(
                      "img/good.png",
                    ),
                  ),
                ),
              ),

              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Colors.amber),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Colors.cyanAccent),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
