import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../home/home_viewmodel.dart';
import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  const DetailsView({Key? key, required this.user, required this.index})
      : super(key: key);
  final User user;
  final int index;

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            children: [
              const SizedBox(),
              Hero(
                tag: 'ph+$index',
                child: CircleAvatar(
                  radius: 70.0,
                  backgroundImage: NetworkImage(user.picture),
                ),
              ),
              Text(
                user.name,
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(user.country),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewModel();
}
