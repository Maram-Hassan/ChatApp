import 'package:cloud_firestore/cloud_firestore.dart';

class Messages{
  final String message;
  final Timestamp date;
  //final String id;

  Messages(this.message, this.date);
  factory Messages.fromjson(jsondata){
          return Messages(jsondata['message'],jsondata['date']);
  }
}