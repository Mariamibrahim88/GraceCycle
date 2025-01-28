import 'package:grace_cycle/core/utils/app_assets.dart';
import 'package:grace_cycle/features/onBourding/presentation/views/components/onBourding_Info.dart';

class OnbourdingData {
  List<OnbourdingInfo> items = [
    OnbourdingInfo(
        title: 'Choose your Favorite Food',
        description:
            'We have a variety of dishes for breakfast, lunch, and dinner to suit all tastes',
        image: AppAssets.imgOnboarding1),
    OnbourdingInfo(
        title: 'Save money on your food',
        description:
            'Enjoy exclusive discounts on all your favorite snacks year-round',
        image: AppAssets.imgOnboarding2),
    OnbourdingInfo(
        title: 'Delivery to your door',
        description: 'Enjoy the feature of ordering food \n to your door',
        image: AppAssets.imgOnboarding3),
  ];
}
