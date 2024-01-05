import '../entities/category_member.dart';

class CategoryMembersResponse {

  final List<CategoryMember> query = [];

  const CategoryMembersResponse({
    this.query,
  });

  CategoryMembersResponse.fromJson(Map<String, dynamic> json) {
    return CategoryMembersResponse(
      query: json['query'] != null
      ? _fromJson(json['query'] as Map)
      : null
    );
  }

  List<CategoryMember> _fromJson(Map query) {
    return query['categorymembers'] != null
    ? query['categorymembers'].map(
      (item) => CategoryMember.fromJson(item)
    ).toList()
    : List.empty();
  }
}
