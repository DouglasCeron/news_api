abstract class BaseResponse {}

class SuccessResponse<T> extends BaseResponse {

  T data;
  SuccessResponse(this.data);
}

class FailureResponse extends BaseResponse {
  String errorMessage;
  FailureResponse(this.errorMessage);
}
