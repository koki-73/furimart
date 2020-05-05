class ItemStatus < ActiveHash::Base
  self.data = [
    {id: 1, statu: "新品、未使用"}, {id: 2, statu: "未使用に近い"}, {id: 3, statu: "目立った傷や汚れなし"}, 
    {id: 4, statu: "やや傷や汚れあり"}, {id: 5, statu: "傷や汚れあり"}, {id: 6, statu: "全体的に状態が悪い"}
  ]
end
