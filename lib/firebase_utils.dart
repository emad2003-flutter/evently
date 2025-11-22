import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/Models/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFirStore(snapshot.data()!),
          toFirestore: (event, options) => event.objectToJson(),
        );
  }

  static Future<void> addEventToFirestore(Event event) {
    // Implementation for adding an event to Firebase
    var eventCollection = getEventCollection();
    DocumentReference<Event> docRef = eventCollection.doc();
    event.id = docRef.id; // Set the document ID as the event ID
    return docRef.set(event);
  }
}
