# CloneDetector
iOSDC2020 の発表の内容をベースに実装したコードクローン検出器です。
トークンベースでtype-2のコードクローンを検出します。

## Build
```sh
$ swift build -c release
```
これを実行すると、`.build/release/CloneDetector`という実行ファイルが生成されます。

## Usage
サンプルプログラムに対する実行は以下の通りです。

```sh
$ .build/release/CloneDetector Sample
.../iOSDC-2020/sample-code/CloneDetector/Sample/Hoge.swift:1:26: warning: コードクローンの可能性があります
.../iOSDC-2020/sample-code/CloneDetector/Sample/Fuga.swift:2:22: warning: コードクローンの可能性があります
.../iOSDC-2020/sample-code/CloneDetector/Sample/Hoge.swift:3:25: warning: コードクローンの可能性があります
.../iOSDC-2020/sample-code/CloneDetector/Sample/Fuga.swift:4:29: warning: コードクローンの可能性があります
```

Xcode 上で警告を出す場合は BuildPhase Script に以下を追加して、ビルドしてください。

```sh
$ {CloneDetectorへの実行パス}/CloneDetector $SRCROOT/{クローン検出したいディレクトリへの相対パス}
``` 
