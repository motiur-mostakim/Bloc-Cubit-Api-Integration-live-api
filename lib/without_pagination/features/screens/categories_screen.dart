import 'package:bloc_cubit_api_integrate/without_pagination/features/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/categories_cubit.dart';
import '../../bloc/product_cubit.dart';
import '../../bloc/result_state.dart';
import '../model/categories.dart';
import '../model/products.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CategoriesCubit>(context).loadCategories(context);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories Screen')),
      body: BlocBuilder<CategoriesCubit, ResultState<List<Categories>>>(
        builder: (context, state) {
          return state.when(
            idle: () => const Center(child: Text('Idle')),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (categories) => ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SubCategoriesScreen(
                            categorySlug: categories[index].slug.toString()),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(categories[index].name ?? ''),
                    trailing: Text(index.toString()),
                    subtitle: Text(categories[index].slug ?? ''),
                  ),
                );
              },
            ),
            error: (error) => Center(child: Text('Error: ${error.toString()}')),
          );
        },
      ),
    );
  }
}
