import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_app/ui/views/home/home_view.dart';
import 'package:stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_app/services/user_service.dart';

import 'package:stacked_app/services/api_service_service.dart';
import 'package:stacked_app/ui/views/details/details_view.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: DetailsView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: UserService),

  LazySingleton(classType: ApiServiceService),
// @stacked-service
])
class App {}
