import 'package:flutter/material.dart';
import 'package:scrolling_performance_test/Managers/Feed/API/feed_manager.dart';
import 'package:scrolling_performance_test/UI/Feed/feed_widget.dart';

final class MainScreenDeps {
  FeedManager feedManager;

  MainScreenDeps({required this.feedManager});
}

class MainScreen extends StatelessWidget {
  MainScreen({super.key, deps = MainScreenDeps})
    : _feedManager = deps.feedManager;

  final FeedManager _feedManager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FeedWidget(deps: FeedWidgetDeps(feedManager: _feedManager)),
    );
  }
}
