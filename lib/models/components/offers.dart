class Offer {
  String id;
  double totalCost;
  String companyID;
  String name;
  String companyType;
  DateTime dateFrom, dateTo;
  String description, offerPath;
  double discount;
  bool favorite;
  List<String> images;

  Offer({
    required this.id,
    required this.name,
    required this.dateTo,
    required this.dateFrom,
    required this.description,
    required this.companyID,
    required this.companyType,
    required this.discount,
    required this.offerPath,
    required this.images,
    required this.totalCost,
    this.favorite = false,
  });


  void switchFavorite({bool? newVal}){
    if(newVal != null) {
      favorite = newVal;
    }else{
      favorite  = !favorite;
    }
  }


  factory Offer.fromJson(Map json){
    return Offer(
        id: json['id'],
        name: json['name'],
        dateTo: DateTime.parse(json['date_to']),
        dateFrom: DateTime.parse(json['date_from']),
        description: json['description'],
        companyID: json['company_id'],
        companyType: json['company_type'],
        discount: json['discount'],
        offerPath: json['offer_path'],
        totalCost: convertToDouble(json['total_cost']),
        images:convertToListOfString(json['images']));
  }

static double convertToDouble(var n){
    if(n is int){
      return n.toDouble();
    }else if (n is double){
      return n;
    }else if(n is num){
      return n.toDouble();
    }else if(n is String){
      return double.tryParse(n)??0.0;
    }else {
      return 0;
    }

}


  static List<String> convertToListOfString(List ls){
    List<String> res=[];
    for(var v in ls){
      if(v is String){
        res.add(v);
      }else{
       res.add(v.toString());
      }
    }
    return res;
  }

  Map toJson(){
    return {
      'date_to':dateTo.toIso8601String(),
      'date_from':dateFrom.toIso8601String(),
      'description':description,
      'company_id':companyID,
      "company_type":companyType,
      'discount':discount,
      'offer_path':offerPath,
      'images':images,
      'name':name,
    };
  }

  double calculatePriceAfterDiscount()=>totalCost*discount/100;

}
