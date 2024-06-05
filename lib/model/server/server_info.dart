class ServerData {
  final String _host = "http://127.0.0.1:8085";
  final String _baseUrl = "/api/";
  String sourceUrl;
  ServerData({required this.sourceUrl});
  String get path => _host + _baseUrl + sourceUrl;
}
