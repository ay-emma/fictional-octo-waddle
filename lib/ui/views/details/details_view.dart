import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  const DetailsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    DetailsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DetailsViewModel();
}
