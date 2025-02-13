import 'package:e_commerce/data/model/CategoryOrBrandResponseDM.dart';
import 'package:e_commerce/domain/entities/ProductsResponseEntity.dart';

class ProductsResponseDm extends ProductsResponseEntity{
  ProductsResponseDm({
    super.results,
    super.metadata,
    super.data,
    this.message,
    this.statusMsg});

  ProductsResponseDm.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata = json['metadata'] != null ? ProductMetadataDM.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductDM.fromJson(v));
      });
    }
  }
  String? message;
  String? statusMsg;

}

class ProductDM extends ProductEntity {
  ProductDM({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,});

  ProductDM.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDM.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    id = json['_id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryOrBrandDM.fromJson(json['category']) : null;
    brand = json['brand'] != null ? CategoryOrBrandDM.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }

}


class SubcategoryDM extends SubcategoryEntity{
  SubcategoryDM({
      super.id,
      super.name,
      super.slug,
      super.category,});

  SubcategoryDM.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }


}

class ProductMetadataDM extends ProductMetadataEntity{
  ProductMetadataDM({
      super.currentPage,
      super.numberOfPages,
      super.limit,
      super.nextPage,});

  ProductMetadataDM.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

}