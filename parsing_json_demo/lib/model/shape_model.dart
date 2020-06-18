
class Shape{
  String shapeName;
  Property property;

  Shape({
    this.shapeName,
    this.property
  });

  factory Shape.fromJson(Map<String, dynamic> parsedJson){
    return Shape(
      shapeName: parsedJson['shape_name'],
      property: Property.fromJson(parsedJson['property'])
    );
  }
}

class Property{
  double width;
  double height;

  Property({
    this.width,
    this.height
  });

  factory Property.fromJson(Map<String, dynamic> json){
    return Property(
      width: json['width'],
      height: json['height']
    );
  }
}