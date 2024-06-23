import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/topic_provider.dart';
import 'incorrect_answer_widget.dart';

class AnswerFutureWidget extends ConsumerStatefulWidget {
  final Future<bool> answer;
  final int topicId;

  const AnswerFutureWidget(this.answer, this.topicId);

  @override
  _AnswerFutureWidgetState createState() => _AnswerFutureWidgetState();
}

class _AnswerFutureWidgetState extends ConsumerState<AnswerFutureWidget> {
  bool _hasIncreasedCorrect = false;

  // Increase number of correct answers on selected topic
  // and redirect to correct answer screen.
  void _handleCorrect(BuildContext context) {
    if (!_hasIncreasedCorrect) {
      _hasIncreasedCorrect = true;

      Future(() {
        ref
            .read(topicsProvider.notifier)
            .increaseCorrectAnswers(widget.topicId);

        WidgetsBinding.instance?.addPostFrameCallback((_) {
          if (mounted) {
            context.go('/topics/${widget.topicId}/questions/correct');
          }
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: widget.answer,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Verifying your answer.");
        } else if (snapshot.hasError) {
          return Text("Error verifying answer: ${snapshot.error}");
        } else if (!snapshot.hasData) {
          return const Text("No answer.");
        } else {
          bool answer = snapshot.data!;
          if (answer) {
            _handleCorrect(context);
            return SizedBox(); //return empty box to prevent error
          } else {
            return const IncorrectAnswerWidget();
          }
        }
      },
    );
  }
}
