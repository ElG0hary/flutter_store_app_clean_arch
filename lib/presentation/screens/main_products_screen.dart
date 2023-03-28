import 'package:fakeshop/core/services/service_locator.dart';
import 'package:fakeshop/presentation/blocs/all_products/all_products_bloc.dart';
import 'package:fakeshop/presentation/components/main_screen_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainProductsScreen extends StatelessWidget {
  const MainProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AllProductsBloc>()..add(GetAllProductsEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fake Store'),
          centerTitle: true,
        ),
        body: GridView.builder(
          clipBehavior: Clip.none,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            mainAxisSpacing: 50,
          ),
          itemBuilder: (context, index) => ProductItemWidget(index: index),
          itemCount: 20,
        ),
      ),
    );
  }
}
