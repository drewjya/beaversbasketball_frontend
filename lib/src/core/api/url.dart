class ApiUrl {
  static const _url = "https://api.beaversbasketball.id/public/api";
  static const storage = "https://api.beaversbasketball.id/public/storage";

  static const postLogin = "$_url/login";
  static const getLogout = "$_url/logout";
  static const getCheckSession = "$_url/checkSession";
  static const postRegisterMember = "$_url/registMember";
  static const getGallery = "$_url/galeri";
  static const postUpdateGallery = "$_url/updateGaleri";
  static const getCoach = "$_url/coach";
  static const getSponsor = "$_url/sponsor";
  static const postEditCoach = "$_url/updateCoach";
  static const postEditSponsor = "$_url/updateSponsor";
  static const getTokenSanctum =
      "https://api.beaversbasketball.id/public/sanctum/csrf-cookie";

  static const getAchievement = "$_url/achievement";
  static const postAchievement = "$_url/updateAchievement";

  static const getNews = "$_url/news";
  static const postNews = "$_url/updateNews";

  static const getSchedule = "$_url/schedule";
  static const postSchedule = "$_url/updateSchedule";

  static const getAllUser = "$_url/allUser";
}

class PrefConst {
  static const auth = "AUTH_KEY";
}
