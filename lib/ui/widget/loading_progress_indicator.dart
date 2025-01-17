import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingProgressIndicator extends StatelessWidget {
  const LoadingProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.progressiveDots(
        color: Colors.blue,
        size: 60,
      ),
    );
  }
}
