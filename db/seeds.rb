# frozen_string_literal: true

User.create_with(password: 'password').find_or_create_by!(username: 'admin', email: 'admin@bananacoding.com',
                                                          is_admin: true)

u1 = User.create_with(password: 'password').find_or_create_by!(username: 'user1', email: 'user1@bananacoding.com')
u2 = User.create_with(password: 'password').find_or_create_by!(username: 'user2', email: 'user2@bananacoding.com')
u3 = User.create_with(password: 'password').find_or_create_by!(username: 'user3', email: 'user3@bananacoding.com')
u4 = User.create_with(password: 'password').find_or_create_by!(username: 'user4', email: 'user4@bananacoding.com')
u5 = User.create_with(password: 'password').find_or_create_by!(username: 'user5', email: 'user5@bananacoding.com')

t1 = Type.find_or_create_by(type_name: 'โทรศัพท์มือถือ')
t2 = Type.find_or_create_by(type_name: 'เครื่องใช้ไฟฟ้า')
t3 = Type.find_or_create_by(type_name: 'สัตว์เลี้ยง')
t4 = Type.find_or_create_by(type_name: 'เครื่องแต่งกาย')
t5 = Type.find_or_create_by(type_name: 'กุญแจ')
t6 = Type.find_or_create_by(type_name: 'แว่นตา')
t7 = Type.find_or_create_by(type_name: 'หนังสือ')
t8 = Type.find_or_create_by(type_name: 'เครื่องประดับ')
t9 = Type.find_or_create_by(type_name: 'กระเป๋า')
t10 = Type.find_or_create_by(type_name: 'อื่นๆ')

