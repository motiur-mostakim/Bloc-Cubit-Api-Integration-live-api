import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'bloc/product_cubit.dart';
import 'core/utils/app_assets.dart';
import 'core/utils/local_storage_manager.dart';
import 'features/home_screen.dart';
import 'features/provider/repository.dart';

void main() async {
  await dotenv.load(fileName: AppAssets.envFile);
  await LocalStorageManager.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ShopRepository shopRepository = ShopRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ProductCubit(shopRepository: shopRepository),
        child: const HomeScreen(),
      ),
    );
  }
}