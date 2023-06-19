class ApiUrl {
  static const _url = "http://localhost:8000/api";

  static const postLogin = "$_url/login";
  static const getLogout = "$_url/logout";
  static const postRegisterMember = "$_url/registMember";
  static const getGallery = "$_url/galeri";
  static const getCoach = "$_url/coach";
  static const getTokenSanctum = "http://localhost:8000/sanctum/csrf-cookie";
}

class PrefConst {
  static const auth = "AUTH_KEY";
}
