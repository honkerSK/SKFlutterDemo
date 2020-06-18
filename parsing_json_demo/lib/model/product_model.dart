
class Product {
  final int id;
  final String name;
  final List<Image> images;

  Product({this.id, this.name, this.images});

  factory Product.fromJson(Map<String, dynamic> parsedJson){
    var list = parsedJson['images'] as List;
    print(list.runtimeType); //List<dynamic>
    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();
    //print(imagesList.runtimeType); // map操作后imagesList类型为 'MappedListIterable<dynamic, Image>
    //不转化为List<Image>就会报错: Unhandled Exception: type 'MappedListIterable<dynamic, Image>' is not a subtype of type 'List<Image>'

    return Product(
      id: parsedJson['id'],
      name: parsedJson['name'],
      images: imagesList
    );
  }
}

class Image {
  final int imageId;
  final String imageName;

  Image({this.imageId, this.imageName});

  factory Image.fromJson(Map<String, dynamic> parsedJson){
   return Image(
     imageId:parsedJson['id'],
     imageName:parsedJson['imageName']
   );
  }
}