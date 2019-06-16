# RusBoot
(Format:UTF-8)  
Rustで書かれたUEFI アプリケーション(or ブートローダ)

## 対応命令セット
* x86_64

## ライセンス
Copyright 2019 PG_MANA  

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

なお、bin/x86_64/OVMFにはEDK2( https://github.com/tianocore/edk2 )を使用したバイナリが含まれます。
bib/x86_64/OVMF以下のライセンスについては、 bin/x86_64/OVMF/license.txt を参照してください。

## ビルド
### 環境整備
必要なソフトウェア

* make
* xargo

### ビルド

```shell
make
#これでtarget/x86_64-unknown-uefi/debug/rusboot.efiができています

make run
#要:qemu-system-x86_64

make clean
#中間ファイル削除
```

## コーディング規約
基本は https://doc.rust-lang.org/1.1.0/style/style/naming/README.html に従ってください。
コード整形はrustfmtを使用します。  
(本人が守れてないかも)

## リンク
### 開発者のTwitterアカウント
  [https://twitter.com/PG_MANA_](https://twitter.com/PG_MANA_)
### 開発者のWebページ
  https://pg-mana.net
### OS Wiki
  https://soft.taprix.org/wiki/oswiki/
