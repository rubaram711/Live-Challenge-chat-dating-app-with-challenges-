import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'Agree'**
  String get agree;

  /// No description provided for @disagree.
  ///
  /// In en, this message translates to:
  /// **'Disagree'**
  String get disagree;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @wait.
  ///
  /// In en, this message translates to:
  /// **'Wait a second please'**
  String get wait;

  /// No description provided for @google_login_btn.
  ///
  /// In en, this message translates to:
  /// **'Login with Google'**
  String get google_login_btn;

  /// No description provided for @apple_login_btn.
  ///
  /// In en, this message translates to:
  /// **'Login with Apple'**
  String get apple_login_btn;

  /// No description provided for @google_login_explanation.
  ///
  /// In en, this message translates to:
  /// **'just click this button and choose an Google account to login with it'**
  String get google_login_explanation;

  /// No description provided for @apple_login_explanation.
  ///
  /// In en, this message translates to:
  /// **'just click this button and choose an iCloud account to login with it'**
  String get apple_login_explanation;

  /// No description provided for @users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get users;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Requests'**
  String get notifications;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @update_profile.
  ///
  /// In en, this message translates to:
  /// **'Update Profile'**
  String get update_profile;

  /// No description provided for @enter_photo.
  ///
  /// In en, this message translates to:
  /// **'Choose a New Photo'**
  String get enter_photo;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @camera.
  ///
  /// In en, this message translates to:
  /// **'Camera'**
  String get camera;

  /// No description provided for @accept_challenges.
  ///
  /// In en, this message translates to:
  /// **'Accept challenges'**
  String get accept_challenges;

  /// No description provided for @not_accept_challenges.
  ///
  /// In en, this message translates to:
  /// **'Don\'t accept challenges'**
  String get not_accept_challenges;

  /// No description provided for @accept_adult_challenges.
  ///
  /// In en, this message translates to:
  /// **'Accept +18 challenges'**
  String get accept_adult_challenges;

  /// No description provided for @not_accept_adult_challenges.
  ///
  /// In en, this message translates to:
  /// **'Don\'t accept +18 challenges'**
  String get not_accept_adult_challenges;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'User Name'**
  String get username;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @unspecified_bio.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added a bio yet'**
  String get unspecified_bio;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @unspecified_country.
  ///
  /// In en, this message translates to:
  /// **'Unspecified country'**
  String get unspecified_country;

  /// No description provided for @phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get phone;

  /// No description provided for @phone10Digits.
  ///
  /// In en, this message translates to:
  /// **'Phone number must be 10 digits'**
  String get phone10Digits;

  /// No description provided for @unspecified_phone.
  ///
  /// In en, this message translates to:
  /// **'Unspecified mobile number'**
  String get unspecified_phone;

  /// No description provided for @updated_successfully.
  ///
  /// In en, this message translates to:
  /// **'Updated successfully'**
  String get updated_successfully;

  /// No description provided for @updated_failed.
  ///
  /// In en, this message translates to:
  /// **'Updated failed'**
  String get updated_failed;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter by accepting +18 challenges'**
  String get filter;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points / 10min'**
  String get points;

  /// No description provided for @point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get point;

  /// No description provided for @request_adult.
  ///
  /// In en, this message translates to:
  /// **'+18 Challenge'**
  String get request_adult;

  /// No description provided for @request_challenge_type.
  ///
  /// In en, this message translates to:
  /// **'Challenge type'**
  String get request_challenge_type;

  /// No description provided for @audio.
  ///
  /// In en, this message translates to:
  /// **'Audio'**
  String get audio;

  /// No description provided for @video.
  ///
  /// In en, this message translates to:
  /// **'Video'**
  String get video;

  /// No description provided for @send_request.
  ///
  /// In en, this message translates to:
  /// **'Send request'**
  String get send_request;

  /// No description provided for @challenge_award.
  ///
  /// In en, this message translates to:
  /// **'Challenge Award'**
  String get challenge_award;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @deposited_amount.
  ///
  /// In en, this message translates to:
  /// **'Choose The amount to be deposited'**
  String get deposited_amount;

  /// No description provided for @otherwise.
  ///
  /// In en, this message translates to:
  /// **'Otherwise'**
  String get otherwise;

  /// No description provided for @sent_successfully.
  ///
  /// In en, this message translates to:
  /// **'The request has been sent successfully'**
  String get sent_successfully;

  /// No description provided for @sent_field.
  ///
  /// In en, this message translates to:
  /// **'There is an error,the request was not sent'**
  String get sent_field;

  /// No description provided for @accept_successfully.
  ///
  /// In en, this message translates to:
  /// **'The request has been approved'**
  String get accept_successfully;

  /// No description provided for @accept_field.
  ///
  /// In en, this message translates to:
  /// **'There is an error'**
  String get accept_field;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'There is an error'**
  String get error;

  /// No description provided for @receive_request.
  ///
  /// In en, this message translates to:
  /// **'You have received {type} challenge request with {name} of {points} points'**
  String receive_request(Object type, Object name, Object points);

  /// No description provided for @receive_accept.
  ///
  /// In en, this message translates to:
  /// **'Accepting the {type} challenge request from {name} with a value of {points} points'**
  String receive_accept(Object type, Object name, Object points);
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
