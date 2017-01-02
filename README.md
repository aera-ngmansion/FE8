# FE8
自作パッチ置き場(追加順？)

###Lループ/toggle_L
敵にカーソルを合わせてLを押すと、敵を順繰りする

###戦闘曲変更/battle_changer
章によって戦闘曲を変えることが出来ます

###サウンドプレイヤー拡張/sound_break
サウンドルームのランダム再生を最大127から最大255曲に増やします

###魔力分離パッチ/maryoku
ステータスに魔力を加えます

###変身アニメ追加/TransformEA
マムクートの変身アニメ等、ちょっと動きのあるアニメを作れます

###イベント宝箱復活/TrapTreasure
開けるとイベントが発生する宝箱を作れます

###指揮官AI修正/LeaderAIFix
自分の指揮官以外が倒されても突撃AIに変わってしまうバグを修正

###スーパーストーカー/SS
指揮官に追従するAIを追加します

###会話リスト表示/TalkList
蒼炎の軌跡風、会話があるユニットを確認出来る機能です

###呼魔パッチ/koma
4ターンおきに召喚+レベルで呼び出す魔物変更

###Lボタンでアニメオンオフ切り換え/AnimationSettingSwitch
蒼炎以降にある機能です

###ソート修正/SortFix
「部隊」でレベル順にソートした際の機能を修正

###捕獲パッチ/hokaku
トラキアの捕獲みたいな感じのを実現します

###章表記拡張パッチ/gaidengaiden
章表記に関する部分を書き換えやすくします

###指南パッチ/shinan
FWDS2の作戦会議室風なものを作れます


# EventAssemblerの使い方
[ダウンロードする](http://feuniverse.us/t/event-assembler/1749)
![Demo](http://i.imgur.com/mqOX0fz.png)

##Stirlingで空き領域アドレスをチェック
![Demo](http://i.imgur.com/pw8gSRk.png)

##EA.txtを開き、空き領域を指定
![Demo](http://i.imgur.com/8kQXLwE.png)
![Demo](http://i.imgur.com/uBfFf4L.png)

##パッチを当てる
![Demo](http://i.imgur.com/SuT7Vsp.png)

上に"EA.txt"下に"改造したいロム"をいれ、「Assemble」で終了。

# Event Assemblerの更新
Event Assembler内の”Pointer.txt”に追記をする。パスは”Event Assembler\Language Raws\Pointer.txt”。

![Demo](http://i.imgur.com/dvMrOHk.png)

    ##Makes a GBA pointer pointing to offset without requiring word alignment.
    POIN2, 0, 4, -game:FE6:FE7:FE8 -repeatable -priority:pointer -indexMode:8 -offsetMod:1
    ##Offset to point to.
      Offset, 0, 4, -pointer:unknown

##データテーブルの変更
同じように。パスは"Event Assembler\EA Standard Library\Chapter Structure Helpers.txt"

![](http://i.imgur.com/6IjQdR2.png)  
    0x907BC8  
本来は烈火の指定部分だが、Event Assemblerはデフォルトの指定が烈火であるので、ここを書き換える。  
気になる人は、正しく下の聖魔の指定を書き換えると良い。もしくは、両方を書き換えれば間違いがない。