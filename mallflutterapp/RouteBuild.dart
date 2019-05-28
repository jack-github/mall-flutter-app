import 'dart:io';

class RouteBuild{
}

main(){
//  //当前系统的命令行，例如Windoes命令行Nslookup www.baidu.com
//  Process.run('flutter packages pub run build_runner clean',[''], runInShell: true).then((ProcessResult results) {
//    print(results.stdout);
//    Process.run('flutter packages pub run build_runner build --delete-conflicting-outputs',[''], runInShell: true).then((ProcessResult results) {
//      print(results.stdout);
//      Process.run('flutter run',[''], runInShell: true).then((ProcessResult results) {
//        print(results.stdout);
//      });
//    });
//  });

  Process.run('bash', ['-c', 'echo hello | pbcopy'],runInShell: true);

}



