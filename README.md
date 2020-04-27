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
users table
|name|null: false|string|
|email|null: false defalt|string|
|encrypted_password|null: false defalt|string|
|family_name|null: false|string|
|first_name|null: false|string|
|family_name_kana|null: false|string| 
|first_name_kana|null: false|string|
|birth_day|null: false|date|
|reset_password_token|string|
|reset_password_sent_at|datetime

Association
has_many :comments, dependent: :destroy
has_many :item, dependent: :destroy
has_many :like
has_many :user_rate
has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
has_one :profile, dependent: :destroy
has_one :card, dependent: :destroy

profiles table
|post_code|null: false|integer|
|tel_number| |integer|
|prefecture|null: false|string|
|city|null: false|string|
|address|null: false|string|
|bullding| |string|
|image| |string|
|user_id|null: false|reference|

Association
belongs_to :user

cards table
|user_id|null: false|integer|
|custumer_id|null: false|string|
|card_id|null: false|string|

Association
belong_to :user

user_rates
|user_id|null: false fk true|reference|
|item_id|null: false fk true|reference|
|rate|null: false|string|

Association
belong_to :user


item table
|name|null: false|string|
|price|null: false|integer|
|status|null: false|integer|
|brand_id|null: false|reference|
|buyer_id|null: false|reference|
|delivery_payer_id|null: false|reference|
|category_id|null: false|reference|
|user_id|null: false|reference|
|item_image_id|null: false|reference|
|size_id| |reference|
|delivary_mathod|null: false|string|
|delivary_form_location|null: false|string|
|item_explanation|null: false|text|
|preparation_day|null: false|integer|

Association
has_many :comments, dependent: :destroy
has_many :like
has_many :item_imges, dependent: :destroy
has_one :user_evaluation
has_many :category
hans_many :size
hans_many :brand
belongs_to :buyer, class_name: "User"

like table
|user_id|null: false|reference|
|item_id|null: false|reference|

Association
belong_to :user
belong_to :item

comments table
|comments| |text|
|user_id|null: false|reference|
|item_id|null: false|reference|

Association
belong_to :user
belong_to :item

category table
|name|null: false|string|
|ancestry|

Association
belong_to :item

brands table
|bame| |string|

Association
belong_to :item

item_image table
|image|null: false|string|

Association
belong_to :item

size table
|size|null: false|string|

Association
belong_to :item
