abstract interface class IWishlistLocalDataSource {
  Future<List<String>> get();
  Future<void> add(String id);
  Future<void> delete(String id);
  Future<void> clear();
}
