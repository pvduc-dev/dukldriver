# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerGetMe**](AuthApi.md#authcontrollergetme) | **GET** /auth/me | 
[**authControllerLogin**](AuthApi.md#authcontrollerlogin) | **POST** /auth/login | 
[**authControllerLogout**](AuthApi.md#authcontrollerlogout) | **POST** /auth/logout | 
[**authControllerRequestOtp**](AuthApi.md#authcontrollerrequestotp) | **POST** /auth/otp | 
[**authControllerUpsertDeviceToken**](AuthApi.md#authcontrollerupsertdevicetoken) | **PUT** /auth/device-token | 


# **authControllerGetMe**
> Driver authControllerGetMe()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.authControllerGetMe();
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerGetMe: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Driver**](Driver.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerLogin**
> LoginResponseDto authControllerLogin(loginRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final LoginRequestDto loginRequestDto = ; // LoginRequestDto | 

try {
    final response = api.authControllerLogin(loginRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequestDto** | [**LoginRequestDto**](LoginRequestDto.md)|  | 

### Return type

[**LoginResponseDto**](LoginResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerLogout**
> authControllerLogout()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    api.authControllerLogout();
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerLogout: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerRequestOtp**
> RequestOtpResponseDto authControllerRequestOtp(requestOtpRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final RequestOtpRequestDto requestOtpRequestDto = ; // RequestOtpRequestDto | 

try {
    final response = api.authControllerRequestOtp(requestOtpRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerRequestOtp: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestOtpRequestDto** | [**RequestOtpRequestDto**](RequestOtpRequestDto.md)|  | 

### Return type

[**RequestOtpResponseDto**](RequestOtpResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **authControllerUpsertDeviceToken**
> Object authControllerUpsertDeviceToken(updateDeviceTokenRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final UpdateDeviceTokenRequestDto updateDeviceTokenRequestDto = ; // UpdateDeviceTokenRequestDto | 

try {
    final response = api.authControllerUpsertDeviceToken(updateDeviceTokenRequestDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AuthApi->authControllerUpsertDeviceToken: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateDeviceTokenRequestDto** | [**UpdateDeviceTokenRequestDto**](UpdateDeviceTokenRequestDto.md)|  | 

### Return type

**Object**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

