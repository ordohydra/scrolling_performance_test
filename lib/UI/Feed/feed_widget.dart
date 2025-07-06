import 'package:flutter/cupertino.dart';
import 'package:scrolling_performance_test/Managers/Feed/API/feed_manager.dart';

final class FeedWidgetDeps {
  FeedManager feedManager;

  FeedWidgetDeps({required this.feedManager});
}

final class FeedWidget extends StatelessWidget {
  FeedManager _feedManager;
  FeedWidget({super.key, deps = FeedWidgetDeps})
    : _feedManager = deps.feedManager;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _feedManager.fetchFeedItems(),
      builder: (context, snapshot) {
        return ListView.builder(
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return Image.network(snapshot.data![index].imageUrl.toString());
          },
        );
      },
    );
  }
}
