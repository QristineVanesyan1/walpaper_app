import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_utility/models/wallpaper_item/wallpaper_item.dart';
import '../configs/configs.dart';

abstract class LocalDataSource {
  Future<List<String>> getFavLinkList();
  Future<void> addFavLink(String link);
  Future<void> removeFavLink(String link);

  Future<void> clearAllData();
  Future<List<String>> getAllWallpapers(String category);
}

class LocalDataSourceImpl extends LocalDataSource {
  LocalDataSourceImpl({required this.sharedPreferences});
  SharedPreferences sharedPreferences;

  @override
  Future<void> clearAllData() async {
    await sharedPreferences.clear();
  }

  @override
  Future<List<String>> getAllWallpapers(String category) async {
    List<String>? linksByCategory = sharedPreferences.getStringList(category);
    if (linksByCategory == null) {
      String dataStr = await rootBundle.loadString(Assets.info);
      List<dynamic> dataList = jsonDecode(dataStr);
      List<WallpaperItem> wallpapers =
          dataList.map((e) => WallpaperItem.fromJson(e)).toList();

      for (var i = 0; i < wallpapers.length; i++) {
        await sharedPreferences.setStringList(
            wallpapers[i].category, wallpapers[i].links);
      }
      return sharedPreferences.getStringList(category) ?? [];
    } else {
      return linksByCategory;
    }
  }

  @override
  Future<void> addFavLink(String link) async {
    List<String> list = sharedPreferences.getStringList(AppConsts.fav) ?? [];
    if (!list.contains(link)) {
      list.add(link);
    }
    await sharedPreferences.setStringList(AppConsts.fav, list);
  }

  @override
  Future<List<String>> getFavLinkList() async {
    return sharedPreferences.getStringList(AppConsts.fav) ?? [];
  }

  @override
  Future<void> removeFavLink(String link) async {
    List<String> list = sharedPreferences.getStringList(AppConsts.fav) ?? [];
    if (list.contains(link)) {
      list.remove(link);
    }
    await sharedPreferences.setStringList(AppConsts.fav, list);
  }
}
