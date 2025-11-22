import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Models/event.dart';
import 'package:evently/Utils/toast_utils.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class EventListProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filteredEventList = [];
  int selectedIndex = 0;
  List<String> categories = [];
  List<Event> favoriteEventList = [];

  // Fetch all events from Firestore
  void getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection().get();
    eventList = querySnapshot.docs.map((doc) => doc.data()).toList();

    notifyListeners();
  }

  // Set selected index and filter events accordingly
  void setSelectedIndex(int index) {
    selectedIndex = index;
    filterEvents();
    notifyListeners();
  }

  // Get localized event list names
  List<String> getEventListNames(BuildContext context) {
    return categories = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.eating,
    ];
  }

  // Filter events based on selected category
  void filterEvents() {
    if (selectedIndex == 0) {
      filteredEventList = eventList;
    } else {
      filteredEventList = eventList.where((event) {
        return event.eventName == categories[selectedIndex];
      }).toList();
    }
    // Sort events by date
    filteredEventList.sort((event1, event2) {
      return event1.date.compareTo(event2.date);
    });
    notifyListeners();
  }

  // Update the favorite status of an event
  void updateIsFavorite(Event event) {
    FirebaseUtils.getEventCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isFavorite})
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            print("Favorite updated successfully");
          },
        );
    CustomToast.showToast(message: "Favorite updated successfully");
    notifyListeners();
  }

  // Fetch favorite events
  void getFavoriteEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseUtils.getEventCollection()
            .where('isFavorite', isEqualTo: true)
            .get();
    favoriteEventList = querySnapshot.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }
}
