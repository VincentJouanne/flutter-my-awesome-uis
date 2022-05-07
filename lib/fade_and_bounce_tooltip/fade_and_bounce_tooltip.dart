import 'package:flutter/material.dart';
import 'package:flutter_my_awesome_uis/awesome_ui.dart';
import 'package:flutter_my_awesome_uis/fade_and_bounce_tooltip/awesome_tooltip.dart';

class FadeAndBounceTooltipView extends AwesomeUI {
  const FadeAndBounceTooltipView({Key? key})
      : super(key: key, name: 'Fade and bounce tooltip');

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ActionButton(),
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({Key? key}) : super(key: key);

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Align(
          alignment: Alignment.center,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: const Text("Make it pop")),
        ),
        isVisible
            ? Positioned.fill(
                top: -120,
                child: Align(
                    alignment: Alignment.center,
                    child: AwesomeTooltip(child: widget)),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
