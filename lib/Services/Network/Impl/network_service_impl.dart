import 'package:http/http.dart' as http;
import 'package:scrolling_performance_test/Services/Network/API/network_service.dart';

final class NetworkServiceImpl implements NetworkService {
  @override
  Future<String> fetch(Uri url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data from $url');
    }
  }
}
