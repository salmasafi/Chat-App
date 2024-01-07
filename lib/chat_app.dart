// ignore_for_file: prefer ructors, prefer ructors_in_immutables, non ant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, non_constant_identifier_names, unused_import, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:shared_ref/data.dart';

import 'login.dart';
import 'widgets.dart';

class ChatApp extends StatefulWidget {
  ChatApp({super.key});

  @override
  State<ChatApp> createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage('images/avatar5.webp'),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 230, 230, 230),
              child: Icon(
                Icons.camera_alt,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              radius: 25,
              backgroundColor: Color.fromARGB(255, 230, 230, 230),
              child: Icon(
                Icons.edit,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(end: 12),
            child: IconButton(
              onPressed: () {
                setState(() {
                  saveUserLoggedIn(false);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  },),);
                });
              },
              icon: CircleAvatar(
                radius: 25,
                backgroundColor: Color.fromARGB(255, 230, 230, 230),
                child: Icon(
                  Icons.exit_to_app,
                  size: 25,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color.fromARGB(255, 230, 230, 230),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 100,
                
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return StoryItem(friend: Friend.friends[index],);
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 15,
                    );
                  },
                  itemCount: numOfFriends,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ChatItem(friend: Friend.friends[index],);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: numOfFriends,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
