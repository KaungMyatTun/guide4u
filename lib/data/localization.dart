import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations of(BuildContext context) => Localizations.of(context, AppLocalizations);

  static const _localizedValues = {
    'en' : {
      'home' : 'home',
      'favourite' : 'Favourite',
      'search' : 'Search',
      'owner' : 'Owner',
    },
    // 'MM' : {

    // }
  };

  String get home => _localizedValues[locale.languageCode]['home'];
  String get favourite => _localizedValues[locale.languageCode]['favourite'];
  String get search => _localizedValues[locale.languageCode]['search'];
  String get owner => _localizedValues[locale.languageCode]['Onwer'];
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations>{
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) => SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}

