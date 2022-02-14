# README

|記述すること|備考|
|----|----|
|アプリケーション名| |
|アプリケーション概要|このアプリケーションでできることを記述。|
|URL|デプロイ済みのURLを記述。デプロイが済んでいない場合は、デプロイが完了次第記述すること。|
|テスト用アカウント|ログイン機能等を実装した場合は、ログインに必要な情報を記述。またBasic認証等を設けている場合は、そのID/Passも記述すること。|
|利用方法|このアプリケーションの利用方法を記述。説明が長い場合は、箇条書きでリスト化すること。|
|アプリケーションを作成した背景|このアプリケーションを通じて、どのような人の、どのような課題を解決しようとしているのかを記述。|
|洗い出した要件|要件定義をまとめたスプレッドシートのリンクを記述。|
|実装した機能についての画像やGIFおよびその説明|実装した機能について、それぞれどのような特徴があるのかを列挙する形で記述。画像はGyazoで、GIFはGyazoGIFで撮影すること。|
|実装予定の機能|洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記述。|
|データベース設計|ER図を添付。|
|画面遷移図|画面遷移図を添付。|
|開発環境|使用した言語・サービスを記述。|
|ローカルでの動作方法|git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記述。|



# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association
- has_many :menus, through: :favorites
- has_many :comments
- has_many :favorites


## menus テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| advice_text | text       | null: false                    |
| hour_id     | integer    | null: false                    |
| food_first  | text       | null: false                    |
| food_second | text       |                                |
| spice       | text       | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user, through: :favorites
- has_many :comments
- has_one :step
- has_many :favorites

## comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| menu         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :menu

## steps テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| step_text    | text       | null: false                    |
| step_number  | integer    | null: false                    |
| menu         | references | null: false, foreign_key: true |

### Association
- belongs_to :menu


## favorites テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| menu          | references | null: false, foreign_key: true |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :menu