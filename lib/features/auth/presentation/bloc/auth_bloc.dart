// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gulf_catalog_app/common/cubits/app_user/app_user_cubit.dart';
import 'package:gulf_catalog_app/common/entities/user_entity.dart';
import 'package:gulf_catalog_app/core/error/failure.dart';
import 'package:gulf_catalog_app/features/auth/domain/usecases/current_user.dart';
import 'package:gulf_catalog_app/features/auth/domain/usecases/user_sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignInAnon _userSignInAnon;
  final CurrentUser _currentUser;
  final AppUserCubit _appUserCubit;
  AuthBloc({
    required UserSignInAnon userSignInAnon,
    required CurrentUser currentUser,
    required AppUserCubit appUserCubit,
  })  : _userSignInAnon = userSignInAnon,
        _currentUser = currentUser,
        _appUserCubit = appUserCubit,
        super(AuthInitial()) {
    on<AuthEvent>((_, emit) => emit(AuthLoading()));
    on<AuthSignIn>(_onSignIn);
    on<AuthIsUserLoggedIn>(_onIsUserLoggedIn);
  }

  void _onSignIn(AuthSignIn event, Emitter<AuthState> emit) async {
    final res = await _userSignInAnon();
    res.fold(
      (failure) => _emitAuthFailure(failure, emit),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _onIsUserLoggedIn(
      AuthIsUserLoggedIn event, Emitter<AuthState> emit) async {
    final res = await _currentUser();
    res.fold(
      (failure) => _emitAuthFailure(failure, emit),
      (user) => _emitAuthSuccess(user, emit),
    );
  }

  void _emitAuthSuccess(User user, Emitter<AuthState> emit) {
    emit(AuthSuccess(user));
    _appUserCubit.updateUser(user);
  }

  void _emitAuthFailure(Failure failure, Emitter<AuthState> emit) {
    emit(AuthFailure(failure.message));
    _appUserCubit.updateUser(null);
  }
}
