import 'package:bookly_app/config/icons/icons_broken.dart';
import 'package:bookly_app/config/routes/app_routes.dart';
import 'package:bookly_app/core/utils/app_assets.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          AppAssets.logo,
          height: 25,
        ),
        actions: [
          IconButton(
            icon: const Icon(IconBroken.Search),
            onPressed: () {
              Navigator.pushNamed(context, Routes.searchView);
            },
          ),
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
