import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DocumentModel {
  final int? id;
  final String? name;
  final String? category;
  final String? path;
  final String? createdAt;
  DocumentModel({
    this.id,
    this.name,
    this.category,
    this.path,
    this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'path': path,
      'createdAt': createdAt,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      category: map['category'] != null ? map['category'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentModel.fromJson(String source) =>
      DocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
