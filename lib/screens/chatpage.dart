import 'package:chat_app/models/messagemodel.dart';
import 'package:chat_app/widgets/chatbubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';
class chatpage extends StatelessWidget {
  const chatpage({super.key});
  static String id = "chatpage";

  @override
  Widget build(BuildContext context) {
    CollectionReference addmessages = FirebaseFirestore.instance.collection(kmessages);
    final Stream<QuerySnapshot> messagesstream = FirebaseFirestore.instance.collection(kmessages).orderBy("date", descending: false).snapshots();
    List<Messages> messagelist = [];
    ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/scholar.png"), height: 60,),
            Text("Chat"),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: messagesstream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            // Clear the list before populating it with messages from the new snapshot
            messagelist.clear();

            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagelist.add(Messages.fromjson(snapshot.data!.docs[i]));
            }
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            });

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return chatbubble(message: messagelist[index]);
                    },
                  ),
                ),
                MessageBar(
                  onSend: (data) {
                    addmessages.add({
                      'message': data,
                      'date': DateTime.now(),
                      //'id': id
                    });
                  },
                  actions: [
                    InkWell(
                      child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 24,
                      ),
                      onTap: () {},
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: InkWell(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.green,
                          size: 24,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Text("Loading data...");
          }
        },
      ),
    );
  }
}
