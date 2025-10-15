class MyDuration {
  final int _milliseconds;

  //private constructor
  MyDuration._(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception('Duration cannot be negtive');
    }
  }

  //name constructor
  MyDuration.fromHours(int hours) 
  : this._(hours * 60 * 60 * 1000);

  MyDuration.fromMinutes(int minutes)
  : this._(minutes *60 * 1000);

  MyDuration.fromSeconds(int seconds)
  : this._(seconds*1000);

  //Overloaded Operators
  bool operator > (MyDuration other){
    return _milliseconds > other._milliseconds;
  }
  MyDuration operator + (MyDuration other){
    return MyDuration._(_milliseconds + other._milliseconds);
  }
  MyDuration operator - (MyDuration other){
    if(_milliseconds < other._milliseconds){
      throw Exception('cannot subtract larger duration from smaller one');

    }
    return MyDuration._(_milliseconds - other._milliseconds);
  }

    // Display the duration in a readable format
    @override
    String toString() {
      int seconds = (_milliseconds / 1000).round();
      int minutes = (seconds / 60).floor();
      seconds = seconds % 60;
      int hours = (minutes / 60).floor();
      minutes = minutes % 60;
      return '$hours hours, $minutes minutes, $seconds seconds';
    }
  }

  void main() {
    MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
    MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
    print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
    print(duration1>duration2); //true

    try {
      print(duration2 - duration1); // This will throw an exception
    } catch (e) {
      print(e);
    }
}
