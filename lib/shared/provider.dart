import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wallpaper_utility/core/local_data_source.dart';
import 'package:wallpaper_utility/repos/user_repo.dart';

final localDataProvider = Provider<LocalDataSource>((ref) =>
    LocalDataSourceImpl(sharedPreferences: ref.watch(sharedPreferences)));

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepositoryImpl(localDataSource: ref.watch(localDataProvider)));
final sharedPreferences =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
