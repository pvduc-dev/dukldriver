import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuthApi
void main() {
  final instance = Openapi().getAuthApi();

  group(AuthApi, () {
    //Future<LoginResponseDto> authControllerLogin(LoginRequestDto loginRequestDto) async
    test('test authControllerLogin', () async {
      // TODO
    });

    //Future<RequestOtpResponseDto> authControllerRequestOtp(RequestOtpRequestDto requestOtpRequestDto) async
    test('test authControllerRequestOtp', () async {
      // TODO
    });

    //Future<Object> authControllerUpsertDeviceToken(UpdateDeviceTokenRequestDto updateDeviceTokenRequestDto) async
    test('test authControllerUpsertDeviceToken', () async {
      // TODO
    });

  });
}
