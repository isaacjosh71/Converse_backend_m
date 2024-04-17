import 'dart:async';

import 'package:afsoen/features/auth/provider/setup_user_info_provider.dart';
import 'package:afsoen/features/auth/repo/auth_repo.dart';
import 'package:afsoen/features/auth/enum/gender.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/user_model.dart';

final authProvider = AsyncNotifierProvider(AuthProvider.new);

class AuthProvider extends AsyncNotifier<dynamic> {
  late final _repo = ref.watch(authRepo);

  @override
  FutureOr<void> build() {}

  Future<void> register({required String email, required String phone, required String password}) async {
    state = const AsyncLoading();

    ref.read(setUpUserProvider)?.email = email;
    ref.read(setUpUserProvider)?.phoneNumber = phone;

    final result = await AsyncValue.guard(() => _repo.register(email: email, phone: phone, password: password));

    result.whenData((credentials) {
      ref.read(setUpUserProvider)?.email = credentials.user!.email!;
      ref.read(setUpUserProvider)?.phoneNumber = credentials.user!.phoneNumber!;
      ref.read(setUpUserProvider)?.uid = credentials.user!.uid;
    });

    state = result;
  }

  void getuserHobby({required String hobby}) {
    ref.read(setUpUserProvider)?.hobby = hobby;
  }

  void getUserInterests({required List<String> interests}) {
    ref.read(setUpUserProvider)?.interests = interests;
  }

  void getUserDob({required String dob}) {
    ref.read(setUpUserProvider)?.dob = dob;
  }

  void getUserGender({required Gender gender}) {
    ref.read(setUpUserProvider)?.gender = gender;
  }

  void getUserProfileImage({required String avatar}) {
    ref.read(setUpUserProvider)?.avatar = avatar;
  }

  void getUserName({required String firstName, required String lastName}) {
    ref.read(setUpUserProvider)?.firstName = firstName;
    ref.read(setUpUserProvider)?.lastName = lastName;
  }

  Future<void> setupUser() async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _repo.setUpUser(ref.read(setUpUserProvider as ProviderListenable<UserModel>)));
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => _repo.login(email, password));
  }
}
