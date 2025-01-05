import 'dart:io';

class Mod {
  String? path;
  Mod(String this.path);

  bool get status {
    if (File(this.path!).existsSync()) {
      if (this.path!.contains('/Disabled')) {
        return false;
      }
    }
    if (File(this.path!).existsSync()) {
      if (!this.path!.contains('/Disabled')) {
        return true;
      }
    }
    return false;
  }

  set status(bool stat) {
    String? from, to;
    if (stat == true) {
      from = this.path!.replaceAll('/Disabled', '').replaceAll(Directory.current.path,Directory.current.path + '/Disabled');
      to = this.path!.replaceAll('/Disabled', '');
    } else if (stat == false) {
      to = this.path!.replaceAll('/Disabled', '').replaceAll(Directory.current.path,Directory.current.path + '/Disabled');
      from = this.path!.replaceAll('/Disabled', '');
    }
				print(this.path! + '\n' + from! + '\n' + to!);
					 List<String> _path = this.path!.replaceAll('/Disabled', '').replaceAll(Directory.current.path, Directory.current.path + '/Disabled').split('/');
						_path[_path.length - 1] = '';
					 Directory(_path.join('/')).createSync(recursive: true);
						print(this.path!.endsWith(from));
      if (this.path == to) {
      } else if (this.path! == from!) {
							 File(from!).copySync(to!);
								File(from!).deleteSync();
      }
  }

  get isMod {
    if (File(this.path!).existsSync()) {
						var disabledPath = this.path!.replaceAll('/Disabled', '').replaceAll(Directory.current.path,Directory.current.path + '/Disabled');
						var enabledPath = this.path!.replaceAll('/Disabled', '');
						if (disabledPath.endsWith('.pak') && File(disabledPath).existsSync()){
							 return true;
						}
						if (enabledPath.endsWith('.pak') && File(enabledPath).existsSync()){
							 return true;
						}
      if (this.path!.endsWith('.pak.disabled')) {
        return true;
      }
      if (this.path!.endsWith('.pak')) {
        return true;
      }
    }
    return false;
  }
}
