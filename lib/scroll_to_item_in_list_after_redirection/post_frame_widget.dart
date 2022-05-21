import 'package:flutter/material.dart';

class PostFrameWidget extends StatefulWidget {
  const PostFrameWidget({
    Key? key,
    required this.child,
    required this.callback,
  }) : super(key: key);

  final Widget child;
  final Function callback;

  @override
  State<PostFrameWidget> createState() => _PostFrameStateWidget();
}

class _PostFrameStateWidget extends State<PostFrameWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.callback());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
