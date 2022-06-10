import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizapp1/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/logo.png",
          ),
        ),
        actions: [
          FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip",style: TextStyle(color: Colors.white),)),
        ],
      ),
      body: Body(),
    );
  }
}
