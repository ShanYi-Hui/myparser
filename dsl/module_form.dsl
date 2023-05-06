module(crud) {
  []{
    name,*,input(2-20),#姓名;
    age,*,number(0-999),#年龄;
    sex,*,radio(男,女),#性别;
    phone,*,input(phone),#联系电话;
    email,*,input(email),#邮箱;
    address,!,text(0-50,address),#住址;
  }
  [教育经历](dynamic){
    school,*,input(0-50),#学校;
    department,*,select(财经,土木,计算机),#院系;
    major,*,input(0-20),#专业;
    certifier,*,input(0-10),#z证明人;
  }
  [职业技能](dynamic,index){
    skil,*,input(0-50),#技能;
  }
  [工作经历](dynamic){
    company,*,input(0-50),#公司;
    position,*,input(0-50),#职位;
    companyTel,*,input(phone),#联系电话;
  }
}