import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/final_tes_bloc.dart';
import 'button_widget.dart';

class ListButton extends StatelessWidget {
  const ListButton({super.key, required this.formKey, required this.state});

  final GlobalKey<FormState> formKey;
  final FinalTesStateInitial state;

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<FinalTesBloc>();
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
                    bloc.add(
                      FinalTesEvent.onGetResultNumber1(
                        int.parse(state.numberController.text),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Button(
                number: '2 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    bloc.add(
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
        const SizedBox(
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
                    bloc.add(
                      FinalTesEvent.onGetResultNumber3(
                        int.parse(state.numberController.text),
                      ),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Button(
                number: '4 ',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    bloc.add(
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
