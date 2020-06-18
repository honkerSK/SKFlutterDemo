class Address {
  final String city;
  final List<String> streets;

  Address({
    this.city,
    this.streets
  });

  factory Address.fromJson(Map<String, dynamic> parsedJson) {
    var streetsFromJson  = parsedJson['streets'];
    print(streetsFromJson.runtimeType); //List<dynamic>
    // 显式地转换成 List<String>
    // List<String> streetsList = new List<String>.from(streetsFromJson);
    // cast() 查看List中的数据类型是不是都是指定的数据类型，如果发现List中存在不是<>中指定的数据类型就会报错
    List<String> streetsList = streetsFromJson.cast<String>();

    return new Address(
      city: parsedJson['city'],
      streets: streetsList,
    );
  }
}