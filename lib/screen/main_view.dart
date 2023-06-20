import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/final_tes_bloc.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

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
                      margin: EdgeInsets.only(left: 20),
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
                        TextFormField(
                          validator: (number) {
                            if (number == null || number.isEmpty) {
                              return 'Mohon Masukkan Angka';
                            }

                            return null;
                          },
                          controller: state.numberController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Color(0xffD4D4D4))),
                            filled: true,
                            fillColor: const Color(0xFFFFFFFF),
                            contentPadding: const EdgeInsets.all(12),
                            hintText: 'Silahkan Input Nomor',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(
                                0xffA3A3A3,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Color(0xffD4D4D4))),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListButton(formKey: formKey, state: state),
                        SizedBox(
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

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.number,
    required this.onTap,
  });

  final Function() onTap;
  final String number;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap, child: Text(number));
  }
}

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.formKey, required this.state});

  final GlobalKey<FormState> formKey;
  final FinalTesStateInitial state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Button(
                number: '1 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<FinalTesBloc>().add(
                          FinalTesEvent.onGetResultNumber1(
                            int.parse(state.numberController.text),
                          ),
                        );
                  }
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Button(
                number: '2 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<FinalTesBloc>().add(
                          FinalTesEvent.onGetResultNumber2(
                            int.parse(state.numberController.text),
                          ),
                        );
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Button(
                number: '3 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<FinalTesBloc>().add(
                          FinalTesEvent.onGetResultNumber3(
                            int.parse(state.numberController.text),
                          ),
                        );
                  }
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Button(
                number: '4 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.read<FinalTesBloc>().add(
                          FinalTesEvent.onGetResultNumber4(
                              int.parse(state.numberController.text)),
                        );
                  }
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
