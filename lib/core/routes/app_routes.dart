import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grace_cycle/core/service/service_locator.dart';
import 'package:grace_cycle/core/widgets/custom_buttom_nav_bar.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/first_forget_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/login_in_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/set_new_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_continue_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/signup_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/succ_set_new_pass_view.dart';
import 'package:grace_cycle/features/Authentication/presentation/views/verify_your_email_view.dart';
import 'package:grace_cycle/features/cart/data/repos/cart_repo.dart';
import 'package:grace_cycle/features/cart/presentation/manager/cubit/cart_cubit.dart';
import 'package:grace_cycle/features/cart/presentation/views/cart_full_view.dart';
import 'package:grace_cycle/features/cart/presentation/views/cart_view.dart';
import 'package:grace_cycle/features/details/presentation/manager/cubit/details_cubit.dart';
import 'package:grace_cycle/features/orders/data/repo/order_repo.dart';
import 'package:grace_cycle/features/orders/presentation/manager/cubit/checkout_cubit.dart';
import 'package:grace_cycle/features/orders/presentation/views/checkout_view.dart';
import 'package:grace_cycle/features/details/presentation/views/food_details_view.dart';
import 'package:grace_cycle/features/details/presentation/views/vendor_details_view.dart';
import 'package:grace_cycle/features/details/presentation/views/write_review_view.dart';
import 'package:grace_cycle/features/favorites/presentation/views/favorites_view.dart';
import 'package:grace_cycle/features/home/presentation/views/home_view.dart';
import 'package:grace_cycle/features/home/presentation/views/see_all_view.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/onbourding_view.dart';
import 'package:grace_cycle/features/orders/presentation/views/orders_view.dart';
import 'package:grace_cycle/features/orders/presentation/views/done_order_view.dart';
import 'package:grace_cycle/features/settings/presentation/views/settings_view.dart';
import 'package:grace_cycle/features/splash/presentation/views/splash_view.dart';
import 'package:grace_cycle/no_internet_page.dart';

class Routes {
  static const String initialRoute = '/';
  static const String signup = '/signup';
  static const String continueSignup = '/signupContinue';
  static const String login = '/login';
  static const String firstForgetPass = '/firstForgetPass';
  static const String verfiyYourEmail = '/verfiyYourEmail';
  static const String setNewPass = '/setNewPass';
  static const String succSetNewPass = '/succSetNewPass';
  static const String onBourding = '/OnBourding';
  static const String home = '/home';
  static const String navBar = '/navBar';
  static const String seeAll = '/seeAll';
  static const String favorites = '/favorites';
  static const String cart = '/cart';
  static const String settings = '/settings';
  static const String vendorDetails = '/vendorDetails';
  static const String cartFull = '/cartFull';
  static const String checkout = 'checkout';
  static const String writeReview = '/writeReview';
  static const String ordersView = '/ordersView';
  static const String doneOrder = '/doneOrder';
  static const String foodDetails = '/foodDetails';
  static const String noInternet = '/noInternet';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.noInternet:
        return MaterialPageRoute(builder: (_) => const NoInternetPage());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.onBourding:
        return MaterialPageRoute(builder: (_) => const OnBourdingView());
      case Routes.continueSignup:
        return MaterialPageRoute(builder: (_) => const SignupContinueView());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginInView());
      case Routes.firstForgetPass:
        return MaterialPageRoute(builder: (_) => const FirstForgetPassView());
      case Routes.verfiyYourEmail:
        return MaterialPageRoute(builder: (_) => const VerifyYourEmailView());
      case Routes.setNewPass:
        return MaterialPageRoute(builder: (_) => const SetNewPassView());
      case Routes.succSetNewPass:
        return MaterialPageRoute(builder: (_) => const SuccSetNewPassView());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const SignupView());
      case Routes.navBar:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
      case Routes.seeAll:
        return MaterialPageRoute(builder: (_) => const SeeAllView());
      case Routes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesView());
      case Routes.cart:
        return MaterialPageRoute(builder: (_) => const CartView());
      case Routes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsView());
      case Routes.checkout:
        final orderId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => BlocProvider<CheckoutCubit>(
                  create: (context) =>
                      sl<CheckoutCubit>()..getOrderDetails(orderId: orderId),
                  child: const CheckoutView(),
                ));
      case Routes.writeReview:
        return MaterialPageRoute(builder: (_) => const WriteReviewView());
      case Routes.ordersView:
        return MaterialPageRoute(builder: (_) => const OrdersView());
      case Routes.doneOrder:
        return MaterialPageRoute(builder: (_) => const DoneOrderView());
      case Routes.vendorDetails:
        final id = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      DetailsCubit(sl())..getVendorDetails(id: id),
                  child: const VendorDetailsView(),
                ));
      case Routes.foodDetails:
        final id = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) =>
                      DetailsCubit(sl())..getFoodDetails(id: id),
                  child: const FoodDetailsView(),
                ));
      case Routes.cartFull:
        print('venndoramid :$settings.arguments');
        final id = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => CartCubit(sl<CartRepo>())
                  ..getCartItemsForSpecificVendor(vendorId: id),
              ),
              BlocProvider(
                create: (context) => CheckoutCubit(sl<OrderRepo>()),
              ),
            ],
            child: const CartFullView(),
          ),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
