import 'dart:convert';
import 'package:flutter/material.dart';

class popbook{
  int id;
  String book_content;
  String title;
  String description;
  String created_at;
  String img;
  String author;

  popbook(String img,int id, String book_content, String title, String description, String created_at, String author){
    this.id=id;
    this.book_content=book_content;
    this.description=description;
    this.title=title;
    this.created_at=created_at;
    this.img=img;
    this.author=author;
  }

  popbook.fromJson(Map json)
          :id=json['id'],
          author=json['author'],
          book_content=json['book_content'],
          description=json['description'],
          title=json['title'],
          created_at=json['created_at'],
          img=json['img'];
  Map toJson(){
    return {
      'id':id,
      'book_content':book_content,
      'title':title,
      'description':description,
      'created_at':created_at,
      'img':img,
      'author':author,
    };
  }

}