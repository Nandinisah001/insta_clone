import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = 'Username'.obs;
  var profileImageUrl = ''.obs;
  var postCount = 0.obs;
  var followerCount = 0.obs;
  var followingCount = 0.obs;


  void updateProfile({
    required String name,
    required String imageUrl,
    required int posts,
    required int followers,
    required int following,
  }) {
    userName.value = name;
    profileImageUrl.value = imageUrl;
    postCount.value = posts;
    followerCount.value = followers;
    followingCount.value = following;
  }
}
