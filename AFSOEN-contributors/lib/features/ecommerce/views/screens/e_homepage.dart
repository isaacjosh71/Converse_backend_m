import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:flutter/material.dart';

class EHomeScreen extends StatelessWidget {
  static const routeName = '/e_home-screen';

  const EHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColor.greyColor,
                border: Border.all(color: AppColor.orangeColor),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.menu,
                size: 20,
                color: AppColor.orangeColor,
              ),
            ),
            const Text(
              'Hello Timothy',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSearchField(context),
              const SizedBox(height: 10),
              _buildBannerImage(context),
              const SizedBox(height: 10),
              _buildPopularDealsHeader(context),
              const SizedBox(height: 10),
              _buildGridView(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: deviceWidth(context) * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: 'Search..',
              hintStyle: const TextStyle(color: AppColor.whiteColor),
              filled: true,
              fillColor: AppColor.orangeColor.withOpacity(0.2),
              suffixIcon: IconButton(
                onPressed: () {
                  // Implement search functionality
                },
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.orangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              // Implement filter functionality
            },
            icon: const Icon(
              Icons.filter_list,
              color: AppColor.whiteColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBannerImage(BuildContext context) {
    return Image.asset(
      'assets/images/e_rec.png',
      fit: BoxFit.cover,
      width: deviceWidth(context) * 0.9,
    );
  }

  Widget _buildPopularDealsHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Popular Deals',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        IconButton(
          onPressed: () {
            // Implement navigate to popular deals functionality
          },
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Widget _buildGridView(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 1 / 2,
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return _buildProductContainer(context);
      },
    );
  }

  Widget _buildProductContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColor.orangeColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/product.png',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Africa T-Shirt',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColor.orangeColor,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Implement favorite functionality
                },
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '#10,0000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {
                  // Implement rating functionality
                },
                icon: const Icon(
                  Icons.star,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.orangeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    // Implement decrease quantity functionality
                  },
                  icon: const Icon(Icons.remove),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                '2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColor.lightOrange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    // Implement increase quantity functionality
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColor.orangeColor,
                width: 2,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColor.lightOrange,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
