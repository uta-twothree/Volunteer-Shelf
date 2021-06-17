# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| area_id            | integer | null: false               |
| theme_id           | integer | null: false               |
| birthday           | date    | null: false               |
| self_introduction  | text    |                           |

### Association

- has_many :album_users
- has_many :albums, through: :album_users
- has_many :memories

## albums テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| name           | string     | null: false                    |
| content        | text       | null: false                    |
| area_id        | integer    | null: false                    |
| theme_id       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- has_many :album_users
- has_many :users, through: :album_users
- has_many :memories

## album_users テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| album    | references | null: false, foreign_key: true |

### Association

- belongs_to :album
- belongs_to :user

## memories テーブル

| Column   | Type   | Options     |
| -------- | -------| ----------- |
| title    | string | null: false |
| text     | text   | null: false |
| date     | date   | null: false |

### Association

- belongs_to :user
- belongs_to :album
