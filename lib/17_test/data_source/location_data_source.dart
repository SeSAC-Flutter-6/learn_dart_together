abstract interface class LocationDataSource {
  Future<(num, num)> getCurrentLocation();
}