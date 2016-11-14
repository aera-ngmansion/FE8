#古の火竜パッチ

烈火の剣より古の火竜のアニメを導入します。  
0x26BE0バイトほどを使います。

###使い方
1. 火竜アニメ3つに空きアニメIDを割り振る  

挿入するアニメIDを指定する必要があります  
デフォルトではCA,CB,CCとなっています  

"/anime/Dragon Installer.event"のようになっている"Installer.event"が1つアニメデータです。これをテキストエディタで開くと"AnimTableEntry(0xCA)"という行がありますので、これを好きなIDに変えます。3つとも好きなIDに変えて下さい。
　なおアニメID0x100以上には未対応です。

2. 変身拡張リストを編集する  

"/Transform/EA.txt"を開いて下さい。

デフォルトでは  
* 【3D】のクラス(マムクート)が  
* 【AA】のアイテム(竜石)を使用する時に  
* 【CB】のアニメで変身  
* 【CA】のアニメで攻撃  
* 【CC】のアニメで変身解除  
* 【CA】のアニメに戻る  
と設定されております。

これをお好きに変えて下さい。詳細は元パッチの解説で。

3. 空き領域を指定する  
"/EA.txt"を開きます。
"#define Free_Space 0x1000000"の"0x1000000"を空いているアドレスに変えて下さい。重ねて言いますが0x26BE0バイトほど使います。

4. EventAssemblerを使う  
"/EA.txt"を読み込んで下さい




###使ったもの
ST Jack - 古の火竜  
circleseverywhere - AnimationAssembler  
FE8変身拡張パッチ  