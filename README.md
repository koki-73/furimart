# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

## users table
|Column|Type|Options|
|------|----|-------|
|nicname|string|null: false|
|email|string|null: false defalt|
|encrypted_password|string|null: false defalt|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|reset_password_token|string| |
|reset_password_sent_at|datetime| |

### Association
- has_many :comments, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :likes
- has_many :user_rates
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :profile, dependent: :destroy
- has_one :card, dependent: :destroy

## profiles table
|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|tel_number|integer| |
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|bullding|string| |
|image|string| |
|user_id|reference|null: false|

### Association
- belongs_to :user

## credit_cards table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|custumer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user

## user_rates
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false fk true|
|item_id|reference|null: false fk true|
|rate|string|null: false|

### Association
- belongs_to :user


## items table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|status|integer|null: false|
|brand_id|reference|null: false|
|buyer_id|reference|fk true|
|delivery_payer_id|reference|null: false|
|category_id|reference|null: false|
|user_id|reference|null: false|
|size_id|reference| |
|delivery_method|string|　|
|delivery_from_location|string|　|
|item_explanation|text|null: false|
|preparation_day|integer|null: false|

### Association
- has_many :comments, dependent: :destroy
- has_many :likes
- has_many :item_images, dependent: :destroy
- belongs_to :category
- belongs_to :size
- belongs_to :brand
- belongs_to :buyer, class_name: "User"

## likes table
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|item_id|reference|null: false|

### Association
- belongs_to :user
- belongs_to :item

## comments table
|Column|Type|Options|
|------|----|-------|
|comments|text|null: false|
|user_id|reference|null: false|
|item_id|reference|null: false|

### Association
- belongs_to :user
- belongs_to :item

## categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|

### Association
- has_many :items

## brands table
|Column|Type|Options|
|------|----|-------|
|name|string| |

### Association
- has_many :items

## item_images table
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|reference|null: false|

### Association
- belongs_to :item

## sizes table
|Column|Type|Options|
|------|----|-------|
|size|string|null: false|
|item_id|reference|null: false|

### Association
- has_many :items
