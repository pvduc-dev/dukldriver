import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TripsApi
void main() {
  final instance = Openapi().getTripsApi();

  group(TripsApi, () {
    //Future<Trip> tripsControllerAcceptTrip(String id) async
    test('test tripsControllerAcceptTrip', () async {
      // TODO
    });

    //Future<Trip> tripsControllerArriveTrip(String id) async
    test('test tripsControllerArriveTrip', () async {
      // TODO
    });

    //Future<Trip> tripsControllerCancelTrip(String id) async
    test('test tripsControllerCancelTrip', () async {
      // TODO
    });

    //Future<Trip> tripsControllerCompleteTrip(String id) async
    test('test tripsControllerCompleteTrip', () async {
      // TODO
    });

    //Future<Trip> tripsControllerGetTrip(String id) async
    test('test tripsControllerGetTrip', () async {
      // TODO
    });

    //Future<List<Trip>> tripsControllerGetTrips(String status) async
    test('test tripsControllerGetTrips', () async {
      // TODO
    });

    //Future<Trip> tripsControllerRejectTrip(String id) async
    test('test tripsControllerRejectTrip', () async {
      // TODO
    });

  });
}
