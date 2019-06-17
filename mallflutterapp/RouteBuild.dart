import 'dart:io';
import 'package:process_run/process_run.dart';
import 'package:process_run/shell.dart';

class RouteBuild{
}

main() async {
  //当前系统的命令行，例如Windoes命令行Nslookup www.baidu.com
//  Process.run('flutter packages pub run build_runner clean',[''], runInShell: true).then((ProcessResult results) {
//    print(results.stdout);
//    Process.run('flutter packages pub run build_runner build --delete-conflicting-outputs',[''], runInShell: true).then((ProcessResult results) {
//      print(results.stdout);
//      Process.run('flutter run',[''], runInShell: true).then((ProcessResult results) {
//        print(results.stdout);
//      });
//    });
//  });

 // Process.run('bash', ['-c', 'echo hello | pbcopy'],runInShell: true);
  Shell shell = new Shell();
  await shell.run('''flutter packages pub run build_runner clean''');
  await shell.run('''flutter packages pub run build_runner build --delete-conflicting-outputs''');
  await run('flutter', ['run'],verbose: true);
  print(Directory.current.path);
}



