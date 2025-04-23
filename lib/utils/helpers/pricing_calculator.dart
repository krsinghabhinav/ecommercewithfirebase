class CustomPriceCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  //---calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //---calculate tax
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //---logic to get tax rate for a location
    //---for simplicity, assume tax rate is 0.08 for all locations
    return 0.10;
  }

  static double getShippingCost(String location) {
    //---logic to get shipping cost for a location
    //---for simplicity, assume shipping cost is $5 for all locations
    return 5.0;
  }

  // static double getTaxRateForLocation(String location) {
  //   // Dummy implementation — you can customize this
  //   switch (location.toLowerCase()) {
  //     case 'delhi':
  //       return 0.18;
  //     case 'mumbai':
  //       return 0.20;
  //     case 'bangalore':
  //       return 0.15;
  //     default:
  //       return 0.10; // Default tax rate
  //   }
  // }

  // static double getShippingCost(String location) {
  //   // Dummy implementation — you can customize this too
  //   switch (location.toLowerCase()) {
  //     case 'delhi':
  //       return 50.0;
  //     case 'mumbai':
  //       return 60.0;
  //     case 'bangalore':
  //       return 40.0;
  //     default:
  //       return 70.0; // Default shipping cost
  //   }
  // }
}
