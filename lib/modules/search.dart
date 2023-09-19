import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';

class Search extends StatelessWidget {
  Search({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  label: Text("Search"), border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.search),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "enter any text";
                  }
                  return null;
                },
                controller: searchController,
                onFieldSubmitted: (value) {
                  AppCubit.get(context).getSearch(value);
                  print(value);
                },
              ),
            ),
            BlocConsumer<AppCubit, AppState>(
                listener: (context, state) {},
                builder: (context, state) {
                  var list = AppCubit
                      .get(context)
                      .search;
                 return Expanded(
                    child: ConditionalBuilderRec(
                      condition: list.isNotEmpty,
                      builder: (context) => buildNewsItem(list),
                      fallback: (context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                  );
                },
                ),
          ],
        ),
      ),
    );
  }
}
