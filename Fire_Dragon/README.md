#古の火竜パッチ

烈火の剣より古の火竜のアニメを導入します。  
0x26BE0バイトほどを使います。

##使い方
###火竜アニメ3つに空きアニメIDを割り振る  

挿入するアニメIDを指定する必要があります  
デフォルトではFD,FE,FFとなっています  

"/anime/Dragon Installer.event"のようになっている"Installer.event"が1つアニメデータです。これをテキストエディタで開くと"AnimTableEntry(0xFD)"という行がありますので、これを好きなIDに変えます。3つとも好きなIDに変えて下さい。
　なおアニメID0x100以上には未対応です。

###変身拡張リストを編集する  

"\Transform\EA.txt"を開いて下さい。

デフォルトでは  
* 【3D】のクラス(マムクート)が  
* 【AA】のアイテム(竜石)を使用する時に  
* 【FE】のアニメで変身  
* 【FD】のアニメで攻撃  
* 【FF】のアニメで変身解除  
* 【FD】のアニメに戻る  
と設定されております。

これをお好きに変えて下さい。[詳説](https://github.com/ngmansion/FE8/tree/master/TransformEA#変身拡張パッチea)は元パッチの解説で。



##使ったもの
ST Jack - 古の火竜  
circleseverywhere - AnimationAssembler  
FE8変身拡張パッチ  