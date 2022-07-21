// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled1newone/generated/intl/app_localization.dart';


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

  /// `Some localized strings:`
  String get pageHomeListTitle {
    return Intl.message(
      'lan',
      name: 'pageHomeListTitle',
      desc: '',
      args: [],
    );
  }

  String get pageArabicTitle {
    return Intl.message(
      'arabic',
      name: 'pageArabicTitle',
      desc: '',
      args: [],
    );
  }

  String get pageDarkMode {
    return Intl.message(
      'dark',
      name: 'pageDarkMode',
      // desc: '',
      // args: [],
    );
  }

  String get pageLightMode {
    return Intl.message(
      'light',
      name: 'pageLightMode',
      desc: '',
      args: [],
    );
  }

  String get pageChangeLan {
    return Intl.message(
      'lan',
      name: 'pageChangeLan',
      desc: '',
      args: [],
    );
  }

  String get pageChangeMode {
    return Intl.message(
      'mode',
      name: 'pageChangeMode',
      desc: '',
      args: [],
    );
  }

  String get pageSetting {
    return Intl.message(
      'setting',
      name: 'pageSetting',
      desc: '',
      args: [],
    );
  }

  String get pageHome {
    return Intl.message(
      'home',
      name: 'pageHome',
    );
  }
  String get pageAccount {
    return Intl.message(
      'account',
      name: 'pageAccount',
    );
  }
  String get pageAboutau {
    return Intl.message(
      'aboutus',
      name: 'pageAboutau',
    );
  }
  String get pageContactus {
    return Intl.message(
      'contactus',
      name: 'pageContactus',
    );
  }
  String get pageLogout {
    return Intl.message(
      'logout',
      name: 'pageLogout',
    );
  }
  String get pageCallus {
    return Intl.message(
      'callus',
      name: 'pageCallus',
    );
  }
  String get pageWeAre {
    return Intl.message(
      'wearehere',
      name: 'pageWeAre',
    );
  }
  String get pageInitial {
    return Intl.message(
      'initial',
      name: 'pageInitial',
    );
  }
  String get pageOffer{
    return Intl.message(
      'offer',
      name: 'pageOffer',
    );
  }
  String get pageTour {
    return Intl.message(
      'tour',
      name: 'pageTour',
    );
  }
  String get pageMore {
    return Intl.message(
      'more',
      name: 'pageMore',
    );
  }
  String get pageCoin {
    return Intl.message(
      'coin',
      name: 'pageCoin',
    );
  }
  String get pageFavorite {
    return Intl.message(
      'favorite',
      name: 'pageFavorite',
    );
  }
  String get pageDetail {
    return Intl.message(
      'detail',
      name: 'pageDetail',
    );
  }
  String get pageReviews {
    return Intl.message(
      'reviews',
      name: 'pageReviews',
    );
  }
  String get pageRateNow {
    return Intl.message(
      'ratenow',
      name: 'pageRateNow',
    );
  }
  String get pageShowMore {
    return Intl.message(
      'showmore',
      name: 'pageShowMore',
    );
  }
  String get pageShowLess {
    return Intl.message(
      'showless',
      name: 'pageShowLess',
    );
  }
  String get pageBooking {
    return Intl.message(
      'booking',
      name: 'pageBooking',
    );
  }
  String get pageFacilities {
    return Intl.message(
      'facilities',
      name: 'pageFacilities',
    );
  }
  String get pageLocation {
    return Intl.message(
      'location',
      name: 'pageLocation',
    );
  }
  String get pageWifi {
    return Intl.message(
      'wifi',
      name: 'pageWifi',
    );
  }
  String get pagePool {
    return Intl.message(
      'pool',
      name: 'pagePool',
    );
  }
  String get pageBreakfast {
    return Intl.message(
      'breakfast',
      name: 'pageBreakfast',
    );
  }
  String get pageSport {
    return Intl.message(
      'sport',
      name: 'pageSport',
    );
  }
  String get pageEnterComment {
    return Intl.message(
      'entercomment',
      name: 'pageEnterComment',
    );
  }
  String get pageRating {
    return Intl.message(
      'rating',
      name: 'pageRating',
    );
  }
  String get pageNight {
    return Intl.message(
      'night',
      name: 'pageNight',
    );
  }
  String get pageDay {
    return Intl.message(
      'day',
      name: 'pageDay',
    );
  }
  String get pagePrice {
    return Intl.message(
      'price',
      name: 'pagePrice',
    );
  }
  String get pageLike {
    return Intl.message(
      'like',
      name: 'pageLike',
    );
  }
  String get pagePlaces {
    return Intl.message(
      'places',
      name: 'pagePlaces',
    );
  }
  String get pageProgram {
    return Intl.message(
      'program',
      name: 'pageProgram',
    );
  }
  String get pageOurProgram {
    return Intl.message(
      'ourprogram',
      name: 'pageOurProgram',
    );
  }
  String get pageBookNow {
    return Intl.message(
      'booknow',
      name: 'pageBookNow',
    );
  }
  String get pageByBank {
    return Intl.message(
      'bybank',
      name: 'pageByBank',
    );
  }
  String get pageWhenArrived {
    return Intl.message(
      'whenarrived',
      name: 'pageWhenArrived',
    );
  }
  String get pageGetStarted {
    return Intl.message(
      'getstarted',
      name: 'pageGetStarted',
    );
  }
  String get pagePerson {
    return Intl.message(
      'person',
      name: 'pagePerson',
    );
  }
  String get pageCost {
    return Intl.message(
      'cost',
      name: 'pageCost',
    );
  }
  String get pageBook {
    return Intl.message(
      'book',
      name: 'pageBook',
    );
  }
  String get pageYourLocation {
    return Intl.message(
      'yourlocation',
      name: 'pageYourLocation',
    );
  }
  String get pageYourPhone {
    return Intl.message(
      'yourphone',
      name: 'pageYourPhone',
    );
  }
  String get pageLeavingDate {
    return Intl.message(
      'leavingdate',
      name: 'pageLeavingDate',
    );
  }
  String get pageReturnDate {
    return Intl.message(
      'returndate',
      name: 'pageReturnDate',
    );
  }
  String get pageEnterTime {
    return Intl.message(
      'entertime',
      name: 'pageEnterTime',
    );
  }
  String get pagePhoneRequired {
    return Intl.message(
      'phonerequired',
      name: 'pagePhoneRequired',
    );
  }
  String get pageLogin {
    return Intl.message(
      'login',
      name: 'pageLogin',
    );
  }
  String get pageEnterEmail {
    return Intl.message(
      'enteremail',
      name: 'pageEnterEmail',
    );
  }
  String get pageEnterPassword {
    return Intl.message(
      'enterpassword',
      name: 'pageEnterPassword',
    );
  }
  String get pageRegister {
    return Intl.message(
      'register',
      name: 'pageRegister',
    );
  }
  String get pageEmailAddress {
    return Intl.message(
      'emailaddress',
      name: 'pageEmailAddress',
    );
  }
  String get pagePasswordAddress {
    return Intl.message(
      'password',
      name: 'pagePasswordAddress',
    );
  }
  String get pageName {
    return Intl.message(
      'name',
      name: 'pageName',
    );
  }
  String get pageConfirmpass {
    return Intl.message(
      'confirmpass',
      name: 'pageConfirmpass',
    );
  }
  String get pageFillValue {
    return Intl.message(
      'fillValue',
      name: 'pageFillValue',
    );
  }
  String get pageStartOrg {
    return Intl.message(
      'startorg',
      name: 'pageStartOrg',
    );
  }
  String get pageStartOrgFrom {
    return Intl.message(
      'startorgfrom',
      name: 'pageStartOrgFrom',
    );
  }
  String get pageStartOrgTo {
    return Intl.message(
      'startorgto',
      name: 'pageStartOrgTo',
    );
  }
  String get pagePickaCountry {
    return Intl.message(
      'pickacountry',
      name: 'pagePickaCountry',
    );
  }
  String get pageNumofPas {
    return Intl.message(
      'numofpas',
      name: 'pageNumofPas',
    );
  }
  String get pagenumAdults {
    return Intl.message(
      'numadults',
      name: 'pagenumAdults',
    );
  }
  String get pageNumKids {
    return Intl.message(
      'numkids',
      name: 'pageNumKids',
    );
  }
  String get pageNumInfants {
    return Intl.message(
      'numinfants',
      name: 'pageNumInfants',
    );
  }
  String get pagenumAdultsAge {
    return Intl.message(
      'numadultsage',
      name: 'pagenumAdultsAge',
    );
  }
  String get pageNumKidsAge {
    return Intl.message(
      'numkidsage',
      name: 'pageNumKidsAge',
    );
  }
  String get pageNumInfantsAge {
    return Intl.message(
      'numinfantsage',
      name: 'pageNumInfantsAge',
    );
  }





  /// `Welcome {name}`
  String pageHomeSamplePlaceholder(Object name) {
    return Intl.message(
      'Welcome $name',
      name: 'pageHomeSamplePlaceholder',
      desc: '',
      args: [name],
    );
  }

  /// `My name is {lastName}, {firstName} {lastName}`
  String pageHomeSamplePlaceholdersOrdered(Object firstName, Object lastName) {
    return Intl.message(
      'My name is $lastName, $firstName $lastName',
      name: 'pageHomeSamplePlaceholdersOrdered',
      desc: '',
      args: [firstName, lastName],
    );
  }

  /// `{howMany, plural, one{You have 1 message} other{You have {howMany} messages}}`
  String pageHomeSamplePlural(int howMany) {
    return Intl.plural(
      howMany,
      one: 'You have 1 message',
      other: 'You have $howMany messages',
      name: 'pageHomeSamplePlural',
      desc: '',
      args: [howMany],
    );
  }

  /// `Total: {total}`
  String pageHomeSampleTotalAmount(double total) {
    final NumberFormat totalNumberFormat = NumberFormat.currency(
        locale: Intl.getCurrentLocale(), symbol: '€', decimalDigits: 2);
    final String totalString = totalNumberFormat.format(total);

    return Intl.message(
      'Total: $totalString',
      name: 'pageHomeSampleTotalAmount',
      desc: '',
      args: [totalString],
    );
  }

  /// `Date: {date} Time: {time}`
  String pageHomeSampleCurrentDateTime(DateTime date, DateTime time) {
    // final DateFormat dateDateFormat = DateFormat.yMd(Intl.getCurrentLocale());
    // final String dateString = dateDateFormat.format(date);
    //
    // final DateFormat timeDateFormat = DateFormat.Hm(Intl.getCurrentLocale());
    // final String timeString = timeDateFormat.format(time);

    return Intl.message(
      'Date: 5 Time: 4',
      name: 'pageHomeSampleCurrentDateTime',
      desc: '',
      args: [4, 5],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
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
