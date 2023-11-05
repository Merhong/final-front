import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// 1. 창고 데이터
class SearchKeyword {
  final secureStorage = FlutterSecureStorage();

  SearchKeyword();

  // 검색어 삭제
  Future<void> removeSearchKeyword(List<String> keywords) async {
    final savedKeywords = await loadSearchKeywords() ?? [];

    savedKeywords.removeWhere((keyword) => keywords.contains(keyword));

    final serializedKeywords = jsonEncode(savedKeywords);
    await secureStorage.write(key: 'searchKeywords', value: serializedKeywords);
  }

  // 검색어 목록을 저장
  Future<void> saveSearchKeywords(String keyword) async {
    final savedKeywords = await loadSearchKeywords() ?? [];

    savedKeywords.removeWhere((e) => keyword.contains(e));
    savedKeywords.add(keyword);

    while (savedKeywords.length > 10) {
      savedKeywords.removeAt(0);
    }

    final serializedKeywords = jsonEncode(savedKeywords);
    await secureStorage.write(key: 'searchKeywords', value: serializedKeywords);
  }

  // 검색어 목록을 로드
  Future<List<String>?> loadSearchKeywords() async {
    final serializedKeywords = await secureStorage.read(key: 'searchKeywords');
    if (serializedKeywords != null) {
      List<String> list = List<String>.from(jsonDecode(serializedKeywords));
      return list;
    } else {
      return null;
    }
  }
}

// 3. 창고 관리자
final searchKeywordProvider = Provider<SearchKeyword>((ref) {
  return SearchKeyword();
});
