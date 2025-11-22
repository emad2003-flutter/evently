class Event {
  static const String collectionName = "events";
  String id;
  String title;
  String description;
  DateTime date;
  bool isFavorite;
  String image;
  String eventName;
  String time;

  Event({
    this.id = "",
    required this.title,
    required this.date,
    required this.description,
    this.isFavorite = false,
    required this.image,
    required this.eventName,
    required this.time,
  });

  // Convert Event object to Map for Firestore
  Map<String, dynamic> objectToJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'isFavorite': isFavorite,
      'image': image,
      'eventName': eventName,
      'time': time,
    };
  }

  // convert Map from Firestore to Event object

  Event.fromFirStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        date: DateTime.fromMillisecondsSinceEpoch(data['date']),
        isFavorite: data['isFavorite'],
        image: data['image'],
        eventName: data['eventName'],
        time: data['time'],
      );
}
