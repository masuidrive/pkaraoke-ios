# パワポカラオケ用アプリ for iOS

パワポカラオケをするためのアプリ。

iPhoneとかにインストールして、LightingやUSB-Cから外部モニタに繋いで使ってね。


# History
## 2019/07/27 箱根合宿にて開発開始
### せっかくなのでiOS13から使えるSwiftUIを使って書いてみる
- iOS13でexternal displayを使う方法を書いているところが全然見当たらない
- `UIScene.willConnectNotification`で`UIWindowScene`を受け取って`UIWindow().windowScene`に入れた
- `PresentationWindowManager.swift`を参照してね

### ギブアップポイント
- デバイスのViewと外部ディスプレイのViewの間でBindableObjectを共有するいい方法が思い付かずタイムアップ

### iOS13 beta4 + iPadProの制約
- iOS13 beta4の制限によりiPro Pro(USB-C)で外部ディスプレイが動かない
- シミュレータとiPod Touchで動作を確認
