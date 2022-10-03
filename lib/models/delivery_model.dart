class DeliveryModel {
  final String orderid;
  final String description;
  final String dateoforder;

  DeliveryModel({
    required this.orderid,
    required this.description,
    required this.dateoforder,
  });
}

List<DeliveryModel> deliveryModel = [
  DeliveryModel(
    orderid: "12345",
    description: "2nd Street,678 muscat street",
    dateoforder: '12/02/2022',
  ),
  DeliveryModel(
    orderid: "324512",
    description: "2nd Street,678 muscat street",
    dateoforder: '18/08/2022',
  ),
  DeliveryModel(
    orderid: "76732",
    description: "2nd Street,678 muscat street",
    dateoforder: '23/04/2022',
  ),
  DeliveryModel(
    orderid: "987387",
    description: "2nd Street",
    dateoforder: '12/02/2022',
  ),
];
