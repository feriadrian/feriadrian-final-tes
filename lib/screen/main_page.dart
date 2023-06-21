import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/final_tes_bloc.dart';
import 'main_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

//untuk hasilnya saya taro di readme ya bang

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinalTesBloc(),
      child: const MainView(),
    );
  }
}
