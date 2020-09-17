import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cortex_earth_3/models/post.dart';
import 'package:cortex_earth_3/models/tag.dart';
import 'package:flutter/material.dart';

enum SlideDisplayType { TEXT, OBSERVATION, MIXED }

class SlideModel {
  SlideModel(this.text, this.observation, this.references, this.order,
      this.displayType, this.comments);

  final String text;
  final Widget observation;
  final String references;
  final int order;
  final SlideDisplayType displayType;
  final PostModel comments;
}

// Cascade of Slides. Cascade of Cascades.
