import 'dart:io';

import 'package:pak_manager/util/mod/Mod.dart';

class ModList {
  static List<Mod> get all {
    List<Mod> rtn = List.empty(growable: true);
    for (FileSystemEntity entity in Directory.current.listSync()) {
      try {
        if (File(entity.path).existsSync()) {
          var m = Mod(entity.path);
          if (m.isMod == true) {
            rtn.add(m);
          }
        }
      } catch (e) {}
      List<String> dpath = entity.path.split(Platform.pathSeparator);
      dpath = (dpath
              .join(Platform.pathSeparator)
              .replaceAll(Platform.pathSeparator + 'Disabled', '')
              .replaceAll(Directory.current.path,
                  Directory.current.path + Platform.pathSeparator + 'Disabled'))
          .split(Platform.pathSeparator);
      if (Directory(dpath.join(Platform.pathSeparator)).existsSync()) {
        for (FileSystemEntity entity2
            in Directory(dpath.join(Platform.pathSeparator)).listSync()) {
          try {
            for (FileSystemEntity entity3
                in Directory(entity2.path).listSync()) {
              var m = Mod(entity3.path);
              if (m.isMod == true) {
                rtn.add(m);
              }
            }
          } catch (e) {}
          var m = Mod(entity2.path);
          if (m.isMod == true) {
            rtn.add(m);
          }
        }
      }
      if (Directory(entity.path).existsSync()) {
        for (FileSystemEntity entity2 in Directory(entity.path).listSync()) {
          try {
            for (FileSystemEntity entity3
                in Directory(entity2.path).listSync()) {
              var m = Mod(entity3.path);
              if (m.isMod == true) {
                rtn.add(m);
              }
            }
          } catch (e) {}
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
