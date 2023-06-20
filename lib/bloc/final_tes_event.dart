part of 'final_tes_bloc.dart';

@freezed
class FinalTesEvent with _$FinalTesEvent {
  const factory FinalTesEvent.onGetResultNumber1(int number) =
      FinalTesEventGetResultNumber1;
  const factory FinalTesEvent.onGetResultNumber2(int number) =
      FinalTesEventGetResultNumber2;
  const factory FinalTesEvent.onGetResultNumber3(int number) =
      FinalTesEventGetResultNumber3;
  const factory FinalTesEvent.onGetResultNumber4(int number) =
      FinalTesEventGetResultNumber4;
}
