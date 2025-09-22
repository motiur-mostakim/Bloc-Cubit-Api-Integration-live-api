import 'package:bloc_cubit_api_integrate/without_pagination/features/screens/categories_screen.dart';
import 'package:bloc_cubit_api_integrate/without_pagination/features/screens/sub_categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/categories_cubit.dart';
import '../../bloc/product_cubit.dart';
import '../../bloc/result_state.dart';
import '../model/categories.dart';
import '../model/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<CategoriesCubit>(context).loadCategories(context);
    });
    final productCubit = BlocProvider.of<ProductCubit>(context, listen: false);
    productCubit.loadProducts(context, 100);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CategoriesScreen()));
              },
              child: const Text("Categories")),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CategoriesCubit, ResultState<List<Categories>>>(
              builder: (context, state) {
                return state.when(
                  idle: () => const Center(child: Text('Idle')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (categories) => GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 14,
                      childAspectRatio: .66,
                    ),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SubCategoriesScreen(
                                  categorySlug: categories[index].slug.toString()),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 1, color: Colors.grey)),
                          child: Text(categories[index].name.toString(),textAlign: TextAlign.center,),
                        ),
                      );
                    },
                  ),
                  error: (error) =>
                      Center(child: Text('Error: ${error.toString()}')),
                );
              },
            ),
            BlocBuilder<ProductCubit, ResultState<List<Products>>>(
              builder: (context, state) {
                return state.when(
                  idle: () => const Center(child: Text('Idle')),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  data: (products) => ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: products.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        title: Text(product.title ?? 'No title'),
                        trailing: Text(index.toString()),
                        subtitle: Text(product.price.toString() ?? ''),
                      );
                    },
                  ),
                  error: (error) =>
                      Center(child: Text('Error: ${error.toString()}')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
