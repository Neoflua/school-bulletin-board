# 学校・学習掲示板

学校や学習に関わる掲示板アプリケーションです。匿名での投稿が可能で、学生生活や学習に関する悩み、体験談、アドバイスを共有できます。

## 🎯 主な機能

### カテゴリ一覧
1. **休学・留年体験談** - 休学・留年の理由と復帰方法
2. **資格勉強法シェア** - TOEIC、簿記、ITパスポートなどの勉強法
3. **ゼミ・研究室の実態掲示板** - 雰囲気、忙しさ、教授の人柄
4. **履修相談掲示板** - オススメ科目、テストの傾向
5. **就職活動・インターン経験談** - 正直な体験談
6. **大学編入・大学院進学体験談** - 編入試験、院試の対策法
7. **学習障害・発達特性×学び** - 困りごとや支援制度の情報
8. **通信制大学・夜間大学の体験談** - 働きながら学ぶ人の声
9. **語学学習法掲示板** - 英語、韓国語、中国語などの学習法
10. **試験前の応援・雑談板** - 不安や孤独感を減らす雑談場所

### CRUD機能
- **Create（作成）**: 新規投稿・コメント作成
- **Read（読み取り）**: 投稿一覧・詳細表示
- **Update（更新）**: 投稿編集
- **Delete（削除）**: 投稿・コメント削除

### その他の機能
- 🔍 **検索機能**: キーワード・カテゴリ別検索
- 🏷️ **匿名投稿**: 安心して投稿可能
- 📱 **レスポンシブデザイン**: スマートフォン・タブレット対応
- 🎨 **モダンなUI**: Bootstrap 5 + カスタムCSS

## 🛠️ 技術スタック

- **フレームワーク**: Ruby on Rails 8.0.2
- **データベース**: SQLite3
- **フロントエンド**: Bootstrap 5.3, DartSass
- **JavaScript**: Turbo, Stimulus
- **ページネーション**: Kaminari
- **フォント**: Google Fonts (Inter)
- **アイコン**: Font Awesome

## 🚀 セットアップ

### 前提条件
- Ruby 3.4.5以上
- Rails 8.0.2以上
- Bundler

### インストール手順

1. リポジトリをクローン
```bash
git clone <repository-url>
cd school_bulletin_board
```

2. 依存関係をインストール
```bash
bundle install
```

3. データベースをセットアップ
```bash
rails db:create
rails db:migrate
rails db:seed
```

4. サーバーを起動
```bash
bundle exec rails server -p 3000
```

5. ブラウザでアクセス
```
http://localhost:3000
```

## 📁 プロジェクト構造

```
app/
├── controllers/          # コントローラー
│   ├── home_controller.rb
│   ├── categories_controller.rb
│   ├── posts_controller.rb
│   ├── comments_controller.rb
│   └── search_controller.rb
├── models/              # モデル
│   ├── category.rb
│   ├── post.rb
│   └── comment.rb
├── views/               # ビュー
│   ├── home/
│   ├── categories/
│   ├── posts/
│   └── search/
└── assets/              # アセット
    └── stylesheets/
        └── application.scss
```

## 🎮 ゲーム関連コードについて

**注意**: ゲーム関連のコードは掲示板アプリから分離され、`../game_app/` ディレクトリに移動されています。

- ゲームコントローラー: `../game_app/game_controller.rb`
- ゲームJavaScript: `../game_app/game.js`

ゲーム機能が必要な場合は、別途統合してください。

## 🔧 開発コマンド

```bash
# サーバー起動
bundle exec rails server

# コンソール起動
bundle exec rails console

# テスト実行
bundle exec rails test

# データベースリセット
bundle exec rails db:reset
```

## 📝 使用方法

1. **投稿を閲覧**: ホームページで最新投稿を確認
2. **カテゴリ選択**: 興味のあるカテゴリを選択
3. **投稿作成**: 体験談や質問を投稿
4. **コメント投稿**: 他の投稿にコメント
5. **検索**: キーワードやカテゴリで検索

## 🤝 貢献

1. このリポジトリをフォーク
2. フィーチャーブランチを作成 (`git checkout -b feature/amazing-feature`)
3. 変更をコミット (`git commit -m 'Add amazing feature'`)
4. ブランチにプッシュ (`git push origin feature/amazing-feature`)
5. プルリクエストを作成

## 📄 ライセンス

このプロジェクトはMITライセンスの下で公開されています。

## 👨‍💻 作者

学校・学習掲示板開発チーム

---

**注意**: このアプリケーションは教育目的で作成されています。実際の運用には適切なセキュリティ対策とモデレーション機能の追加が必要です。
