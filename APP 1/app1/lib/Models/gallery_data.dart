import 'package:flutter/material.dart';

class Galleryclass {
  Icon icon1;
  String title;
  Icon icon2;
  Galleryclass({
    @required this.icon1,
    @required this.title,
    @required this.icon2,
  });
}

List<Galleryclass> data = [
  Galleryclass(
    icon1: Icon(Icons.book),
    title: 'Books',
    icon2: Icon(Icons.file_download),
  ),
  Galleryclass(
    icon1: Icon(Icons.tab),
    title: 'Syllabus',
    icon2: Icon(Icons.file_download),
  ),
  Galleryclass(
    icon1: Icon(Icons.text_snippet),
    title: 'Paper',
    icon2: Icon(Icons.file_download),
  ),
  Galleryclass(
    icon1: Icon(Icons.playlist_add),
    title: 'Playlist',
    icon2: Icon(Icons.file_download),
  ),
];

List<Galleryclass> dfg() => data;
