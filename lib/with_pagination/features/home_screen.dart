// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../bloc/product_cubit.dart';
// import '../bloc/result_state.dart';
// import 'model/products.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final ScrollController _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     final productCubit = BlocProvider.of<ProductCubit>(context, listen: false);
//     productCubit.loadProducts();
//
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//           _scrollController.position.maxScrollExtent - 200) {
//         // Load more when near bottom
//         productCubit.loadProducts(isLoadMore: true);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Products')),
//       body: BlocBuilder<ProductCubit, ResultState<List<Products>>>(
//         builder: (context, state) {
//           return state.when(
//             idle: () => const Center(child: Text('Idle')),
//             loading: () => const Center(child: CircularProgressIndicator()),
//             data: (products) => ListView.builder(
//               controller: _scrollController,
//               itemCount: products.length + 1,
//               itemBuilder: (context, index) {
//                 if (index == products.length) {
//                   final cubit = context.read<ProductCubit>();
//                   if (cubit.hasMore) {
//                     return const Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Center(child: CircularProgressIndicator()),
//                     );
//                   } else {
//                     return const SizedBox(); // no more items
//                   }
//                 }
//
//                 final product = products[index];
//                 return ListTile(
//                   title: Text(product.title ?? 'No title'),
//                   trailing: Text(index.toString()),
//                   subtitle: Text(product.price.toString() ?? ''),
//                 );
//               },
//             ),
//             error: (error) => Center(child: Text('Error: ${error.toString()}')),
//           );
//         },
//       ),
//     );
//   }
// }
