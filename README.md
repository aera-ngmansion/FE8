# FE8
自作パッチ置き場(追加順？)

###上限突破パッチ/break_save
習得可能武器が4種以下になる代わりにステータス上限が突破できます

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

##パッチを当てる
![Demo](http://i.imgur.com/DSwzAjZ.png)

上に"txt"下に"改造したいロム"をいれ、「Assemble」で終了。

# Event Assemblerの更新
Event Assembler内の”Pointer.txt”に追記をする。パスは”Event Assembler\Language Raws\Pointer.txt”。

![Demo](http://i.imgur.com/dvMrOHk.png)

    ##Makes a GBA pointer pointing to offset without requiring word alignment.
    POIN2, 0, 4, -game:FE6:FE7:FE8 -repeatable -priority:pointer -indexMode:8 -offsetMod:1
    ##Offset to point to.
      Offset, 0, 4, -pointer:unknown

##データテーブルの変更
同じように。パスは"Event Assembler\EA Standard Library\Chapter Structure Helpers.txt"

![](http://i.imgur.com/xtaI1w6.png)  
    0x907BC8  

##頻出イベント指定
2カ所あります。パスは"Event Assembler\EA Standard Library\Main Code Helpers.txt"

![](http://i.imgur.com/iMgGkSP.png)

```
#ifdef _FE8_
#define Village(eventID,offset,X,Y,breakID) 	"VILL eventID offset [X,Y] 0x10; LOCA breakID [X,Y-1] 0x20"
#define House(eventID,offset,X,Y) 		"LOCA eventID offset [X,Y] 0x10"
#define Armory(offset,X,Y) 				"SHOP 0 offset [X,Y] 0x16"
#define Vendor(offset,X,Y) 				"SHOP 0 offset [X,Y] 0x17"
#define SecretShop(offset,X,Y) 			"SHOP 0 offset [X,Y] 0x18"
#define Chest(item,X,Y) 				"CHES 0 item [X,Y] 0x14"
#define ChestMoney(amountOfMoney,X,Y) 	"CHES 0 0x77+amountOfMoney*0x10000 [X,Y] 0x14"
#define Door(X,Y) 						"DOOR 0 [X,Y] 0x12"
#define Seize(eventID,offset,X,Y) 		"LOCA eventID offset [X,Y] 0x11"
#endif
```

![](http://i.imgur.com/a1whGSX.png)  

```
#ifdef _FE8_
#define VillageEventItem(textID,background,item) "MUSI; SMOV 0x2 background; SMOV 0x3 textID; CALL $A60448; MUNO; CALL $5B9D24; SMOV 0x3 item; _GIVEITEMTO 0xFFFF; EVBIT_T 0x7; ENDA"
#define VillageEventMoney(textID,background,money) "MUSI; SMOV 0x2 background; SMOV 0x3 textID; CALL $A60448; MUNO; CALL $5B9D24; SMOV 0x3 money; _GIVEITEMTO2 0; EVBIT_T 0x7; ENDA"
#define HouseEvent(textID,background) "MUSI; SMOV 2 background; SMOV 3 textID; CALL $A60448; MUNO; EVBIT_T 0x7; ENDA"
#define ConvoEvent(textID) "MUSI; TEXTSTART; TEXTSHOW textID; TEXTEND; REMA; MUNO; EVBIT_T 0x7; ENDA"
#define GiveMoney(amount) "SMOV 0x3 amount; _GIVEITEMTOMAIN 0x0"
#endif
```
##離脱地点ポインタ設定
パスは"Event Assembler\EA Standard Library\Escape Point.txt"

![](http://i.imgur.com/J5Qg1xQ.png)

```
#ifdef _FE8_

#ifndef EscapePointTableOffset
#define EscapePointTableOffset 0x5D2090
#endif

#ifndef NPCEscapePointTableOffset
#define NPCEscapePointTableOffset 0x5D2194
#endif

#endif
```

##会話用マクロ設定
パスは"Event Assembler\EA Standard Library\Convo Helpers.txt"

![](http://i.imgur.com/5yDcqjG.png)

```
#ifdef _FE8_
#define Text(text) "TEXTSTART; TEXTSHOW text; TEXTEND; REMA"
#define Text(background,text) "_SETVAL 2 background; _SETVAL 3 text; CALL $A60448"
#define SetBackground(background) "SVAL 2 background; CALL $A60420" //EVBIT 0x8 = fade in?
#define ClearBackground "CALL 0xA603FC"
#define ClearBackgroundSmooth "FADI 0x10; ClearBackground"
#define CenterTutorialTextBox "_SETVAL 0xB 0xFFFFFFFF"
#define FlashWhite "FAWI 0x20; STAL 0x10; FAWU 0x20"
#define FlashBlack "FADI 0x20; STAL 0x10; FADU 0x20"
#endif
```

##ASM会話設定
パスは"Event Assembler\Language Raws\Main codes\Character based events.txt"
```
CHARASM, 0x4, 16, -game:FE8:FE7 -indexMode:8 -priority:main
	Event ID, 2, 2
	Event pointer, 4, 4, -pointer:none
##Character to start the event.
	Character 1, 8, 1
##The other character.
	Character 2, 9, 1
	ASM pointer, 12, 4, -pointer:ASM

CHARASM, 0, 4, -priority:main -language:FE8:FE7 -end -indexMode:8 -noDisassembly
	0, 0, 4, -fixed
```

##ASM常時条件設定
パスは"Event Assembler\Language Raws\Main codes\Others.txt"
```
##Event that only happens if the ASM routine returns true.
ASME, 0xE, 12, -game:FE8:FE7 -priority:main -indexMode:8
##Event ID of the event. After the event ID has been used,
##this event can't be invoked. Leaving this 0 will allow event to
##whenever otherwise possible.
	Event ID, 2, 2
##Pointer to event to happen.
	Pointer to event, 4, 4, -pointer
##ASM routine to run that must return 1 for the this event to happen.
##Thumb routines must also have 1 added to their offset.
	ASM Pointer, 8, 4, -pointer
```
