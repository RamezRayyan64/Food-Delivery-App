import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_profile_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_home_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_orders_screen.dart';
import 'package:food_delivery_app_ui/screens/home_screens/bottom_nav_screens/bottom_nav_search_screen.dart';

List onboardingDetailsList = [
  {
    'title': 'All your favorites',
    'description':
        'Order from the best local restaurants with easy, on-demand delivery.',
    'imageSource': 'onboarding_image_1'
  },
  {
    'title': 'Free delivery offers',
    'description':
        'Free delivery for new customers via Apple Pay and others payment methods.',
    'imageSource': 'onboarding_image_2'
  },
  {
    'title': 'Choose your food',
    'description':
        'Easily find your type of food craving and you\'ll get delivery in wide range.',
    'imageSource': 'onboarding_image_3'
  }
];

List foodSliderImagesList = ['food1', 'food2', 'food3', 'food4', 'food5'];
List foodSliderImagesList1 = ['food2', 'food3', 'food4', 'food5', 'food1'];
List foodSliderImagesList2 = ['food3', 'food4', 'food5', 'food1', 'food2'];
List foodSliderImagesList3 = ['food4', 'food5', 'food1', 'food2', 'food3'];
List foodSliderImagesList4 = ['food5', 'food1', 'food2', 'food3', 'food4'];
List foodSliderImagesList5 = ['food1', 'food2', 'food3', 'food4', 'food5'];
List foodSliderImagesList6 = ['food2', 'food3', 'food4', 'food5', 'food1'];

List featuredPartnerList = [
  {
    'imageSource': 'food5',
    'titleText': 'Salad Pizza',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.4',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food4',
    'titleText': 'Mario Italiano',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.3',
    'timeText': '20 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food3',
    'titleText': 'Tea Breakfast',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.3',
    'timeText': '10 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food2',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '30 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food1',
    'titleText': 'Chinese Salad',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.4',
    'timeText': '15 Min',
    'deliveryType': 'free Delivery'
  }
];

List bestPackList = [
  {
    'imageSource': 'food1',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food2',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food3',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food4',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  },
  {
    'imageSource': 'food5',
    'titleText': 'The Halal Guys',
    'subTitleText': 'Colarodo, San Fransisco',
    'ratingStar': '4.6',
    'timeText': '25 Min',
    'deliveryType': 'free Delivery'
  }
];

List allRestaurantList = [
  {
    'sliderImages': foodSliderImagesList1,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
  {
    'sliderImages': foodSliderImagesList2,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s1',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
  {
    'sliderImages': foodSliderImagesList3,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s2',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
  {
    'sliderImages': foodSliderImagesList4,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s3',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
  {
    'sliderImages': foodSliderImagesList5,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s4',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
  {
    'sliderImages': foodSliderImagesList6,
    'sliderImageCurrentIndex': 0,
    'titleText': 'McDonald\'s5',
    'dollorSignText': '\$\$',
    'firstFoodTypeText': 'Chinese',
    'secondFoodTypeText': 'American',
    'thirdFoodTypeText': 'Deshi Food',
    'ratingStarText': '4.3',
    'ratingCountText': '200+',
    'timeText': '25 Min',
    'foodDeliveryTypeText': 'Free'
  },
];

//bottom nav home screen list
List bottomNavScreen = [
  const BottomNavHomeScreen(),
  const BottomNavSearchScreen(),
  const BottomNavOrderScreen(),
  const BottomNavProfileScreen()
];

List categories = [
  {'text': 'ALL', 'isSelected': true},
  {'text': 'SALAD', 'isSelected': false},
  {'text': 'BURGER', 'isSelected': false},
  {'text': 'LUNCH', 'isSelected': false},
  {'text': 'SOUP', 'isSelected': false},
  {'text': 'BREAKFAST', 'isSelected': false},
  {'text': 'BRUNCH', 'isSelected': false}
];

List dietary = [
  {'text': 'ANY', 'isSelected': true},
  {'text': 'VEGETARIAN', 'isSelected': false},
  {'text': 'VEGAN', 'isSelected': false},
  {'text': 'GLUTEN-FREE', 'isSelected': false},
];

List validatorList = [];
