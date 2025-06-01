# openapi.api.DriversApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**driversControllerUpdateDriverLocation**](DriversApi.md#driverscontrollerupdatedriverlocation) | **PUT** /driver/drivers/location | 
[**driversControllerUpdateDriverStatus**](DriversApi.md#driverscontrollerupdatedriverstatus) | **PUT** /driver/drivers/status | 


# **driversControllerUpdateDriverLocation**
> driversControllerUpdateDriverLocation(location)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDriversApi();
final Location location = ; // Location | 

try {
    api.driversControllerUpdateDriverLocation(location);
} catch on DioException (e) {
    print('Exception when calling DriversApi->driversControllerUpdateDriverLocation: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **location** | [**Location**](Location.md)|  | 

### Return type

void (empty response body)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **driversControllerUpdateDriverStatus**
> Object driversControllerUpdateDriverStatus(body)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDriversApi();
final String body = body_example; // String | 

try {
    final response = api.driversControllerUpdateDriverStatus(body);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DriversApi->driversControllerUpdateDriverStatus: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | **String**|  | 

### Return type

**Object**

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

