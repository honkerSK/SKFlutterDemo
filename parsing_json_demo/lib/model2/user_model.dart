
// 1.import 导入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';
import 'computer_model.dart';

// 2.user.g.dart 将在我们运行生成命令后json_serializable帮我们自动生成.g.dart文件，在未执行命令前该行可能会报错
part 'user_model.g.dart';

// 3.这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class User {
  String name;
  int age;
  //显式关联JSON字段名与Model属性的对应关系,
  // 如下将属性registerDate和register_date字段关联
  @JsonKey(name: "register_date")
  String registerDate;
  List<String> courses;
  Computer computer;
  // 4.必须的构造方法
  User(this.name, this.age, this.registerDate, this.courses, this.computer);
  // 5.必须有的对应工厂构造器
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  //这里 toString方法不是必须的, 只是用测试数据
  @override
  String toString() {
    return'User{name: $name, age: ${age}, registerDate: $registerDate, courses: $courses, computer: $computer}';
  }
}