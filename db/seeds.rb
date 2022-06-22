# frozen_string_literal: true

User.create_with(password: 'password').find_or_create_by!(email: 'admin@bananacoding.com')
User.create_with(password: 'password').find_or_create_by!(email: 'user@bananacoding.com')

types = [{ type_name: 'โทรศัพท์มือถือ' },
         { type_name: 'เครื่องใช้ไฟฟ้า' },
         { type_name: 'สัตว์เลี้ยง' },
         { type_name: 'เครื่องแต่งกาย' },
         { type_name: 'กุญแจ' },
         { type_name: 'แว่นตา' },
         { type_name: 'หนังสือ' },
         { type_name: 'เครื่องประดับ' },
         { type_name: 'กระเป๋า' },
         { type_name: 'อื่นๆ' }]

types.each do |t|
  Type.find_or_create_by(t)
end
