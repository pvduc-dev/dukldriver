import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DriversApi
void main() {
  final instance = Openapi().getDriversApi();

  group(DriversApi, () {
    //Future driversControllerUpdateDriverLocation(Location location) async
    test('test driversControllerUpdateDriverLocation', () async {
      // TODO
    });

    //Future<Driver> driversControllerUpdateDriverStatus(UpdateStatusDto updateStatusDto) async
    test('test driversControllerUpdateDriverStatus', () async {
      // TODO
    });

  });
}
