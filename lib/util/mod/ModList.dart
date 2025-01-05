import 'dart:io';

import 'package:pak_manager/util/mod/Mod.dart';

class ModList {
  static List<Mod> get all {
    List<Mod> rtn = List.empty(growable: true);
    for (FileSystemEntity entity in Directory.current.listSync()) {
      if (File(entity.path).existsSync()) {
        var m = Mod(entity.path);
        if (m.isMod == true) {
          rtn.add(m);
        }
      }
      if (Directory(entity.path).existsSync()) {
        for (FileSystemEntity entity2 in Directory(entity.path).listSync()) {
          var m = Mod(entity2.path);
          if (m.isMod == true) {
            rtn.add(m);
          }
        }
      }
    }
    return rtn;
  }
}
