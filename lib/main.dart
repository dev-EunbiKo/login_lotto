import 'package:flutter/material.dart';
import 'package:login_lotto/layout.dart';

void main() {
  runApp(const MyApp());
}

/*
  Collection 타입
  1. List 
    - 여러 개의 값들을 순서대로 저장
    - 중복 값 허용
    - similar as 배열(Array)
    - List<int> numbers = [1,2,3,4,5];
    - var fruits = ['apple', 'banana', 'cherry'];
    - fruits[0] = 'apple'
    
  2. Map
    - 키(key)와 값(value)으로 이뤄진 한 쌍의 데이터
    - 키는 고유한 값 
    - similar as 딕셔너리(Dictionary)
    - Map<String, int> studentScores = {'Alice' : 90, 'Bob' : 85};
    - var details = {'name' : 'Harrison Ford'};
    - details['name'] = 'Harrison Ford'

  3. Set
    - 중복을 허용하지 않음
    - Set<int> numbers = {1,2,3,4,5};

  
  ** Iterable 클래스 ** 
  책 참고 p.469 ~ p.471
 */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Layout());
  }
}
