# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| group_name         | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| area_id            | integer | null: false               |
| theme_id           | integer | null: false               |
| group_introduction | text    |                           |

### Association

- has_many :albums
- has_many :memories
- has_many :comments

## albums テーブル

| Column         | Type       | Options                        |
| -------------- | -----------| ------------------------------ |
| name           | string     | null: false                    |
| content        | text       | null: false                    |
| area_id        | integer    | null: false                    |
| theme_id       | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :memories
- has_many   :comments

## memories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| title    | string     | null: false                    |
| text     | text       | null: false                    |
| date     | date       | null: false                    |
| user     | references | null: false, foreign_key: true |
| album    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :album

## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user     | references | null: false, foreign_key: true |
| album    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :album