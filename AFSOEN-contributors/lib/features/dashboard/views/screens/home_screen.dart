import 'package:afsoen/features/dashboard/views/widgets/feed_card.dart';
import 'package:afsoen/features/dashboard/views/widgets/story_eclipse.dart';
import 'package:afsoen/core/utils/utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

import '../../../../features/notifications/views/screens/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ExtendedImage.asset(
          'assets/images/logo.png',
          height: deviceHeight(context) * 0.02,
          width: 8,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Badge(
              label: const Text('20'),
              child: ExtendedImage.asset(
                'assets/images/chats.png',
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ExtendedImage.asset(
              'assets/images/reels.png',
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NotificationScreen();
              }));
            },
            icon: Badge(
              label: const Text('10'),
              child: ExtendedImage.asset(
                'assets/images/reels.png',
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: deviceHeight(context) * .02,
            ),
            searchBar(context),
            SizedBox(
              height: deviceHeight(context) * .02,
            ),
            story(context),
            feeds(context),
          ],
        ),
      ),
    );
  }

  Padding feeds(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth(context) * 0.03,
      ),
      child: Column(
        children: List.generate(
          dataList.length,
          (index) => FeedCard(
            data: dataList[index],
          ),
        ),
      ),
    );
  }

  SizedBox searchBar(BuildContext context) {
    return SizedBox(
      width: deviceWidth(context) * 0.9,
      height: deviceHeight(context) * 0.06,
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: deviceHeight(context) * .009),
          hintText: 'Search creator',
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          prefixIcon: ExtendedImage.asset('assets/images/emoji.png'),
          fillColor: Theme.of(context).highlightColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
              color: Theme.of(context).canvasColor,
              width: 5,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox story(BuildContext context) {
    return SizedBox(
      height: deviceHeight(context) * .14,
      width: deviceWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              height: deviceHeight(context) * .02,
            ),
            SizedBox(
              width: deviceWidth(context) * .02,
            ),
            postStoryEclipse(context, dataList[0]['profile image']),
            Row(
              children: List.generate(
                dataList.length,
                (index) => StoryEclipse(
                  firstName: dataList[index]['first name'],
                  imgUrl: dataList[index]['profile image'],
                ),
              ),
            ),
            SizedBox(
              width: deviceWidth(context) * .02,
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, dynamic>> dataList = [
    {
      'first name': 'John',
      'last name': 'Doe',
      'location': 'New York',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
    },
    {
      'first name': 'Jane',
      'last name': 'Smith',
      'location': 'Los Angeles',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog': 'Nulla eget est sed est varius auctor id a nisl.'
    },
    {
      'first name': 'Mike',
      'last name': 'Johnson',
      'location': 'Chicago',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog':
          'Praesent gravida efficitur felis, ut cursus justo interdum et.'
    },
    {
      'first name': 'Alex',
      'last name': 'Williams',
      'location': 'Miami',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog':
          'Sed euismod, est a convallis venenatis, libero orci iaculis nunc.'
    },
    {
      'first name': 'Emily',
      'last name': 'Johnson',
      'location': 'San Francisco',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog': 'Vivamus nec nulla vel augue aliquet feugiat et vitae elit.'
    },
    {
      'first name': 'David',
      'last name': 'Brown',
      'location': 'Boston',
      'profile image':
          'https://images.unsplash.com/photo-1609316696815-29de8998f96a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJpa2VzfGVufDB8fDB8fHww',
      'short blog':
          'Fusce auctor est id purus iaculis, eget hendrerit enim luctus.'
    },
    // Add more entries as needed
  ];
}
