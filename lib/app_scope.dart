import 'package:scrolling_performance_test/Managers/Feed/API/feed_manager.dart';
import 'package:scrolling_performance_test/Managers/Feed/Impl/feed_manager_impl.dart';
import 'package:scrolling_performance_test/Services/Network/API/network_service.dart';
import 'package:scrolling_performance_test/Services/Network/Impl/network_service_impl.dart';

final class AppScope {
  NetworkService networkService;
  late FeedManager feedManager;

  AppScope() : networkService = NetworkServiceImpl() {
    feedManager = FeedManagerImpl(
      deps: NetworkServiceImplDeps(networkService: networkService),
    );
  }
}
