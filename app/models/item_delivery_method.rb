class ItemDeliveryMethod < ActiveHash::Base
  self.data = [
    {id: 1, way: "未定"}, {id: 2, way: "クロネコヤマト"}, {id: 3, way: "ゆうパック"},
    {id: 4, way: "ゆうメール"}
  ]
end