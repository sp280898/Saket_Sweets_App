import 'package:flutter/material.dart';
import 'package:saket_sweets_app/core/constent.dart';
import 'package:saket_sweets_app/widgets/appBarWidget.dart';

class SubscriptionPlan extends StatefulWidget {
  const SubscriptionPlan({Key? key}) : super(key: key);

  @override
  _SubscriptionPlanState createState() => _SubscriptionPlanState();
}

class _SubscriptionPlanState extends State<SubscriptionPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget('Subscription Plan'),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _itemPlan(subscriptionPlan[index], context);
        },
        itemCount: subscriptionPlan.length,
      ),
    );
  }

  Widget _itemPlan(
      Map<String, dynamic> _subscriptionPlan, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      // padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: Theme.of(context).primaryColor.withOpacity(0.1),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            // color: Theme.of(context).primaryColor.withOpacity(0.1),
            blurRadius: 1,
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              // color: Theme.of(context).primaryColor.withOpacity(0.3),
            ),
            child: Text(
              _subscriptionPlan['duration'],
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _subscriptionPlan['title'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    const Text(
                      'Orginal Price :',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '\u{20B9} ${_subscriptionPlan['orginal_price']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Text(
                      'Discount :',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '\u{20B9} ${_subscriptionPlan['discount']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: [
                    const Text(
                      'Price :',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      '\u{20B9} ${_subscriptionPlan['discounted_price']}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Subscribe Now',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
