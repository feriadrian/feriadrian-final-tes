part of 'final_tes_bloc.dart';

enum Status { idle, loading, succes }

@freezed
class FinalTesState with _$FinalTesState {
  const factory FinalTesState.initial(
      {required List<String> result,
      required Status status,
      required TextEditingController numberController}) = FinalTesStateInitial;
}
