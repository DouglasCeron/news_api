

abstract class FutureBaseUseCase<Input, Output>{
  Future<Output> call(Input param);
}