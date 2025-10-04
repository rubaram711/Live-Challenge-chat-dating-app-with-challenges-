import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get hello => 'Hello';

  @override
  String get agree => 'Agree';

  @override
  String get disagree => 'Disagree';

  @override
  String get login => 'LOGIN';

  @override
  String get wait => 'Wait a second please';

  @override
  String get google_login_btn => 'Login with Google';

  @override
  String get apple_login_btn => 'Login with Apple';

  @override
  String get google_login_explanation => 'just click this button and choose an Google account to login with it';

  @override
  String get apple_login_explanation => 'just click this button and choose an iCloud account to login with it';

  @override
  String get users => 'Users';

  @override
  String get notifications => 'Requests';

  @override
  String get chat => 'Chat';

  @override
  String get support => 'Support';

  @override
  String get profile => 'Profile';

  @override
  String get search => 'Search';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get update_profile => 'Update Profile';

  @override
  String get enter_photo => 'Choose a New Photo';

  @override
  String get gallery => 'Gallery';

  @override
  String get camera => 'Camera';

  @override
  String get accept_challenges => 'Accept challenges';

  @override
  String get not_accept_challenges => 'Don\'t accept challenges';

  @override
  String get accept_adult_challenges => 'Accept +18 challenges';

  @override
  String get not_accept_adult_challenges => 'Don\'t accept +18 challenges';

  @override
  String get username => 'User Name';

  @override
  String get bio => 'Bio';

  @override
  String get unspecified_bio => 'You haven\'t added a bio yet';

  @override
  String get country => 'Country';

  @override
  String get unspecified_country => 'Unspecified country';

  @override
  String get phone => 'Phone';

  @override
  String get phone10Digits => 'Phone number must be 10 digits';

  @override
  String get unspecified_phone => 'Unspecified mobile number';

  @override
  String get updated_successfully => 'Updated successfully';

  @override
  String get updated_failed => 'Updated failed';

  @override
  String get filter => 'Filter by accepting +18 challenges';

  @override
  String get points => 'Points / 10min';

  @override
  String get point => 'Point';

  @override
  String get request_adult => '+18 Challenge';

  @override
  String get request_challenge_type => 'Challenge type';

  @override
  String get audio => 'Audio';

  @override
  String get video => 'Video';

  @override
  String get send_request => 'Send request';

  @override
  String get challenge_award => 'Challenge Award';

  @override
  String get withdraw => 'Withdraw';

  @override
  String get deposit => 'Deposit';

  @override
  String get deposited_amount => 'Choose The amount to be deposited';

  @override
  String get otherwise => 'Otherwise';

  @override
  String get sent_successfully => 'The request has been sent successfully';

  @override
  String get sent_field => 'There is an error,the request was not sent';

  @override
  String get accept_successfully => 'The request has been approved';

  @override
  String get accept_field => 'There is an error';

  @override
  String get error => 'There is an error';

  @override
  String receive_request(Object type, Object name, Object points) {
    return 'You have received $type challenge request with $name of $points points';
  }

  @override
  String receive_accept(Object type, Object name, Object points) {
    return 'Accepting the $type challenge request from $name with a value of $points points';
  }
}
