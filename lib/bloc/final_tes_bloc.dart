import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'final_tes_event.dart';
part 'final_tes_state.dart';
part 'final_tes_bloc.freezed.dart';

class FinalTesBloc extends Bloc<FinalTesEvent, FinalTesState> {
  FinalTesBloc()
      : super(FinalTesState.initial(
            result: [],
            status: Status.idle,
            numberController: TextEditingController())) {
    on<FinalTesEventGetResultNumber1>(_onGetResultNumber1);
    on<FinalTesEventGetResultNumber2>(_onGetResultNumber2);
    on<FinalTesEventGetResultNumber3>(_onGetResultNumber3);
    on<FinalTesEventGetResultNumber4>(_onGetResultNumber4);
  }

//untuk hasilnya saya taro di readme ya bang

  Future<void> _onGetResultNumber1(
      FinalTesEventGetResultNumber1 event, Emitter<FinalTesState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      result.add(i.toString());
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber2(
      FinalTesEventGetResultNumber2 event, Emitter<FinalTesState> emit) async {
    final List<String> result = [];

    emit(state.copyWith(
      status: Status.loading,
    ));

    for (var i = 1; i <= int.parse(event.number.toString()); i++) {
      result.add(i.toString());

      if (i == int.parse(event.number.toString())) {
        for (var j = int.parse(event.number.toString()) - 1; j > 0; j--) {
          result.add(j.toString());
        }
      }
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber3(
      FinalTesEventGetResultNumber3 event, Emitter<FinalTesState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];
    int firstIndex = 10;

    for (var i = 0; i < int.parse(event.number.toString()); i++) {
      result.add((firstIndex + i * 11).toString());
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }

  Future<void> _onGetResultNumber4(
      FinalTesEventGetResultNumber4 event, Emitter<FinalTesState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final List<String> result = [];

    for (var i = 1; i < int.parse(event.number.toString()) + 1; i++) {
      if (i % 5 == 0) {
        result.add('Lima');
      } else if (i % 7 == 0) {
        result.add('Tujuh');
      } else {
        result.add(i.toString());
      }
    }
    emit(state.copyWith(result: result, status: Status.succes));
  }
}
