import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/final_tes_bloc.dart';
import '../widgets/input_widget.dart';
import '../widgets/list_button_widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

//untuk hasilnya saya taro di readme ya bang

  @override
  Widget build(BuildContext context) {
    Widget buildResultWigdet(Status status, FinalTesStateInitial state) {
      Widget resultWidget = const SizedBox();
      switch (status) {
        case Status.idle:
          resultWidget = const Text('Silahkan Input Nomor terlebih dahulu');
          break;
        case Status.loading:
          resultWidget = const Center(
            child: CircularProgressIndicator(),
          );
          break;
        case Status.succes:
          resultWidget = Wrap(
            children: state.result
                .map((e) => Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Text(e.toString()),
                    ))
                .toList(),
          );
          break;
      }
      return SizedBox(
        width: double.infinity,
        child: resultWidget,
      );
    }

    final formKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Feri Adrian'),
            centerTitle: true,
            backgroundColor: Colors.white),
        body: BlocBuilder<FinalTesBloc, FinalTesState>(
          builder: (context, state) {
            if (state is FinalTesStateInitial) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        InputWidget(state: state),
                        const SizedBox(
                          height: 20,
                        ),
                        ListButton(formKey: formKey, state: state),
                        const SizedBox(
                          height: 20,
                        ),
                        buildResultWigdet(state.status, state)
                      ],
                    ),
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
