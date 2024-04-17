import 'package:afsoen/core/utils/colors.dart';
import 'package:afsoen/features/chats/views/widgets/status.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  static const routeName = '/message';

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final List<Map<String, dynamic>> chatData = [
    {
      'imagePath': 'assets/images/male.png',
      'username': 'John Doe',
      'message': 'Lets get the bagg!',
      'timeAgo': '20 mins ago',
      'unreadCount': 3,
    },
    {
      'imagePath': 'assets/images/blogger.png',
      'username': 'Ashymz',
      'message': 'Oh shit,its Monday!!',
      'timeAgo': '20 mins ago',
      'unreadCount': 5,
    },
    {
      'imagePath': 'assets/images/musician.png',
      'username': 'Dev Dev',
      'message': 'Where you at?',
      'timeAgo': '1 hr ago',
      'unreadCount': 1,
    },
    {
      'imagePath': 'assets/images/female.png',
      'username': 'John Doe',
      'message': 'Hello, how are you?',
      'timeAgo': '20 mins ago',
      'unreadCount': 8,
    },
    {
      'imagePath': 'assets/images/dancer.png',
      'username': 'Ash Doe',
      'message': 'Hello, how are you?',
      'timeAgo': '30 mins ago',
      'unreadCount': 1,
    },
    {
      'imagePath': 'assets/images/reels-img.png',
      'username': 'John Doe',
      'message': 'Hello, how are you?',
      'timeAgo': '50 mins ago',
      'unreadCount': 1,
    },
    {
      'imagePath': 'assets/images/male.png',
      'username': 'Lol lmao',
      'message': 'Hello, how are you?',
      'timeAgo': '10 mins ago',
      'unreadCount': 3,
    },
    // Add more chat entries as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: FloatingActionButton(
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: AppColor.orangeColor,
            child: const CircleAvatar(backgroundColor: Colors.black, child: Icon(Icons.add, color: Colors.white)),
          ),
        ),
        appBar: AppBar(
          leading: const CircleAvatar(
            radius: 2,
            backgroundColor: Colors.transparent,
            child: Icon(Icons.arrow_back_ios_new, color: AppColor.orangeColor),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align elements to the start and end
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  Text(
                    'Messages',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              Icon(
                Icons.info_outline,
                color: AppColor.orangeColor,
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          // height: deviceHeight(context) * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const StatusSection(),
              const SizedBox(
                height: 5,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: chatData.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: AssetImage(chatData[index]['imagePath']),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      chatData[index]['username'],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      chatData[index]['message'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 60.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    chatData[index]['timeAgo'],
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                      vertical: 4.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Text(
                                      chatData[index]['unreadCount'].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Divider(
                          thickness: 0.1,
                          color: Colors.white70,
                        ), // Add a Divider
                      ],
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Chip(
                      backgroundColor: const Color.fromARGB(210, 131, 90, 8),
                      side: BorderSide.none,
                      label: const Text('Friends Status', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
