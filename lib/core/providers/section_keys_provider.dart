import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class SectionKeysProvider {
  static final Map<String, GlobalKey> sectionKeys = {
    AppConstants.projectsId: GlobalKey(),
    AppConstants.contactId: GlobalKey(),
  };

  static GlobalKey getKey(String sectionId) {
    return sectionKeys[sectionId] ?? GlobalKey();
  }
}
