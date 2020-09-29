import 'package:news360/model/article_model.dart';

import 'file:///C:/Users/USER/Desktop/470/Project/News360.-master/lib/controller/category.dart';
import 'package:flutter_test/flutter_test.dart';
import 'dart:ui';
import 'file:///C:/Users/USER/Desktop/470/Project/News360.-master/lib/view/home.dart';

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