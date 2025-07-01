// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to Salla7ly`
  String get welcomeToSalla7ly {
    return Intl.message(
      'Welcome to Salla7ly',
      name: 'welcomeToSalla7ly',
      desc: '',
      args: [],
    );
  }

  /// `Connect easily with skilled craftsmen and get personalized service recommendations tailored to your needs.`
  String get on1Content {
    return Intl.message(
      'Connect easily with skilled craftsmen and get personalized service recommendations tailored to your needs.',
      name: 'on1Content',
      desc: '',
      args: [],
    );
  }

  /// ` We connect you with expert craftsmen delivering top-quality service with professionalism and care.`
  String get on2Content {
    return Intl.message(
      ' We connect you with expert craftsmen delivering top-quality service with professionalism and care.',
      name: 'on2Content',
      desc: '',
      args: [],
    );
  }

  /// `Craftsmen can discover job opportunities effortlessly, while users  can post their needs and connect with  skilled professionals. `
  String get on3Content {
    return Intl.message(
      'Craftsmen can discover job opportunities effortlessly, while users  can post their needs and connect with  skilled professionals. ',
      name: 'on3Content',
      desc: '',
      args: [],
    );
  }

  /// `Skilled Hands, Trusted Service!`
  String get on2Title {
    return Intl.message(
      'Skilled Hands, Trusted Service!',
      name: 'on2Title',
      desc: '',
      args: [],
    );
  }

  /// `Find Work Easily, Get the Right Help!`
  String get on3Title {
    return Intl.message(
      'Find Work Easily, Get the Right Help!',
      name: 'on3Title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `send`
  String get send {
    return Intl.message(
      'send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Start`
  String get Start {
    return Intl.message(
      'Start',
      name: 'Start',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message(
      'Sign In',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `please fill the credentials.`
  String get fillCredentials {
    return Intl.message(
      'please fill the credentials.',
      name: 'fillCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `sign in`
  String get signInButton {
    return Intl.message(
      'sign in',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  /// `Or sign in With`
  String get orSignInWith {
    return Intl.message(
      'Or sign in With',
      name: 'orSignInWith',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue With Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account ?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have account ?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Please select your account type to continue:`
  String get selectAccountType {
    return Intl.message(
      'Please select your account type to continue:',
      name: 'selectAccountType',
      desc: '',
      args: [],
    );
  }

  /// `User – If you're looking for professionals to get your tasks done.`
  String get userDescription {
    return Intl.message(
      'User – If you\'re looking for professionals to get your tasks done.',
      name: 'userDescription',
      desc: '',
      args: [],
    );
  }

  /// `Craftsman – If you offer manual services`
  String get craftsmanDescription {
    return Intl.message(
      'Craftsman – If you offer manual services',
      name: 'craftsmanDescription',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get userButton {
    return Intl.message(
      'User',
      name: 'userButton',
      desc: '',
      args: [],
    );
  }

  /// `Craftsman`
  String get craftsmanButton {
    return Intl.message(
      'Craftsman',
      name: 'craftsmanButton',
      desc: '',
      args: [],
    );
  }

  /// `Email is required`
  String get emailRequired {
    return Intl.message(
      'Email is required',
      name: 'emailRequired',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalidEmail {
    return Intl.message(
      'Invalid email format',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email already exists`
  String get emailAlreadyExists {
    return Intl.message(
      'Email already exists',
      name: 'emailAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `Password is required`
  String get passwordRequired {
    return Intl.message(
      'Password is required',
      name: 'passwordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters`
  String get passwordTooShort {
    return Intl.message(
      'Password must be at least 8 characters',
      name: 'passwordTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter`
  String get passwordNoUppercase {
    return Intl.message(
      'Password must contain at least one uppercase letter',
      name: 'passwordNoUppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one number`
  String get passwordNoNumber {
    return Intl.message(
      'Password must contain at least one number',
      name: 'passwordNoNumber',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get usernameLabel {
    return Intl.message(
      'Username',
      name: 'usernameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter username`
  String get usernameHint {
    return Intl.message(
      'Enter username',
      name: 'usernameHint',
      desc: '',
      args: [],
    );
  }

  /// `Username is required`
  String get usernameRequired {
    return Intl.message(
      'Username is required',
      name: 'usernameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot start with a space`
  String get usernameStartsWithSpace {
    return Intl.message(
      'Username cannot start with a space',
      name: 'usernameStartsWithSpace',
      desc: '',
      args: [],
    );
  }

  /// `Username must be at least 5 characters`
  String get usernameTooShort {
    return Intl.message(
      'Username must be at least 5 characters',
      name: 'usernameTooShort',
      desc: '',
      args: [],
    );
  }

  /// `Username cannot contain numbers`
  String get usernameHasNumbers {
    return Intl.message(
      'Username cannot contain numbers',
      name: 'usernameHasNumbers',
      desc: '',
      args: [],
    );
  }

  /// `Weak password, use a mix of letters, numbers and symbols (example: Aa@#1234)`
  String get passwordComplexityError {
    return Intl.message(
      'Weak password, use a mix of letters, numbers and symbols (example: Aa@#1234)',
      name: 'passwordComplexityError',
      desc: '',
      args: [],
    );
  }

  /// `UserName :`
  String get nameLabel {
    return Intl.message(
      'UserName :',
      name: 'nameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Username`
  String get nameHint {
    return Intl.message(
      'Enter your Username',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordLabel {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPasswordHint {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDateLabel {
    return Intl.message(
      'Birth Date',
      name: 'birthDateLabel',
      desc: '',
      args: [],
    );
  }

  /// `Upload ID Photo`
  String get uploadIdLabel {
    return Intl.message(
      'Upload ID Photo',
      name: 'uploadIdLabel',
      desc: '',
      args: [],
    );
  }

  /// `Upload a photo`
  String get uploadPhoto {
    return Intl.message(
      'Upload a photo',
      name: 'uploadPhoto',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message(
      'Sign Up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `UserName is required`
  String get nameRequired {
    return Intl.message(
      'UserName is required',
      name: 'nameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password is required`
  String get confirmPasswordRequired {
    return Intl.message(
      'Confirm password is required',
      name: 'confirmPasswordRequired',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Birth date is required`
  String get birthDateRequired {
    return Intl.message(
      'Birth date is required',
      name: 'birthDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `National ID photo is required`
  String get idPhotoRequired {
    return Intl.message(
      'National ID photo is required',
      name: 'idPhotoRequired',
      desc: '',
      args: [],
    );
  }

  /// `Resend limit reached for today`
  String get resend_limit_reached_for_today {
    return Intl.message(
      'Resend limit reached for today',
      name: 'resend_limit_reached_for_today',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get resend {
    return Intl.message(
      'Resend',
      name: 'resend',
      desc: '',
      args: [],
    );
  }

  /// `OTP has been resent`
  String get otp_has_been_resent {
    return Intl.message(
      'OTP has been resent',
      name: 'otp_has_been_resent',
      desc: '',
      args: [],
    );
  }

  /// `Confirm OTP code`
  String get confirm_otp_code {
    return Intl.message(
      'Confirm OTP code',
      name: 'confirm_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the 6-digit code sent to your email`
  String get please_enter_the_6_digit_code_sent_to_your_email {
    return Intl.message(
      'Please enter the 6-digit code sent to your email',
      name: 'please_enter_the_6_digit_code_sent_to_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Please enter all numbers OTP`
  String get please_enter_all_numbers_otp {
    return Intl.message(
      'Please enter all numbers OTP',
      name: 'please_enter_all_numbers_otp',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalid_otp {
    return Intl.message(
      'Invalid OTP',
      name: 'invalid_otp',
      desc: '',
      args: [],
    );
  }

  /// `OTP sent successfully`
  String get otp_sent_successfully {
    return Intl.message(
      'OTP sent successfully',
      name: 'otp_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Invalid E-Mail Address`
  String get invalid_email_address {
    return Intl.message(
      'Invalid E-Mail Address',
      name: 'invalid_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to receive a verification card`
  String get please_enter_your_email_to_receive_a_verification_card {
    return Intl.message(
      'Please enter your email to receive a verification card',
      name: 'please_enter_your_email_to_receive_a_verification_card',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enter_email_address {
    return Intl.message(
      'Enter email address',
      name: 'enter_email_address',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email format`
  String get invalid_email_format {
    return Intl.message(
      'Invalid email format',
      name: 'invalid_email_format',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid email`
  String get enter_valid_email {
    return Intl.message(
      'Enter valid email',
      name: 'enter_valid_email',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please check your network`
  String get something_went_wrong_please_check_your_network {
    return Intl.message(
      'Something went wrong, please check your network',
      name: 'something_went_wrong_please_check_your_network',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password updated successfully`
  String get password_updated_successfully {
    return Intl.message(
      'Password updated successfully',
      name: 'password_updated_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there was an error. Please try again later`
  String get sorry_there_was_an_error_please_try_again_later {
    return Intl.message(
      'Sorry, there was an error. Please try again later',
      name: 'sorry_there_was_an_error_please_try_again_later',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from previously used password`
  String get your_new_password_must_be_different_from_previously_used_password {
    return Intl.message(
      'Your new password must be different from previously used password',
      name: 'your_new_password_must_be_different_from_previously_used_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enter_password {
    return Intl.message(
      'Enter password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password validation`
  String get password_validation {
    return Intl.message(
      'Password validation',
      name: 'password_validation',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm password`
  String get enter_confirm_password {
    return Intl.message(
      'Enter confirm password',
      name: 'enter_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Wrong confirm password`
  String get wrong_confirm_password {
    return Intl.message(
      'Wrong confirm password',
      name: 'wrong_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirm_password {
    return Intl.message(
      'Confirm password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