if Post.count < 40
  p1 = Post.new(user_id: u1.id, type_id: t1.id, name: 'มีใครเห็นไอโฟนแถวอ่างแก้วมั้ยครับ', category: 'lost_item',
                status: 'active', date: '2022-07-07', created_at: '2022-07-07', location: 'อ่างแก้ว มช',
                lat: 18.80540, lng: 98.95070, detail: 'ผมไปนั่งอยู่แถวๆตรงกลางๆของอ่างแก้วครับใครเจอติดต่อหาทีนะครับ')

  p2 = Post.new(user_id: u2.id, type_id: t2.id, name: 'ตามหาวิทยุจิ๋วค่ะ', category: 'lost_item',
                status: 'active', date: '2022-07-01', created_at: '2022-07-01',
                location: 'MAYA Lifestyle Shopping Center',
                lat: 18.80254, lng: 98.96698, detail: 'วิทยุจิ๋วทรงสี่เหลี่ยมผืนผ้าสีเงินรุ่นpanasonic')

  p3 = Post.new(user_id: u3.id, type_id: t3.id, name: 'ตามหาน้องแมวสีขาว', category: 'lost_item',
                status: 'active', date: '2022-07-10', created_at: '2022-07-10', location: 'One Nimman',
                lat: 18.80022, lng: 98.96828,
                detail: 'น้องเป็นเปอร์เซียสีขาวตาฟ้าใครอยู่แถวนี้แล้วเจอน้องบอกทีนะครับ')

  p4 = Post.new(user_id: u4.id, type_id: t4.id, name: 'มีคนเจอเสื้อเชิ้ตยีนแขนยาวบ้างมั้ยคะ',
                category: 'lost_item',
                status: 'active', date: '2022-06-28', created_at: '2022-06-28', location: 'ดอยสุเทพ',
                lat: 18.81637, lng: 98.89194, detail: 'อาจจะเผลอวางไว้ตรงไหนใครเห็นรบกวนทักมาหน่อยนะคะ')

  p5 = Post.new(user_id: u5.id, type_id: t5.id, name: 'กุญแจรถโตโยต้า', category: 'lost_item', status: 'active',
                date: '2022-07-03', created_at: '2022-07-03', location: 'ประตูท่าแพ', lat: 18.78775,
                lng: 98.99326, detail: 'ไปเดินแถวประตูท่าแพตอนเย็นๆครับกุญแจหล่นหายไปตอนไหนไม่รู้')

  p6 = Post.new(user_id: u1.id, type_id: t6.id, name: 'เจอแว่นสายตาทรงกลมกรอบสีทองครับ', category: 'found_item',
                status: 'active', date: '2022-06-22', created_at: '2022-06-22', location: 'One Nimman',
                lat: 18.80022, lng: 98.96828, detail: 'เจออยู่แถวร้าน Graph Cafe แถววันนิมมานครับ')

  p7 = Post.new(user_id: u2.id, type_id: t7.id, name: 'มีใครทำหนังสือนิยายเรื่องaaaหายไหมคะ',
                category: 'found_item',
                status: 'active', date: '2022-06-29', created_at: '2022-06-29', location: 'เซ็นทรัล เชียงใหม่',
                lat: 18.80654, lng: 99.01820, detail: 'เจอตรงโต๊ะที่ศูนย์อาหารค่ะเก็บไว้ให้แล้วเจ้าของทักมาได้เลยนะคะ')

  p8 = Post.new(user_id: u3.id, type_id: t8.id, name: 'เจอสร้อยคอลายโลมาสีฟ้าครับ', category: 'found_item',
                status: 'active', date: '2022-07-11', created_at: '2022-07-11',
                location: 'The Baristro at Ping River', lat: 18.81583, lng: 99.00025,
                detail: 'เจอตกอยู่ในคาเฟ่ครับของใครทักมาได้เลย')

  p9 = Post.new(user_id: u4.id, type_id: t9.id, name: 'ใครลืมกระเป๋าเป้สีดำไว้ตรงลานอะตอมมั้ยคะ',
                category: 'found_item', status: 'active', date: '2022-07-03', created_at: '2022-07-03',
                location: 'ลานอะตอม', lat: 18.80022, lng: 98.96828,
                detail: 'ฝากไว้กับคณะแล้วไปติดต่อรับได้เลยนะคะ')

  p10 = Post.new(user_id: u5.id, type_id: t10.id, name: 'เจอsmartwatchครับ', category: 'found_item',
                 status: 'active', date: '2022-07-06', created_at: '2022-07-06',
                 location: 'สนามกีฬาเทศบาลนครเชียงใหม่', lat: 18.80084, lng: 98.98950,
                 detail: 'ตกอยู่แถวๆทางวิ่งครับ')

  p1.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p2.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p3.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p4.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p5.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p6.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p7.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p8.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p9.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                   filename: '/default_image.png', content_type: 'image/png')
  p10.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                    filename: '/default_image.png', content_type: 'image/png')

  p1.save
  p2.save
  p3.save
  p4.save
  p5.save
  p6.save
  p7.save
  p8.save
  p9.save
  p10.save

  posts = [
    { user_id: u1.id, type_id: t1.id, name: 'มือถือซัมซุงหายครับ', category: 'lost_item',
      status: 'active', date: '2022-06-18', created_at: '2022-06-18',
      location: 'แสงชัยพาณิชย์ อะไหล่',
      lat: 18.79613, lng: 99.00609,
      detail: 'รุ่น samsung note 20 ultra ครับใครเจอทักมาหน่อยนะครับ' },

    { user_id: u2.id, type_id: t2.id, name: 'มีใครเจอtabletสีเงินแถวๆโรงอาหารใหม่มั้ยคะ',
      category: 'lost_item', status: 'active',
      date: '2022-06-04', created_at: '2022-06-04', location: 'ศูนย์อาหารมหาวิทยาลัยเชียงใหม่',
      lat: 18.79962, lng: 98.95153, detail: 'นั่งทานโซนชั้นบนค่ะ' },

    { user_id: u3.id, type_id: t3.id, name: 'น้องแมวสีดำหายไปหลายวันแล้วครับ',
      category: 'lost_item', status: 'active',
      date: '2022-06-12', created_at: '2022-06-12', location: 'ตลาดนัดวัดเจดีย์เหลี่ยม',
      lat: 18.75466, lng: 98.99585, detail: 'ใครเห็นน้องทักมาหน่อยนะครับ' },

    { user_id: u4.id, type_id: t4.id, name: 'ฮู้ดกันหนาวสีขาวหายแถวๆนิมมานค่ะ',
      category: 'lost_item', status: 'active',
      date: '2022-06-15', created_at: '2022-06-15', location: 'One Nimman',
      lat: 18.80022, lng: 98.96828, detail: 'น่าจะวางไว้ตรงที่นั่งรอใครเห็นทักมาหน่อยนะคะ' },

    { user_id: u5.id, type_id: t5.id, name: 'ตามหากุญแจสีเงินมีพวงกุญแจนกอ้วนห้อยอยู่ครับ',
      category: 'lost_item', status: 'active',
      date: '2022-06-19', created_at: '2022-06-19', location: 'วัดปราสาท',
      lat: 18.78974, lng: 98.98121, detail: 'นกอ้วนตัวใหญ่มากครับสีรุ้ง' },

    { user_id: u1.id, type_id: t6.id, name: 'แว่นกรอบเหลี่ยมหายครับ', category: 'lost_item',
      status: 'active',
      date: '2022-05-15', created_at: '2022-05-15', location: 'อู่ประยูรการช่าง',
      lat: 18.87558, lng: 99.01571, detail: 'ทรงเหลี่ยมๆกรอบสีดำครับ' },

    { user_id: u2.id, type_id: t7.id, name: 'ตามหาชีทเรียนวิชาเคมีค่ะ', category: 'lost_item',
      status: 'active',
      date: '2022-06-07', created_at: '2022-06-07', location: 'ตึกภาคเคมี มช',
      lat: 18.80195, lng: 98.95405, detail: 'น่าจะลืมไว้ในห้องเรียนใครเห็นติดต่อมานะคะ' },

    { user_id: u3.id, type_id: t8.id, name: 'หาหมวกแก็ปสีดำ adidas',
      category: 'lost_item', status: 'active',
      date: '2022-06-08', created_at: '2022-06-08', location: 'ก๋วยจั๊บเยาวราช',
      lat: 18.86946, lng: 99.01517, detail: 'อร่อยจนลืมหมวกเลยครับ' },

    { user_id: u4.id, type_id: t9.id, name: 'เป๋าตังหายแถวสนามบินมีใครเห็นมั้ยคะ',
      category: 'lost_item', status: 'active',
      date: '2022-06-17', created_at: '2022-06-17', location: 'ท่าอากาศยานเชียงใหม่',
      lat: 18.76632, lng: 98.96418, detail: 'มีบัตรสำคัญอยู่ในนั้นใครเจอทักมาหน่อยนะคะTT' },

    { user_id: u5.id, type_id: t10.id, name: 'ทำกระติกน้ำเก็บความเย็นสีน้ำเงินหายแถวสนามกีฬาครับ',
      category: 'lost_item', status: 'active',
      date: '2022-06-04', created_at: '2022-06-04', location: 'สนามกีฬาเทศบาลนครเชียงใหม่',
      lat: 18.80084, lng: 98.98950, detail: 'มีใครเห็นมั้ยครับแถวๆอัฒจันทร์' },

    { user_id: u1.id, type_id: t1.id, name: 'ทำแอร์พอดหายครับ', category: 'lost_item',
      status: 'active',
      date: '2022-06-02', created_at: '2022-06-02', location: 'โจ๊กสมเพชร',
      lat: 18.79513, lng: 98.98977, detail: 'อร่อยจนลืมหูฟังเลยครับใครเจอติดต่อมาหน่อยนะครับ' },

    { user_id: u2.id, type_id: t2.id, name: 'ตามหาไมโครเวฟค่ะ',
      category: 'lost_item', status: 'active',
      date: '2022-06-07', created_at: '2022-06-07', location: 'บิ๊กซี เชียงใหม่ 2',
      lat: 18.79861, lng: 99.02236, detail: 'ซื้อแล้วไปซื้อของอื่นต่อน่าจะลืมไว้ในรถเข็นค่ะ' },

    { user_id: u3.id, type_id: t3.id, name: 'ใครเจอน้องหมาบางแก้วสีขาวติดต่อมาทีครับ',
      category: 'lost_item', status: 'active',
      date: '2022-05-29', created_at: '2022-05-29', location: 'สนามกีฬาเทศบาลนครเชียงใหม่',
      lat: 18.80084, lng: 98.98950, detail: 'น้องชื่อบราวเป็นมิตรไม่กัดครับ ใครเจอติดต่อมาทีครับ' },

    { user_id: u4.id, type_id: t4.id, name: 'ใครพบหมวกน้องต่ายติดต่อมาหน่อยนะคะ',
      category: 'lost_item', status: 'active',
      date: '2022-06-23', created_at: '2022-06-23', location: 'หมูปิ้งน้องออมสิน สาขา2',
      lat: 18.75118, lng: 98.97901, detail: 'หมวกมีที่บีบแล้วหูจะเด้งๆค่ะ' },

    { user_id: u5.id, type_id: t5.id, name: 'กุญแจรถเทสล่าใครเจอรบกวนติดต่อมาหน่อยครับ',
      category: 'lost_item', status: 'active',
      date: '2022-06-21', created_at: '2022-06-21', location: 'MAYA Lifestyle Shopping Center',
      lat: 18.80254, lng: 98.96698, detail: 'เดินไปทุกชั้นเลยครับ' },

    { user_id: u1.id, type_id: t6.id, name: 'เจอแว่นสายตาทรงกลมครับเจ้าของทักมาได้เลย',
      category: 'found_item', status: 'active',
      date: '2022-06-19', created_at: '2022-06-19', location: 'Goodvibes Cafe-CNX',
      lat: 18.74046, lng: 98.97439, detail: 'ใครทำแว่นหายบ้างครับ' },

    { user_id: u2.id, type_id: t7.id, name: 'เจอชีทเรียนแคลเจ้าของติดต่อมาได้เลยค่ะ',
      category: 'found_item', status: 'active',
      date: '2022-06-24', created_at: '2022-06-24', location: 'ตึกภาควิชาคณิตศาสตร์',
      lat: 18.80343, lng: 98.95347, detail: 'เจออยู่ในห้อง1111แถวหลังๆค่ะ' },

    { user_id: u3.id, type_id: t8.id, name: 'เจอต่างหูรูปดาวครับ', category: 'found_item',
      status: 'active',
      date: '2022-06-13', created_at: '2022-06-13', location: 'แอนนิสต้า คาเฟ่',
      lat: 18.80343, lng: 98.95976, detail: 'เจอข้างเดียวครับดาวสีเหลือง' },

    { user_id: u4.id, type_id: t9.id, name: 'ใครลืมกระเป๋าสะพายไว้ตรงโรงอาหารใหม่ติดต่อมาได้เลยค่ะ',
      category: 'found_item', status: 'active',
      date: '2022-06-29', created_at: '2022-06-29', location: 'ศูนย์อาหารมหาวิทยาลัยเชียงใหม่',
      lat: 18.79962, lng: 98.95153, detail: 'เจออยู่แถวโซนที่นั่งด้านนอกค่ะ' },

    { user_id: u5.id, type_id: t10.id, name: 'เจอพวงกุญแจริลัคคุมะ', category: 'found_item',
      status: 'active',
      date: '2022-06-01', created_at: '2022-06-01', location: 'สวนดอกพาร์ค',
      lat: 18.78987, lng: 98.97078, detail: 'ของใครทักมาได้เลยครับ' },

    { user_id: u1.id, type_id: t1.id, name: 'เจอมือถือแถวโรงพยาบาลสวนดอกครับ',
      category: 'found_item', status: 'active',
      date: '2022-06-16', created_at: '2022-06-16', location: 'โรงพยาบาลมหาราชนครเชียงใหม่',
      lat: 18.79027, lng: 98.97405, detail: 'ไอโฟน13สีเงินครับ' },

    { user_id: u2.id, type_id: t2.id, name: 'เจอหม้อทอดไร้น้ำมันครับ',
      category: 'found_item', status: 'active',
      date: '2022-06-15', created_at: '2022-06-15', location: 'โลตัส เชียงใหม่คำเที่ยง',
      lat: 18.80890, lng: 98.99685, detail: 'กล่องใหม่ยังไม่ได้แกะเลยครับ' },

    { user_id: u3.id, type_id: t3.id, name: 'เจอน้องโกลเด้น', category: 'found_item',
      status: 'active',
      date: '2022-06-11', created_at: '2022-06-11', location: 'สวนสาธารณะหนองบวกหาด',
      lat: 18.78207, lng: 98.97940, detail: 'น้องวิ่งมาเล่นด้วยครับเจ้าของยังอยู่แถวนี้มั้ยครับ' },

    { user_id: u4.id, type_id: t4.id, name: 'มีใครทำเสื้อคลุมลายทันจิโร่หายไหมคะ',
      category: 'found_item', status: 'active',
      date: '2022-05-30', created_at: '2022-05-30', location: 'สักแก้ว สองแก้ว คาเฟ่',
      lat: 18.85370, lng: 99.06683, detail: 'ทานเสร็จเอาเสื้อกลับด้วยค่า ทักมาได้เลยนะคะ' },

    { user_id: u5.id, type_id: t5.id, name: 'เจอกุญแจรถอิซูซุครับ', category: 'found_item',
      status: 'active',
      date: '2022-06-09', created_at: '2022-06-09', location: 'แม็คโคร เชียงใหม่',
      lat: 18.78501, lng: 99.02845, detail: 'เจออยู่แถวๆโซนเครื่องครัวครับ' },

    { user_id: u1.id, type_id: t6.id, name: 'แว่นกันแดดใครหายครับ', category: 'found_item',
      status: 'active',
      date: '2022-06-14', created_at: '2022-06-14', location: 'น้ำตกห้วยแก้ว',
      lat: 18.81180, lng: 98.94453, detail: 'กรอบดำเลนส์ดำทรงสวยมากครับ' },

    { user_id: u2.id, type_id: t7.id, name: 'ใครทำไลท์โนเวลหายติดต่อมาเลยค่ะ',
      category: 'found_item', status: 'active',
      date: '2022-05-25', created_at: '2022-05-25', location: 'เซ็นทรัลเชียงใหม่ แอร์พอร์ต',
      lat: 18.76925, lng: 98.97518, detail: 'เจอแถวๆศูนย์อาหารค่ะ' },

    { user_id: u3.id, type_id: t8.id, name: 'เจอสร้อยข้อมือ gucci ครับ', category: 'found_item',
      status: 'active',
      date: '2022-05-17', created_at: '2022-05-17', location: 'เซ็นทรัลเชียงใหม่ แอร์พอร์ต',
      lat: 18.76925, lng: 98.97518, detail: 'เจอหน้า kfc ครับ' },

    { user_id: u4.id, type_id: t9.id, name: 'เจอกระเป๋าเงินมีสติ๊กเกอร์แพนด้าติดอยู่ค่ะ',
      category: 'found_item', status: 'active',
      date: '2022-05-18', created_at: '2022-05-18', location: 'โรงอาหาร CAMT',
      lat: 18.79925, lng: 98.95140, detail: 'เจอหน้าร้านน้ำเจ้าของทักมานะคะ' },

    { user_id: u5.id, type_id: t10.id, name: 'เจอฟิกเกอร์บีโม่ครับ', category: 'found_item',
      status: 'active',
      date: '2022-06-03', created_at: '2022-06-03',
      location: 'หอ 3 หญิง เฮือนทองกวาว มหาวิทยาลัยเชียงใหม่', lat: 18.79967, lng: 98.95276,
      detail: 'เจอแถวๆที่รอรถม่วงหน้าหอ3ญครับ' }

  ]

  posts.each do |p|
    p = Post.new(p)
    p.images.attach(io: File.open(Rails.root.join('app/assets/images/default_image.png')),
                    filename: '/default_image.png', content_type: 'image/png')
    p.save
  end

  Comment.create([
                   { user_id: u2.id, post_id: p1.id, content: 'เราไปมาวันนี้ไม่เห็นนะคะ',
                     created_at: '2022-07-08T21:00:00' },

                   { user_id: u1.id, post_id: p10.id, content: 'ของผมเองครับทักไปนะครับ',
                     created_at: '2022-07-06T21:15:00' },

                   { user_id: u1.id, post_id: p2.id, content: 'ไปแถวไหนในเมญ่าบ้างหรอครับตอนนี้อยู่เมญ่าเผื่อช่วยดู',
                     created_at: '2022-07-02T13:20:00' },
                   { user_id: u2.id, post_id: p2.id, content: 'ไปตรงโรงหนังน่ะค่ะ',
                     created_at: '2022-07-02T13:30:00' },

                   { user_id: u3.id, post_id: p9.id, content: 'ของผมครับไปรับมาแล้วขอบคุณมากครับ',
                     created_at: '2022-07-04T15:16:00' },
                   { user_id: u4.id, post_id: p9.id, content: 'ยินดีค่า ^^',
                     created_at: '2022-07-04T15:30:00' },

                   { user_id: u1.id, post_id: p3.id, content: 'ตอนนี้เจอยังครับ',
                     created_at: '2022-07-11T12:00:00' },
                   { user_id: u3.id, post_id: p3.id, content: 'ยังเลยครับ TT',
                     created_at: '2022-07-11T12:05:00' },
                   { user_id: u5.id, post_id: p3.id, content: 'เมื่อวานเหมือนเห็นน้องนะครับ',
                     created_at: '2022-07-11T16:25:00' },

                   { user_id: u2.id, post_id: p8.id, content: 'ตอนนี้ยังเก็บไว้มั้ยคะหรือฝากไว้กับคาเฟ่',
                     created_at: '2022-07-12T12:01:00' },
                   { user_id: u3.id, post_id: p8.id, content: 'ผมเก็บไว้ให้ครับไม่ได้ฝากเอาไว้ที่คาเฟ่',
                     created_at: '2022-07-12T12:30:00' },
                   { user_id: u2.id, post_id: p8.id, content: 'ทักไปนะคะ',
                     created_at: '2022-07-12T12:32:00' },

                   { user_id: u1.id, post_id: p4.id, content: 'พึ่งไปวันนี้ไม่เห็นนะครับ',
                     created_at: '2022-06-29T14:22:00' },
                   { user_id: u4.id, post_id: p4.id, content: 'ไม่เป็นไรขอบคุณมากค่า',
                     created_at: '2022-06-29T14:27:00' },
                   { user_id: u2.id, post_id: p4.id, content: 'เราไปมาวันนี้ไม่เห็นนะคะ',
                     created_at: '2022-06-30T13:34:00' },
                   { user_id: u3.id, post_id: p4.id, content: 'ไม่เห็นเลยครับ',
                     created_at: '2022-06-30T16:55:00' },

                   { user_id: u1.id, post_id: p7.id, content: 'ถ้าไม่มีเจ้าของผมยืมอ่านได้มั้ยครับ5555',
                     created_at: '2022-06-29T23:48:00' },
                   { user_id: u3.id, post_id: p7.id, content: 'ของผมเองครับ นึกว่าหายซะแล้วTT ขอบคุณมากครับ',
                     created_at: '2022-06-30T10:02:00' },
                   { user_id: u2.id, post_id: p7.id, content: 'ทักมาได้เลยค่า',
                     created_at: '2022-06-30T10:34:00' },
                   { user_id: u3.id, post_id: p7.id, content: 'คุณ user1 ผมให้ยืมได้นะครับ 55555',
                     created_at: '2022-06-30T10:40:00' },

                   { user_id: u1.id, post_id: p5.id, content: 'มีคนเก็บไปยังครับเนี่ย',
                     created_at: '2022-07-03T21:40:00' },
                   { user_id: u2.id, post_id: p5.id, content: 'เราไม่ได้ไปแถวนั้น แต่ขอให้เจอไวๆนะคะ',
                     created_at: '2022-07-03T22:21:00' },
                   { user_id: u3.id, post_id: p5.id, content: 'ติดต่อหาบริษัทรถทำอันใหม่เลยครับ',
                     created_at: '2022-07-03T23:00:00' },
                   { user_id: u1.id, post_id: p5.id, content: 'เจอยังครับ',
                     created_at: '2022-07-04T09:35:00' },
                   { user_id: u5.id, post_id: p5.id, content: 'ไม่เจอครับ ติดต่อบริษัทแล้วขอบคุณทุกคนนะครับ',
                     created_at: '2022-07-04T11:14:00' },

                   { user_id: u3.id, post_id: p6.id, content: 'ร้านนี้อร่อยมั้ยครับ',
                     created_at: '2022-06-22T18:44:00' },
                   { user_id: u1.id, post_id: p6.id, content: 'อร่อยนะครับ5555',
                     created_at: '2022-06-22T18:48:00' },
                   { user_id: u3.id, post_id: p6.id, content: 'ต้องไปลองแล้ว',
                     created_at: '2022-06-22T18:50:00' },
                   { user_id: u5.id, post_id: p6.id, content: 'ของผมเองครับ ทักไปนะครับ',
                     created_at: '2022-06-23T13:28:00' },
                   { user_id: u1.id, post_id: p6.id, content: 'ครับผม^^',
                     created_at: '2022-06-22T14:05:00' }
                 ])

end
