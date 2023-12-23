import '../category/category_binding.dart';
import '../category/category_view.dart';
import '../home/home_binding.dart';
import '../home/home_view.dart';
import '../watchlist/watchlist_binding.dart';
import '../watchlist/watchlist_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WATCHLIST;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => HomeDetailsView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WATCHLIST,
      page: () => WatchlistView(),
      binding: WatchlistBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY,
      page: () => CategoryView(),
      binding: CategoryBinding(),
   ),
   GetPage(
      name: _Paths.DEBUG,
      page: () => DebugView(),
      binding: DebugBinding(),
    ),
    GetPage(
      name: _Paths.POLITICS,
      page: () => PoliticsView(),
      binding: PoliticsBinding(),
    ),
 ];
}