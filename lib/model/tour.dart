
class Tour {

  final String id; // use a UUID?
  final String description; // how to make this optional?
  final String pickup; // could use e.g. type Location instead of just a String
  final String dropoff;
  final String date; // is there a Date type in dart / flutter?

  Tour(this.id, this.description, this.pickup, this.dropoff, this.date);
}
