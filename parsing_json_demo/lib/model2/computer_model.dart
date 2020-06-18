// 1.import 导入json_annotation.dart
import 'package:json_annotation/json_annotation.dart';

// 2.computer.g.dart 将在我们运行生成命令后json_serializable帮我们自动生成.g.dart文件，在未执行命令前该行可能会报错
part 'computer_model.g.dart';

// 3.这个标注告诉json_serializable哪一个类需要进行转换生成Model类
@JsonSerializable()
class Computer {
  String brand;
  double price;
  //4.必须的构造方法
  Computer(this.brand, this.price);
  //5.必须有的对应工厂构造器
  factory Computer.fromJson(Map<String, dynamic> json) => _$ComputerFromJson(json);
  Map<String, dynamic> toJson() => _$ComputerToJson(this);

  //这里 toString方法不是必须的, 只是用测试数据
  @override
  String toString() {
    return'Computer{brand: $brand, price: $price}';
  }
}
