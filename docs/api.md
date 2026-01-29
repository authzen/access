# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [access/v1/access.proto](#access_v1_access-proto)
    - [Action](#authzen-access-v1-Action)
    - [ActionSearchRequest](#authzen-access-v1-ActionSearchRequest)
    - [ActionSearchResponse](#authzen-access-v1-ActionSearchResponse)
    - [EvaluationRequest](#authzen-access-v1-EvaluationRequest)
    - [EvaluationResponse](#authzen-access-v1-EvaluationResponse)
    - [EvaluationsRequest](#authzen-access-v1-EvaluationsRequest)
    - [EvaluationsResponse](#authzen-access-v1-EvaluationsResponse)
    - [PaginationRequest](#authzen-access-v1-PaginationRequest)
    - [PaginationResponse](#authzen-access-v1-PaginationResponse)
    - [Resource](#authzen-access-v1-Resource)
    - [ResourceSearchRequest](#authzen-access-v1-ResourceSearchRequest)
    - [ResourceSearchResponse](#authzen-access-v1-ResourceSearchResponse)
    - [Subject](#authzen-access-v1-Subject)
    - [SubjectSearchRequest](#authzen-access-v1-SubjectSearchRequest)
    - [SubjectSearchResponse](#authzen-access-v1-SubjectSearchResponse)
  
    - [Access](#authzen-access-v1-Access)
  
- [Scalar Value Types](#scalar-value-types)



<a name="access_v1_access-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## access/v1/access.proto



<a name="authzen-access-v1-Action"></a>

### Action
https://openid.github.io/authzen/#name-action


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| name | [string](#string) |  |  |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-ActionSearchRequest"></a>

### ActionSearchRequest
https://openid.github.io/authzen/#name-the-action-search-api-reque


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| subject | [Subject](#authzen-access-v1-Subject) |  |  |
| action | [Action](#authzen-access-v1-Action) |  |  |
| resource | [Resource](#authzen-access-v1-Resource) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) |  |  |
| page | [PaginationRequest](#authzen-access-v1-PaginationRequest) |  |  |






<a name="authzen-access-v1-ActionSearchResponse"></a>

### ActionSearchResponse
https://openid.github.io/authzen/#name-the-action-search-api-respo


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [Action](#authzen-access-v1-Action) | repeated |  |
| page | [PaginationResponse](#authzen-access-v1-PaginationResponse) |  |  |






<a name="authzen-access-v1-EvaluationRequest"></a>

### EvaluationRequest
https://openid.github.io/authzen/#name-the-access-evaluation-api-r


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| subject | [Subject](#authzen-access-v1-Subject) |  |  |
| action | [Action](#authzen-access-v1-Action) |  |  |
| resource | [Resource](#authzen-access-v1-Resource) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-EvaluationResponse"></a>

### EvaluationResponse
https://openid.github.io/authzen/#name-the-access-evaluation-api-re


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| decision | [bool](#bool) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) |  |  |






<a name="authzen-access-v1-EvaluationsRequest"></a>

### EvaluationsRequest
https://openid.github.io/authzen/#name-the-access-evaluations-api-


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| subject | [Subject](#authzen-access-v1-Subject) |  |  |
| action | [Action](#authzen-access-v1-Action) |  |  |
| resource | [Resource](#authzen-access-v1-Resource) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |
| evaluations | [EvaluationRequest](#authzen-access-v1-EvaluationRequest) | repeated |  |
| options | [google.protobuf.Struct](#google-protobuf-Struct) |  |  |






<a name="authzen-access-v1-EvaluationsResponse"></a>

### EvaluationsResponse
https://openid.github.io/authzen/#name-access-evaluations-api-resp


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| evaluations | [EvaluationResponse](#authzen-access-v1-EvaluationResponse) | repeated |  |






<a name="authzen-access-v1-PaginationRequest"></a>

### PaginationRequest
https://openid.github.io/authzen/#name-paginated-requests


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| token | [string](#string) | optional |  |
| limit | [int32](#int32) | optional |  |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-PaginationResponse"></a>

### PaginationResponse
https://openid.github.io/authzen/#name-paginated-responses


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| next_token | [string](#string) |  |  |
| count | [int64](#int64) | optional |  |
| total | [int64](#int64) | optional |  |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-Resource"></a>

### Resource
https://openid.github.io/authzen/#name-resource


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  |  |
| id | [string](#string) |  |  |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-ResourceSearchRequest"></a>

### ResourceSearchRequest
https://openid.github.io/authzen/#name-the-resource-search-api-req


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| subject | [Subject](#authzen-access-v1-Subject) |  |  |
| action | [Action](#authzen-access-v1-Action) |  |  |
| resource | [Resource](#authzen-access-v1-Resource) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) |  |  |
| page | [PaginationRequest](#authzen-access-v1-PaginationRequest) |  |  |






<a name="authzen-access-v1-ResourceSearchResponse"></a>

### ResourceSearchResponse
https://openid.github.io/authzen/#name-the-resource-search-api-res


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [Resource](#authzen-access-v1-Resource) | repeated |  |
| page | [PaginationResponse](#authzen-access-v1-PaginationResponse) |  |  |






<a name="authzen-access-v1-Subject"></a>

### Subject
https://openid.github.io/authzen/#name-subject


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| type | [string](#string) |  |  |
| id | [string](#string) |  |  |
| properties | [google.protobuf.Struct](#google-protobuf-Struct) | optional |  |






<a name="authzen-access-v1-SubjectSearchRequest"></a>

### SubjectSearchRequest
https://openid.github.io/authzen/#name-the-subject-search-api-requ


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| subject | [Subject](#authzen-access-v1-Subject) |  |  |
| action | [Action](#authzen-access-v1-Action) |  |  |
| resource | [Resource](#authzen-access-v1-Resource) |  |  |
| context | [google.protobuf.Struct](#google-protobuf-Struct) |  |  |
| page | [PaginationRequest](#authzen-access-v1-PaginationRequest) |  |  |






<a name="authzen-access-v1-SubjectSearchResponse"></a>

### SubjectSearchResponse
https://openid.github.io/authzen/#name-the-subject-search-api-resp


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| results | [Subject](#authzen-access-v1-Subject) | repeated |  |
| page | [PaginationResponse](#authzen-access-v1-PaginationResponse) |  |  |





 

 

 


<a name="authzen-access-v1-Access"></a>

### Access


| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| Evaluation | [EvaluationRequest](#authzen-access-v1-EvaluationRequest) | [EvaluationResponse](#authzen-access-v1-EvaluationResponse) | evaluation (https://openid.github.io/authzen/#name-access-evaluation-api) |
| Evaluations | [EvaluationsRequest](#authzen-access-v1-EvaluationsRequest) | [EvaluationsResponse](#authzen-access-v1-EvaluationsResponse) | evaluations (https://openid.github.io/authzen/#name-access-evaluations-api) |
| SubjectSearch | [SubjectSearchRequest](#authzen-access-v1-SubjectSearchRequest) | [SubjectSearchResponse](#authzen-access-v1-SubjectSearchResponse) | subject search (https://openid.github.io/authzen/#name-subject-search-api) |
| ResourceSearch | [ResourceSearchRequest](#authzen-access-v1-ResourceSearchRequest) | [ResourceSearchResponse](#authzen-access-v1-ResourceSearchResponse) | resource search (https://openid.github.io/authzen/#name-resource-search-api) |
| ActionSearch | [ActionSearchRequest](#authzen-access-v1-ActionSearchRequest) | [ActionSearchResponse](#authzen-access-v1-ActionSearchResponse) | action search (https://openid.github.io/authzen/#name-action-search-api) |

 



## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |

