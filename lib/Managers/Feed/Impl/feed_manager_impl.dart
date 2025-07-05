import 'package:scrolling_performance_test/Managers/Feed/API/feed_item.dart';
import 'package:scrolling_performance_test/Managers/Feed/API/feed_manager.dart';
import 'package:scrolling_performance_test/Services/Network/API/network_service.dart';
import 'package:xml/xml.dart';

final class NetworkServiceImplDeps {
  NetworkService networkService;

  NetworkServiceImplDeps({required this.networkService});
}

final class FeedManagerImpl implements FeedManager {
  final NetworkService _networkService;

  FeedManagerImpl({required NetworkServiceImplDeps deps})
    : _networkService = deps.networkService;

  @override
  Future<List<FeedItem>> fetchFeedItems() async {
    final url = Uri.parse(
      "https://www.nasa.gov/rss/dyn/lg_image_of_the_day.rss",
    );
    final responseStr = await _networkService.fetch(url);
    final document = XmlDocument.parse(responseStr);
    final items = document.findAllElements("item");

    return items.map((item) {
      final imageUrl = item.findElements("enclosure").first.getAttribute("url");
      if (imageUrl == null) {
        throw Exception("Image URL not found in feed item");
      }
      return FeedItem(imageUrl: Uri.parse(imageUrl));
    }).toList();
  }
}
