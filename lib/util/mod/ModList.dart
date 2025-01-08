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
						List<String> dpath = entity.path.split(Platform.pathSeparator);
						dpath = (dpath.join(Platform.pathSeparator).replaceAll(Platform.pathSeparator + 'Disabled', '').replaceAll(Directory.current.path, Directory.current.path + Platform.pathSeparator + 'Disabled')).split(Platform.pathSeparator);
						if(Directory(dpath.join(Platform.pathSeparator)).existsSync()){
							print(dpath);
							 for (FileSystemEntity entity2 in Directory(dpath.join(Platform.pathSeparator)).listSync()) {
									print(entity2.path);
									for (FileSystemEntity entity3 in Directory(entity2.path).listSync()) {
										var m = Mod(entity3.path);
										if (m.isMod == true) {
											rtn.add(m);
										}
									}
									var m = Mod(entity2.path);
									if (m.isMod == true) {
										rtn.add(m);
									}
								}
						}
      if (Directory(entity.path).existsSync()) {
							try {
        for (FileSystemEntity entity2 in Directory(entity.path).listSync()) {
									try {
									 for(FileSystemEntity entity3 in Directory(entity2.path).listSync()){
          var m = Mod(entity3.path);
          if (m.isMod == true) {
            rtn.add(m);
          }

										}
									} catch (e){}
          var m = Mod(entity2.path);
          if (m.isMod == true) {
            rtn.add(m);
          }
									
        }
							}catch(e){}
      }
    }
    return rtn;
  }
}
