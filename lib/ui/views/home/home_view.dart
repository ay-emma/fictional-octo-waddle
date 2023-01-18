import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  HomeView({Key? key}) : super(key: key);

  final _navigationService = locator<NavigationService>();

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: FutureBuilder<List<User>>(
                future: viewModel.getUsers(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: ((context, index) {
                        User user = snapshot.data![index];
                        return ListTile(
                          onTap: () {
                            _navigationService.navigateToDetailsView(
                              user: user,
                              index: index,
                            );
                          },
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          leading: Hero(
                            tag: "ph+$index",
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(user.picture),
                            ),
                          ),
                        );
                      }),
                    );
                  }

                  if (snapshot.hasError) {
                    return const Text("Error");
                  }

                  return const Center(child: CircularProgressIndicator());
                })),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
