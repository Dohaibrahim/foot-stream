import 'package:flutter/material.dart';
import 'package:foot_stream/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.blue, title: Text("data")),
      //appBar: AppBar(title: Text("مرحبا ، ${userName}")),
      body: HomeViewBody(),
    );
  }
}
