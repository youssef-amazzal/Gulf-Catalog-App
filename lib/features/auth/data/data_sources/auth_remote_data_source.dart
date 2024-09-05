import 'package:gulf_catalog_app/core/error/exceptions.dart';
import 'package:gulf_catalog_app/features/auth/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  Session? get currenUserSession;
  Future<UserModel> signInAnonymously();
  Future<UserModel> getCurrentUserData();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl({required SupabaseClient client})
      : supabaseClient = client;

  @override
  Session? get currenUserSession => supabaseClient.auth.currentSession;

  @override
  Future<UserModel> signInAnonymously() async {
    try {
      final response = await supabaseClient.auth.signInAnonymously();
      if (response.user == null) {
        throw ServerException(message: "User is null.");
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getCurrentUserData() async {
    try {
      if (currenUserSession == null) {
        throw ServerException(message: "No active session has been found.");
      }
      final user = currenUserSession!.user;
      return UserModel.fromJson(user.toJson());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
