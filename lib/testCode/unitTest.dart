import 'package:news360/model/article_model.dart';

import 'package:news360/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'package:news360/home.dart';

void main(){
  test('Check the list is empty', (){
    CategoryNews categories = CategoryNews();
    expect(categories.category, <ArticleModel>[]);
  });

  test('One should be one', (){
    int expectedNumber = 1;

    expect(expectedNumber,1);
  });

}