import 'package:wallpaper_utility/core/local_data_source.dart';

abstract class UserRepository {
  Future<List<String>> getFavLinkList();
  Future<void> addFavLink(String link);
  Future<void> removeFavLink(String link);
  Future<void> clearAllData();
  Future<List<String>> getWallpapersByCategory(String category);
}

class UserRepositoryImpl extends UserRepository {
  UserRepositoryImpl({required this.localDataSource});
  final LocalDataSource localDataSource;

  @override
  Future<void> clearAllData() async {
    await localDataSource.clearAllData();
  }

  @override
  Future<List<String>> getWallpapersByCategory(String category) async {
    return await localDataSource.getAllWallpapers(category);
  }

  @override
  Future<void> addFavLink(String link) async {
    await localDataSource.addFavLink(link);
  }

  @override
  Future<List<String>> getFavLinkList() async {
    return await localDataSource.getFavLinkList();
  }

  @override
  Future<void> removeFavLink(String link) async {
    await localDataSource.removeFavLink(link);
  }
}
