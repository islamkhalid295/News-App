import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../component/component.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).Sports;
        return ConditionalBuilderRec(
          condition: list.length > 0,
          builder:(context) =>  buildNewsItem(list),
          fallback:(context) =>  Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
