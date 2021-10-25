class Product {
  int productID;
  String productName;
  String productImage;
  String productPrice;
  int categoryID;
  int manufacturerID;

  Product(
      {required this.productID,
      required this.productName,
      required this.productImage,
      required this.productPrice,
      required this.categoryID,
      required this.manufacturerID,});
}
