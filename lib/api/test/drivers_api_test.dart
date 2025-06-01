import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DriversApi
void main() {
  final instance = Openapi().getDriversApi();

  group(DriversApi, () {
    //Future<Object> driversControllerGetDriver(String id) async
    test('test driversControllerGetDriver', () async {
      // TODO
    });

    //Future<Object> driversControllerUpdateDriverLocation(String id, Location location) async
    test('test driversControllerUpdateDriverLocation', () async {
      // TODO
    });

    //Future<Object> driversControllerUpdateDriverStatus(String id, String body) async
    test('test driversControllerUpdateDriverStatus', () async {
      // TODO
    });

  });
}
