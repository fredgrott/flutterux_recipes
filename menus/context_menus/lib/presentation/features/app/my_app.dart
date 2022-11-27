// Copyright 2022 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of portion of Flutter samples project named context menu
// Under Apache License see
// https://github.com/flutter/samples/tree/main/experimental/context_menus

import 'package:context_menus/presentation/features/anywhere/anywhere_page.dart';
import 'package:context_menus/presentation/features/cascading/cascading_menu_page.dart';
import 'package:context_menus/presentation/features/custom_buttons/custom_buttons_page.dart';
import 'package:context_menus/presentation/features/default_values/default_values_page.dart';
import 'package:context_menus/presentation/features/email_button/email_button_page.dart';
import 'package:context_menus/presentation/features/field_types/field_types_page.dart';
import 'package:context_menus/presentation/features/full/full_page.dart';
import 'package:context_menus/presentation/features/global_selection/global_selection_page.dart';
import 'package:context_menus/presentation/features/image/image_page.dart';
import 'package:context_menus/presentation/features/modified_action/modified_action_page.dart';
import 'package:context_menus/presentation/features/reordered_button/reordered_button_page.dart';
import 'package:context_menus/presentation/themes/static_theme_datas.dart';
import 'package:context_menus/presentation/widgets/platform_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void onChangedPlatform(TargetPlatform platform) {
    setState(() {
      debugDefaultTargetPlatformOverride = platform;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Context Menu Examples',
      theme: lightStaticThemeData.copyWith(platform: defaultTargetPlatform),
      darkTheme: darkStaticThemeData.copyWith(platform: defaultTargetPlatform),
      highContrastTheme: lighthighcontrastStaticThemeData.copyWith(platform: defaultTargetPlatform),
      highContrastDarkTheme: darkhighcontrastStaticThemeData.copyWith(
          platform: defaultTargetPlatform,),
      initialRoute: '/',
      routes: <String, Widget Function(BuildContext)>{
        '/': (BuildContext context) =>
            MyHomePage(onChangedPlatform: onChangedPlatform),
        AnywherePage.route: (BuildContext context) =>
            AnywherePage(onChangedPlatform: onChangedPlatform),
        CustomButtonsPage.route: (BuildContext context) =>
            CustomButtonsPage(onChangedPlatform: onChangedPlatform),
        ReorderedButtonsPage.route: (BuildContext context) =>
            ReorderedButtonsPage(onChangedPlatform: onChangedPlatform),
        EmailButtonPage.route: (BuildContext context) =>
            EmailButtonPage(onChangedPlatform: onChangedPlatform),
        ImagePage.route: (BuildContext context) =>
            ImagePage(onChangedPlatform: onChangedPlatform),
        FieldTypesPage.route: (BuildContext context) =>
            FieldTypesPage(onChangedPlatform: onChangedPlatform),
        FullPage.route: (BuildContext context) =>
            FullPage(onChangedPlatform: onChangedPlatform),
        ModifiedActionPage.route: (BuildContext context) =>
            ModifiedActionPage(onChangedPlatform: onChangedPlatform),
        GlobalSelectionPage.route: (BuildContext context) =>
            GlobalSelectionPage(onChangedPlatform: onChangedPlatform),
        DefaultValuesPage.route: (BuildContext context) =>
            DefaultValuesPage(onChangedPlatform: onChangedPlatform),
        CascadingMenuPage.route: (BuildContext context) =>
            CascadingMenuPage(onChangedPlatform: onChangedPlatform),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
    required this.onChangedPlatform,
  });

  final PlatformCallback onChangedPlatform;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Menu Demos'),
        actions: <Widget>[
          PlatformSelector(
            onChangedPlatform: onChangedPlatform,
          ),
        ],
      ),
      body: ListView(
        children: const <Widget>[
          _MyListItem(
            route: AnywherePage.route,
            title: AnywherePage.title,
            subtitle: AnywherePage.subtitle,
          ),
          _MyListItem(
            route: GlobalSelectionPage.route,
            title: GlobalSelectionPage.title,
            subtitle: GlobalSelectionPage.subtitle,
          ),
          _MyListItem(
            route: ImagePage.route,
            title: ImagePage.title,
            subtitle: ImagePage.subtitle,
          ),
          _MyListItem(
            route: CustomButtonsPage.route,
            title: CustomButtonsPage.title,
            subtitle: CustomButtonsPage.subtitle,
          ),
          _MyListItem(
            route: EmailButtonPage.route,
            title: EmailButtonPage.title,
            subtitle: EmailButtonPage.subtitle,
          ),
          _MyListItem(
            route: ReorderedButtonsPage.route,
            title: ReorderedButtonsPage.title,
            subtitle: ReorderedButtonsPage.subtitle,
          ),
          _MyListItem(
            route: ModifiedActionPage.route,
            title: ModifiedActionPage.title,
            subtitle: ModifiedActionPage.subtitle,
          ),
          _MyListItem(
            route: FieldTypesPage.route,
            title: FieldTypesPage.title,
            subtitle: FieldTypesPage.subtitle,
          ),
          _MyListItem(
            route: DefaultValuesPage.route,
            title: DefaultValuesPage.title,
            subtitle: DefaultValuesPage.subtitle,
          ),
          _MyListItem(
            route: CascadingMenuPage.route,
            title: CascadingMenuPage.title,
            subtitle: CascadingMenuPage.subtitle,
          ),
          _MyListItem(
            route: FullPage.route,
            title: FullPage.title,
            subtitle: FullPage.subtitle,
          ),
        ],
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  const _MyListItem({
    required this.route,
    required this.subtitle,
    required this.title,
  });

  final String route;
  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
      child: Card(
        margin: const EdgeInsets.all(12.0),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
          ),
        ),
      ),
    );
  }
}
