abstract class BaseResponse {}

class SuccessResponse<T> extends BaseResponse {

  T response;
  SuccessResponse(this.response);
}

class FailureResponse extends BaseResponse {
  String errorMessage;
  FailureResponse(this.errorMessage);
}
