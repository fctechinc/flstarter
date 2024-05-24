import 'package:starter/controllers/api.controllers/base.api.dart';

class ExampleApi extends BaseApi {
  ExampleApi({
    required super.auth,
    required super.pref,
  }) : super(service: 'account', subPath: 'account');

  //ready-to-implement
  // Future<UserModel?> login({
  //   required String email,
  //   required String password,
  // }) async {
  //   final uri = "$path/check-account-with-mail";
  //   final response = await http.post(
  //     Uri.parse(uri),
  //     body: json.encode(
  //       {
  //         "email": email,
  //         "password": password,
  //       },
  //     ),
  //     headers: headers,
  //   );
  //   try {
  //     final check = UserModel.fromJson(json.decode(response.body));
  //     auth.value = check.auth;
  //     await pref.setString("email", email);
  //     await pref.setString("pass", password);
  //     return check;
  //   } catch (_) {
  //     print(_.toString());
  //   }
  //   return null;
  // }

  // Future<UserModel?> addUser({
  //   required UserType type,
  //   required String? companyName,
  //   required String name,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // }) async {
  //   final user = UserModel(
  //     userType: type,
  //     companyName: companyName,
  //     name: name,
  //     lastName: lastName,
  //     email: email,
  //     password: password,
  //     isIOS: Platform.isIOS,
  //     createdAt: DateTime.now(),
  //   );
  //   final uri = "$path/add-account";

  //   try {
  //     final response = await http.post(
  //       Uri.parse(uri),
  //       body: json.encode(user.toJson()),
  //       headers: headers,
  //     );
  //     final body = json.decode(response.body);
  //     if (body["success"] == true) {
  //       auth.value = Auth.fromJson(body["auth"]);
  //       final user = UserModel.fromJson(body["account"], auth: auth.value);
  //       if (user.email != null) {
  //         await pref.setString("email", user.email!);
  //       }
  //       if (user.password != null) {
  //         await pref.setString("pass", user.password!);
  //       }
  //       return user;
  //     } else {
  //       throw body["message"] ?? "Bir şeyler ters gitti";
  //     }
  //   } catch (e, s) {
  //     dev.log("$e\n\n StackTrace: $s", name: "addUser");
  //     rethrow;
  //   }
  // }

  // Future<UserModel?> updateProfileImage({
  //   required MultipartFileGetter? image,
  // }) async {
  //   final uri = "$path/update-my-profile-image";
  //   final request = http.MultipartRequest('POST', Uri.parse(uri));

  //   if (image != null) {
  //     request.files.add(image.httpImage);
  //   }

  //   request.headers.addAll(await headersWithToken);
  //   request.headers.addAll(
  //     {
  //       "Connection": "keep-alive",
  //       "Content-Type": "multipart/form-data",
  //     },
  //   );

  //   final response = await request.send();
  //   final completer = Completer<UserModel>();
  //   final subs = response.stream.listen((value) async {
  //     try {
  //       final resp = utf8.decode(value);
  //       final body = json.decode(resp);
  //       if (success(resp)) {
  //         completer.complete(UserModel.fromJson(body["account"]));
  //       } else {
  //         completer.completeError(body["message"] ?? "Bir şeyler ters gitti");
  //       }
  //     } catch (e) {
  //       completer.completeError(e.toString());
  //     }
  //   });
  //   UserModel? u;
  //   try {
  //     u = await completer.future;
  //   } catch (e) {
  //     rethrow;
  //   }
  //   await subs.cancel();

  //   return u;
  // }

  // Future<UserModel?> updateAccount({
  //   required UserModel old,
  //   required UserModel newUser,
  // }) async {
  //   final uri = "$path/update-my-account";
  //   final response = await http.post(
  //     Uri.parse(uri),
  //     body: json.encode(newUser.toJson()),
  //     headers: await headersWithToken,
  //   );

  //   try {
  //     final body = json.decode(response.body);
  //     dev.log(response.body);
  //     if (success(response.body)) {
  //       if (old.email != newUser.email && newUser.email != null) {
  //         await pref.setString("email", newUser.email!);
  //       }
  //       if (old.password != newUser.password && newUser.password != null) {
  //         await pref.setString("pass", newUser.password!);
  //       }
  //       return UserModel.fromJson(body["account"]);
  //     } else {
  //       throw body["message"] ?? "Veriler alınamadı";
  //     }
  //   } catch (e, s) {
  //     dev.log("$e\n\n StackTrace: $s", name: "updateAccount");
  //     rethrow;
  //   }
  // }
}
