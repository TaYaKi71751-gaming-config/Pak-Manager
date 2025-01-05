import 'dart:io';

class Mod {
  String? path;
  Mod(String this.path);

  bool get status {
    if (File(this.path!).existsSync()) {
      if (this.path!.endsWith('.pak.disabled')) {
        return false;
      }
    }
    if (File(this.path!).existsSync()) {
      if (this.path!.endsWith('.pak')) {
        return true;
      }
    }
    return false;
  }

  set status(bool stat) {
    String? from, to;
    if (stat == true) {
      from = '.pak.disabled';
      to = '.pak';
    } else if (stat == false) {
      from = '.pak';
      to = '.pak.disabled';
    }
    if (File(this.path!).existsSync()) {
      if (this.path!.endsWith(to!)) {
      } else if (this.path!.endsWith(from!)) {
        File(this.path!).renameSync(
            this.path!.substring(0, this.path!.length - from.length) + to);
      }
    }
  }

  get isMod {
    if (File(this.path!).existsSync()) {
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
