# openapi.api.TripsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tripsControllerAcceptTrip**](TripsApi.md#tripscontrolleraccepttrip) | **POST** /trips/{id}/accept | 
[**tripsControllerArriveTrip**](TripsApi.md#tripscontrollerarrivetrip) | **POST** /trips/{id}/arrive | 
[**tripsControllerCancelTrip**](TripsApi.md#tripscontrollercanceltrip) | **POST** /trips/{id}/cancel | 
[**tripsControllerCompleteTrip**](TripsApi.md#tripscontrollercompletetrip) | **POST** /trips/{id}/complete | 
[**tripsControllerGetTrip**](TripsApi.md#tripscontrollergettrip) | **GET** /trips/{id} | 
[**tripsControllerGetTrips**](TripsApi.md#tripscontrollergettrips) | **GET** /trips | 
[**tripsControllerRejectTrip**](TripsApi.md#tripscontrollerrejecttrip) | **POST** /trips/{id}/reject | 


# **tripsControllerAcceptTrip**
> Trip tripsControllerAcceptTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerAcceptTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerAcceptTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerArriveTrip**
> Trip tripsControllerArriveTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerArriveTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerArriveTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerCancelTrip**
> Trip tripsControllerCancelTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerCancelTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerCancelTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerCompleteTrip**
> Trip tripsControllerCompleteTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerCompleteTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerCompleteTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerGetTrip**
> Trip tripsControllerGetTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerGetTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerGetTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerGetTrips**
> List<Trip> tripsControllerGetTrips(status)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String status = status_example; // String | 

try {
    final response = api.tripsControllerGetTrips(status);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerGetTrips: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | 

### Return type

[**List&lt;Trip&gt;**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **tripsControllerRejectTrip**
> Trip tripsControllerRejectTrip(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTripsApi();
final String id = id_example; // String | 

try {
    final response = api.tripsControllerRejectTrip(id);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TripsApi->tripsControllerRejectTrip: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**Trip**](Trip.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

