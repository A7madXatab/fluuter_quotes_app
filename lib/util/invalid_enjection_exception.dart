class InvalidDataInjection implements Exception {  
  final String message;
  InvalidDataInjection(this.message);

  @override
  String toString() {

    return this.message;
  }
}