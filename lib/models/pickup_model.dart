class DeliveryBoyModel {
  final String customername;
  final String userid;
  final String distance;

  DeliveryBoyModel({
    required this.customername,
    required this.userid,
    required this.distance,
  });
}

List<DeliveryBoyModel> deliveryBoyModel = [
  DeliveryBoyModel(
    customername: "John Doe",
    userid: "#123456",
    distance: '2.2 Km',
  ),
  DeliveryBoyModel(
    customername: "Sajin",
    userid: "#123456",
    distance: '3.2 Km',
  ),
  DeliveryBoyModel(
    customername: "Varghese",
    userid: "#123456",
    distance: '1.2 Km',
  ),
  DeliveryBoyModel(
    customername: "Don",
    userid: "#123456",
    distance: '4.2 Km',
  ),
  DeliveryBoyModel(
    customername: "Vincy",
    userid: "#123456",
    distance: '2.2 Km',
  ),
];
