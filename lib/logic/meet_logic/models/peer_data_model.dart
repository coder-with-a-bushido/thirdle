// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:thirdle/logic/game_logic/models/word_model.dart';

class PeerData {
  List<Word> wordList;
  int guessNo;
  bool isWin;

  PeerData({
    required this.wordList,
    required this.guessNo,
    required this.isWin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wordList': wordList.map((x) => x.toMap()).toList(),
      'guessNo': guessNo,
      'isWin': isWin,
    };
  }

  factory PeerData.fromMap(Map<String, dynamic> map) {
    return PeerData(
      wordList: List<Word>.from(
        (map['wordList'] as List<dynamic>).map<Word>(
          (x) => Word.fromMap(x as Map<String, dynamic>),
        ),
      ),
      guessNo: map['guessNo'] as int,
      isWin: map['isWin'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory PeerData.fromJson(String source) =>
      PeerData.fromMap(json.decode(source) as Map<String, dynamic>);
}
