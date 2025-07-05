import 'package:scrolling_performance_test/Managers/Feed/API/feed_item.dart';

abstract interface class FeedManager {
  Future<List<FeedItem>> fetchFeedItems();
}
