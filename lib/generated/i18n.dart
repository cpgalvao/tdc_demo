
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

//This file is automatically generated. DO NOT EDIT, all your changes would be lost.

class S implements WidgetsLocalizations {
  const S();

  static const GeneratedLocalizationsDelegate delegate =
      const GeneratedLocalizationsDelegate();

  static S of(BuildContext context) =>
      Localizations.of<S>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get app_desc => "TDC Demo app";
  String get apple => "Apple";
  String get cherry => "Cherry";
  String get currency => "";
  String get developer => "Developed by:";
  String get flutter_tdc_demo => "Flutter TDC Demo";
  String get grape => "Grape";
  String get lemon => "Lemon";
  String get melon => "Melon";
  String get orange => "Orange";
  String get peach => "Peach";
  String get pineapple => "Pineapple";
  String get strawberry => "Strawberry";
  String get watermelon => "Watermelon";
}

class en extends S {
  const en();
}

class pt_BR extends S {
  const pt_BR();

   @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get cherry => "Cereja";
  @override
  String get strawberry => "Morango";
  @override
  String get peach => "Pêssego";
  @override
  String get grape => "Uva";
  @override
  String get orange => "Laranja";
  @override
  String get apple => "Maçã";
  @override
  String get lemon => "Limão";
  @override
  String get pineapple => "Abacaxi";
  @override
  String get developer => "Desenvolvido por:";
  @override
  String get currency => "R";
  @override
  String get app_desc => "App demo para o TDC";
  @override
  String get watermelon => "Melancia";
  @override
  String get melon => "Melão";
  @override
  String get flutter_tdc_demo => "Flutter TDC App Demo";
}


class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[

      const Locale("en", ""),
      const Locale("pt", "BR"),

    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      final Locale languageLocale = new Locale(locale.languageCode, "");
      if (supported.contains(locale))
        return locale;
      else if (supported.contains(languageLocale))
        return languageLocale;
      else {
        final Locale fallbackLocale = fallback ?? supported.first;
        return fallbackLocale;
      }
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    final String lang = getLang(locale);
    switch (lang) {

      case "en":
        return new SynchronousFuture<WidgetsLocalizations>(const en());
      case "pt_BR":
        return new SynchronousFuture<WidgetsLocalizations>(const pt_BR());

      default:
        return new SynchronousFuture<WidgetsLocalizations>(const S());
    }
  }

  @override
  bool isSupported(Locale locale) => supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

String getLang(Locale l) => l.countryCode != null && l.countryCode.isEmpty
    ? l.languageCode
    : l.toString();
