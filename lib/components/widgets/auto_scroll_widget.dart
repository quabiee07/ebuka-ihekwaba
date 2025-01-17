import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MarqueeWidget extends StatefulWidget {
  final List<String> assets;

  const MarqueeWidget({super.key, required this.assets});
  @override
  State<StatefulWidget> createState() => _MarqueeWidgetState();
}

class _MarqueeWidgetState extends State<MarqueeWidget> {
  final _controller = ScrollController();
  late Timer _timer;

  @override
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(Duration(milliseconds: 50), (_) {
        if (_controller.hasClients) {
          _controller.animateTo(
            _controller.offset + 5,
            duration: Duration(milliseconds: 50),
            curve: Curves.fastOutSlowIn,
          );
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: ListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final asset = widget.assets[index % widget.assets.length];
            return SvgPicture.asset(
              asset,
              height: 60,
              width: 60,
              color: Colors.white,
            );
          },
        ),
      ),
    );
  }
}
