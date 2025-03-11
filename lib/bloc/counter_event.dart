abstract class CounterEvent {}

class Increment extends CounterEvent {
  int count;
  Increment({required this.count});

}

class Decrement extends CounterEvent {
  int count;
  Decrement({required this.count});

}
