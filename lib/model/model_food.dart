import 'dart:convert';
/// data : [{"id":"001","name":"Margherita Pizza","description":"Classic wood-fired pizza with fresh mozzarella, basil, and tomatoes.","price":8.99,"category":"Pizza","availability":true,"image_url":"https://example.com/images/margherita_pizza.jpg"},{"id":"002","name":"Spaghetti Carbonara","description":"Creamy spaghetti tossed with pancetta, egg, and Parmesan.","price":10.50,"category":"Pasta","availability":true,"image_url":"https://example.com/images/carbonara.jpg"},{"id":"003","name":"Chicken Tikka Masala","description":"Grilled chicken in spiced tomato and cream sauce served with rice.","price":11.00,"category":"Indian","availability":true,"image_url":"https://example.com/images/tikka_masala.jpg"},{"id":"004","name":"Caesar Salad","description":"Crisp romaine lettuce, Parmesan, and croutons with Caesar dressing.","price":6.75,"category":"Salads","availability":true,"image_url":"https://example.com/images/caesar_salad.jpg"},{"id":"005","name":"Veggie Burger","description":"Grilled veggie patty with lettuce, tomato, and avocado on a toasted bun.","price":9.25,"category":"Burgers","availability":true,"image_url":"https://example.com/images/veggie_burger.jpg"},{"id":"006","name":"Sushi Platter","description":"Assorted nigiri and rolls served with soy sauce and wasabi.","price":14.00,"category":"Japanese","availability":true,"image_url":"https://example.com/images/sushi_platter.jpg"},{"id":"007","name":"Butter Naan","description":"Soft Indian flatbread brushed with butter, perfect with curries.","price":2.99,"category":"Indian","availability":true,"image_url":"https://example.com/images/butter_naan.jpg"},{"id":"008","name":"Grilled Salmon","description":"Tender salmon fillet grilled to perfection with lemon-dill sauce.","price":13.50,"category":"Seafood","availability":true,"image_url":"https://example.com/images/grilled_salmon.jpg"},{"id":"009","name":"Pad Thai","description":"Stir-fried rice noodles with tofu, peanuts, egg, and tamarind sauce.","price":9.75,"category":"Thai","availability":true,"image_url":"https://example.com/images/pad_thai.jpg"},{"id":"010","name":"Beef Tacos","description":"Three corn tortillas filled with seasoned beef, lettuce, and cheese.","price":8.25,"category":"Mexican","availability":true,"image_url":"https://example.com/images/beef_tacos.jpg"},{"id":"011","name":"Falafel Wrap","description":"Chickpea falafel with tahini sauce and fresh veggies in pita bread.","price":7.95,"category":"Middle Eastern","availability":true,"image_url":"https://example.com/images/falafel_wrap.jpg"},{"id":"012","name":"French Fries","description":"Crispy golden fries served with ketchup or aioli.","price":3.50,"category":"Sides","availability":true,"image_url":"https://example.com/images/french_fries.jpg"},{"id":"013","name":"Greek Yogurt Parfait","description":"Layers of yogurt, granola, and berries served in a glass.","price":4.99,"category":"Desserts","availability":true,"image_url":"https://example.com/images/parfait.jpg"},{"id":"014","name":"Lemon Iced Tea","description":"Refreshing chilled tea with a splash of lemon.","price":2.50,"category":"Beverages","availability":true,"image_url":"https://example.com/images/lemon_iced_tea.jpg"},{"id":"015","name":"Mango Lassi","description":"Creamy Indian yogurt drink blended with ripe mangoes.","price":3.75,"category":"Beverages","availability":true,"image_url":"https://example.com/images/mango_lassi.jpg"}]

ModelFood modelFoodFromJson(String str) => ModelFood.fromJson(json.decode(str));
String modelFoodToJson(ModelFood data) => json.encode(data.toJson());
class ModelFood {
  ModelFood({
      List<Data>? data,}){
    _data = data;
}

  ModelFood.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  List<Data>? _data;
ModelFood copyWith({  List<Data>? data,
}) => ModelFood(  data: data ?? _data,
);
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "001"
/// name : "Margherita Pizza"
/// description : "Classic wood-fired pizza with fresh mozzarella, basil, and tomatoes."
/// price : 8.99
/// category : "Pizza"
/// availability : true
/// image_url : "https://example.com/images/margherita_pizza.jpg"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? id, 
      String? name, 
      String? description, 
      num? price, 
      String? category, 
      bool? availability, 
      String? imageUrl,}){
    _id = id;
    _name = name;
    _description = description;
    _price = price;
    _category = category;
    _availability = availability;
    _imageUrl = imageUrl;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _category = json['category'];
    _availability = json['availability'];
    _imageUrl = json['image_url'];
  }
  String? _id;
  String? _name;
  String? _description;
  num? _price;
  String? _category;
  bool? _availability;
  String? _imageUrl;
Data copyWith({  String? id,
  String? name,
  String? description,
  num? price,
  String? category,
  bool? availability,
  String? imageUrl,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  price: price ?? _price,
  category: category ?? _category,
  availability: availability ?? _availability,
  imageUrl: imageUrl ?? _imageUrl,
);
  String? get id => _id;
  String? get name => _name;
  String? get description => _description;
  num? get price => _price;
  String? get category => _category;
  bool? get availability => _availability;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['category'] = _category;
    map['availability'] = _availability;
    map['image_url'] = _imageUrl;
    return map;
  }

}