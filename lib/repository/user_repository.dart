import '/model/user_model.dart';
class  UserRepository {
  Future<UserModel> authenticate(String mobile, String pass) async {
  return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (mobile == "0912" && pass == "Ab12") {
    Map<String, dynamic> res = {"id":1,"name":"ali","family":"sdq","mobile":"0912","type":1,"active":1,"token":"eee12sd12e"};
    return UserModel.fromJson(res);
  }
  throw Exception("mobile or password is wrong");
  });

}  Future<UserModel> verifyByToken(token) async {
  return await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (token=="eee12sd12e") {
    Map<String, dynamic> res = {"id":1,"name":"ali","family":"sdq","mobile":"0912","type":1,"active":1,"token":"eee12sd12e"};
    return UserModel.fromJson(res);
  }
  throw Exception("Your Token is not correct");
  });

}

}
