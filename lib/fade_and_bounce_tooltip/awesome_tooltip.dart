import 'package:flutter/material.dart';
import 'package:flutter_my_awesome_uis/fade_and_bounce_tooltip/tooltip_shape_border.dart';

class AwesomeTooltip extends StatefulWidget {
  const AwesomeTooltip({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  State<AwesomeTooltip> createState() => _AwesomeTooltipState();
}

class _AwesomeTooltipState extends State<AwesomeTooltip>
    with TickerProviderStateMixin {
  late AnimationController _opacityController;
  late AnimationController _scaleController;

  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _opacityAnimation =
        CurvedAnimation(parent: _opacityController, curve: Curves.easeIn);

    _scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500), value: 0.3);
    _scaleAnimation =
        CurvedAnimation(parent: _scaleController, curve: Curves.easeOutBack);

    _scaleController.forward();
    _opacityController.forward();
  }

  @override
  void dispose() {
    _opacityController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: const ShapeDecoration(
            color: Colors.green,
            shape: TooltipShapeBorder(arrowArc: 0.3, radius: 8),
            shadows: [
              BoxShadow(
                  color: Colors.black26, blurRadius: 4.0, offset: Offset(2, 2))
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Wow, this tooltip is awesome ! ",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
