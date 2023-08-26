import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

final List<String> bannerImages = [
  './assets/images/banner1.jpg',
  './assets/images/banner2.jpg',
  './assets/images/banner3.jpg',
];

final List<Map<String, dynamic>> offerZones = [
  {
    'imgUrl':
        'https://www.licious.in/blog/wp-content/uploads/2022/03/Chicken-Curry-Cut-min.png',
    'title': 'Fresh Chicken',
    'type': 'veg',
    'subTitle':
        'Planning an evening party and want to add palatable chicken delicacies to your platter? Fresh chicken meat is certainly an undisputed choice.',
    'price': 89
  },
  {
    'imgUrl':
        'https://media.istockphoto.com/id/607592378/photo/fresh-chicken-with-spices.jpg?s=612x612&w=0&k=20&c=PLgtw1-YWK9RJE1eF9rd8rov5DeiCfrui21tJrFQr78=',
    'title': 'Chicken ',
    'type': 'nonveg',
    'subTitle': '1Kg contains 4 pcs of chicken & 2 Boiled Eggs ',
    'price': 790
  },
  {
    'imgUrl':
        'https://i0.wp.com/legpiece.in/wp-content/uploads/2021/09/Premium-farm-chicken.jpg?fit=640%2C640&ssl=1',
    'title': 'Farm Fresh Chicken curry cut',
    'type': 'veg',
    'subTitle': 'for 1 person',
    'price': 80
  },
  {
    'imgUrl':
        'https://www.licious.in/blog/wp-content/uploads/2022/03/Chicken-Curry-Cut-min.png',
    'title': 'Fresh Chicken',
    'type': 'veg',
    'subTitle':
        'Planning an evening party and want to add palatable chicken delicacies to your platter? Fresh chicken meat is certainly an undisputed choice.',
    'price': 89
  },
  {
    'imgUrl':
        'https://media.istockphoto.com/id/607592378/photo/fresh-chicken-with-spices.jpg?s=612x612&w=0&k=20&c=PLgtw1-YWK9RJE1eF9rd8rov5DeiCfrui21tJrFQr78=',
    'title': 'Chicken ',
    'type': 'nonveg',
    'subTitle': '1Kg contains 4 pcs of chicken & 2 Boiled Eggs ',
    'price': 790
  },
  {
    'imgUrl':
        'https://i0.wp.com/legpiece.in/wp-content/uploads/2021/09/Premium-farm-chicken.jpg?fit=640%2C640&ssl=1',
    'title': 'Farm Fresh Chicken curry cut',
    'type': 'veg',
    'subTitle': 'for 1 person',
    'price': 80
  },
  {
    'imgUrl':
        'https://www.licious.in/blog/wp-content/uploads/2022/03/Chicken-Curry-Cut-min.png',
    'title': 'Fresh Chicken',
    'type': 'veg',
    'subTitle':
        'Planning an evening party and want to add palatable chicken delicacies to your platter? Fresh chicken meat is certainly an undisputed choice.',
    'price': 89
  },
  {
    'imgUrl':
        'https://media.istockphoto.com/id/607592378/photo/fresh-chicken-with-spices.jpg?s=612x612&w=0&k=20&c=PLgtw1-YWK9RJE1eF9rd8rov5DeiCfrui21tJrFQr78=',
    'title': 'Chicken ',
    'type': 'nonveg',
    'subTitle': '1Kg contains 4 pcs of chicken & 2 Boiled Eggs ',
    'price': 790
  },
  {
    'imgUrl':
        'https://i0.wp.com/legpiece.in/wp-content/uploads/2021/09/Premium-farm-chicken.jpg?fit=640%2C640&ssl=1',
    'title': 'Farm Fresh Chicken curry cut',
    'type': 'veg',
    'subTitle': 'for 1 person',
    'price': 80
  },
];
final List<Map<String, dynamic>> restaurantData = [
  {
    'imgUrl':
        'https://spencermeatshop.com/wp-content/uploads/2020/12/chicken-banner.jpg',
    'title': 'Fine Dining',
    'type': 'veg',
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
  {
    'imgUrl':
        'https://meatmart.lk/wp-content/uploads/2015/01/Meatmart.lk-FreshChicken-770x370-header.jpg',
    'title': 'Fine Dining',
    'type': 'veg',
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
  {
    'imgUrl':
        'https://myfoodbook.com.au/sites/default/files/styles/schema_img/public/recipe_photo/Blan20152091_0.jpg',
    'title': 'Casual Dining',
    'type': 'veg',
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
];
final List<Map<String, dynamic>> allRestaurantData = [
  {
    'imgUrl':
        'https://www.everydaymeat.com/wp-content/uploads/2018/12/Logo-Everyday-.png',
    'title': 'Everyday meat',
    'color': Colors.amber,
    'rating': 4.5,
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
  {
    'imgUrl':
        'https://cdn.freebiesupply.com/logos/large/2x/bounty-farm-meat-centre-logo-png-transparent.png',
    'title': 'Bounty Meat Center',
    'color': Colors.green.shade900,
    'rating': 3.5,
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
  {
    'imgUrl':
        'https://gust-production.s3.amazonaws.com/uploads/startup/logo_image/953154/Fresh_Meat_Market__3_.png',
    'title': 'The Fresh Meat Market',
    'color': Colors.amber,
    'rating': 4.7,
    'subTitle':
        'Akshya Nagar 1st Block 1st Cross, Rammurthy nagar, Bangalore-560016',
  },
];

final List<Map<String, dynamic>> categories = [
  {
    "imgUrl":
        "https://thumbs.dreamstime.com/b/cleaned-ready-to-cook-fresh-fish-horse-indian-mackerel-decorated-herbs-vegetables-wooden-pad-201550855.jpg",
    "name": "Fish"
  },
  {
    "imgUrl":
        "https://media.istockphoto.com/id/1074830312/photo/raw-organic-chicken-breast.jpg?s=612x612&w=0&k=20&c=3i9GoSD7dBS5D8mbYLhgAUBv07G5bAU3pjQufENjmSc=",
    "name": "Chicken"
  },
  {
    "imgUrl":
        "https://chikplaza.com/wp-content/uploads/2017/09/Mutton-Mix-Assorted-Curry-Cut_STP3627.jpg",
    "name": "Mutton"
  },
];

final List<Map<String, dynamic>> addressList = [
  {
    'userName': 'Rahul Doshi',
    'mobile': '02223007032',
    "pincode": "Pincode - 400011",
    'address':
        'Gala No 39 Opp.pragati Ind.est,deen Bldg Compound, Delisle Road, Jacob Circle, Mumbai, Maharashtra',
  },
  {
    'userName': 'Anand Pathak',
    'mobile': '952502346539',
    "pincode": "Pincode - 401202",
    'address':
        'Shp No 85, Dattatray Shp Ctr, Stn Rd, Nr Parvati Cinema, Vasai(w), Mumbai, Maharashtra',
  },
  {
    'userName': 'Naveen Kumar',
    'mobile': '02225331088',
    "pincode": "Pincode - 400606",
    'address':
        'A/9, Adarsh Estate, Pokh.rd.no.1,upvan, Jekegram, Mumbai, Maharashtra',
  },
];
final List<Map<String, dynamic>> subscriptionPlan = [
  {
    'title': 'Breakfast + Full Lunch + Full Dinner',
    'duration': 'Monthly',
    "orginal_price": "6000",
    "discount": "500",
    'discounted_price': '5500',
  },
  {
    'title': 'Breakfast + Full Lunch + Full Dinner',
    'duration': 'Quarterly',
    "orginal_price": "18000",
    "discount": "1800",
    'discounted_price': '16200',
  },
  {
    'title': 'Breakfast + Full Lunch + Full Dinner',
    'duration': 'Half Yearly',
    "orginal_price": "36000",
    "discount": "3600",
    'discounted_price': '32400',
  },
  {
    'title': 'Breakfast + Full Lunch + Full Dinner',
    'duration': 'Yearly',
    "orginal_price": "72000",
    "discount": "7200",
    'discounted_price': '64800',
  },
  {
    'title': 'Breakfast + Mini Lunch + mini Dinner',
    'duration': 'Monthly',
    "orginal_price": "4800",
    "discount": "300",
    'discounted_price': '4500',
  },
  {
    'title': 'Breakfast + Mini Lunch + mini Dinner',
    'duration': 'Quarterly',
    "orginal_price": "14400",
    "discount": "1440",
    'discounted_price': '12960',
  },
  {
    'title': 'Breakfast + Mini Lunch + mini Dinner',
    'duration': 'Half Yearly',
    "orginal_price": "28800",
    "discount": "2880",
    'discounted_price': '25920',
  },
  {
    'title': 'Breakfast + Mini Lunch + mini Dinner',
    'duration': 'Yearly',
    "orginal_price": "57600",
    "discount": "5760",
    'discounted_price': '51840',
  },
  {
    'title': 'Only Breakfast',
    'duration': 'Monthly',
    "orginal_price": "1200",
    "discount": "100",
    'discounted_price': '1100',
  },
  {
    'title': 'Only Breakfast',
    'duration': 'Quarterly',
    "orginal_price": "3600",
    "discount": "360",
    'discounted_price': '3240',
  },
  {
    'title': 'Only Breakfast',
    'duration': 'Half Yearly',
    "orginal_price": "7200",
    "discount": "720",
    'discounted_price': '6480',
  },
  {
    'title': 'Only Breakfast',
    'duration': 'Yearly',
    "orginal_price": "14400",
    "discount": "1440",
    'discounted_price': '12960',
  },
  {
    'title': 'Full Lunch or Dinner(Rice+Roti+Dal+2 Veg+achar Papad salad)',
    'duration': 'Monthly',
    "orginal_price": "2400",
    "discount": "200",
    'discounted_price': '2200',
  },
  {
    'title': 'Full Lunch or Dinner(Rice+Roti+Dal+2 Veg+achar Papad salad)',
    'duration': 'Quarterly',
    "orginal_price": "7200",
    "discount": "720",
    'discounted_price': '6480',
  },
  {
    'title': 'Full Lunch or Dinner(Rice+Roti+Dal+2 Veg+achar Papad salad)',
    'duration': 'Half Yearly',
    "orginal_price": "14400",
    "discount": "1440",
    'discounted_price': '12960',
  },
  {
    'title': 'Full Lunch or Dinner(Rice+Roti+Dal+2 Veg+achar Papad salad)',
    'duration': 'Yearly',
    "orginal_price": "28800",
    "discount": "2880",
    'discounted_price': '25920',
  },
  {
    'title':
        'Mini Lunch or Dinner(Rice or roti with Dal or curry or sabji(any 2)',
    'duration': 'Monthly',
    "orginal_price": "1800",
    "discount": "150",
    'discounted_price': '1650',
  },
  {
    'title':
        'Mini Lunch or Dinner(Rice or roti with Dal or curry or sabji(any 2)',
    'duration': 'Quarterly',
    "orginal_price": "5400",
    "discount": "540",
    'discounted_price': '4860',
  },
  {
    'title':
        'Mini Lunch or Dinner(Rice or roti with Dal or curry or sabji(any 2)',
    'duration': 'Half Yearly',
    "orginal_price": "10800",
    "discount": "1080",
    'discounted_price': '9720',
  },
  {
    'title':
        'Mini Lunch or Dinner(Rice or roti with Dal or curry or sabji(any 2)',
    'duration': 'Yearly',
    "orginal_price": "21600",
    "discount": "2160",
    'discounted_price': '19440',
  },
];
