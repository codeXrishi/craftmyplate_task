import 'package:get/get.dart';

class OrderController extends GetxController {
  // Observable variables for guest count and pricing logic
  var guests = 10.obs; // Default minimum value
  var pricePerPlate = 240.0.obs; // Default max price
  var subTotal = 2990.0.obs; // Calculated subtotal

  // Selected items (Item Selection Screen)
  var selectedItems = <String>[].obs;

  // Menu items categorized (Menu Selection Screen)
  var items = {
    'Starters': ['Idli Sambar', 'Appam'],
    'Mains': ['Dosa', 'Wada'],
    'Sweets': ['Payasam', 'Kesari Bath'],
  };

  // Add or remove selected items
  void toggleItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
  }

  // Update price based on the number of guests using linear decrement
  void updatePrice(int guestCount) {
    guests.value = guestCount;

    // Apply the linear decrement formula
    double minPrice = 189.0;
    double maxPrice = 299.0;
    int minGuests = 10;
    int maxGuests = 1500;

    // Calculate the new price
    double price = minPrice +
        ((maxPrice - minPrice) / (maxGuests - minGuests)) *
            (guestCount - minGuests);

    // Ensure that the price is clamped between min and max price
    price = price.clamp(minPrice, maxPrice);

    pricePerPlate.value = price;
  }
}
