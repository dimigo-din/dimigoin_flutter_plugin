part of dimigoin_flutter_plugin;

class StreamSocket{
  final _socketResponse = StreamController<Map>();

  Stream<Map> get getResponse => _socketResponse.stream;

  void registerNewData(Map data) => _socketResponse.add(data);

  void dispose() => _socketResponse.close();
}
