import 'package:bloc_cubit_api_integrate/without_pagination/bloc/result_state.dart';
import 'package:bloc_cubit_api_integrate/without_pagination/bloc/sub_categories_cubit.dart';
import 'package:bloc_cubit_api_integrate/without_pagination/features/model/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubCategoriesScreen extends StatefulWidget {
  final String categorySlug;

  const SubCategoriesScreen({super.key, required this.categorySlug});

  @override
  State<SubCategoriesScreen> createState() => _SubCategoriesScreenState();
}

class _SubCategoriesScreenState extends State<SubCategoriesScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<SubCategoriesCubit>(context).loadSubProducts(
          context, widget.categorySlug);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sub Categories"),),
      body: BlocBuilder<SubCategoriesCubit, ResultState<List<Products>>>(
        builder: (context, state) {
          return state.when(idle: () => const Center(child: Text('Idle')), loading: () => const Center(
            child: CircularProgressIndicator(),
          ), data: (products){
            return ListView.builder(
              itemCount: products.length,
              shrinkWrap: true,
              itemBuilder: (context,index){
                return ListTile(
                    title: Text(products[index].title.toString(),),
                  subtitle: Text(products[index].category.toString(),),
                );
              },
            );
          }, error: (error) => Center(child: Text('Error: ${error.toString()}')),);
        },
      ),
    );
  }
}
