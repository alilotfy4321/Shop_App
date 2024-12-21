// ignore_for_file: file_names

class EndPoint {
  
static String baseUrl = 'http://student.valuxapps.com/api/';
//--------------------------------------'login'----------------
 static String login = 'login';
//---------------------'sign up'-------
 static String register = 'register';
  //...getHome
  static String home = 'home';
  static String categories = 'categories';
    static String postFavorites = 'favorites?';
    static String getFavorites = 'favorites';
    static String getProfile = 'profile';



}

//----------the words that reapeted more than one--....
// status code, errorMessage ...ect
class AppKeys {
  //--------sign in
  static String signInEmail = 'email';
  static String signInPassword = 'password';
  //-----sign up
  static String registerName = 'name';
  static String registerEmail = 'email';
  static String registerPhone = 'phone';
  static String registerPassword = 'password';
    static String registerProfilePic = 'image';

  //------location
  static String location = 'location';
  static String profilePic = 'UploadprofilePic';
//-error message--
  static String statusCode = 'statusCode';
  static String errorMessage = 'errorMessage';
  static String data = 'errorMessage';
  // static String token = 'token';
}
