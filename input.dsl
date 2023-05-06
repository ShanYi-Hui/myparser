define modules {
  m1 {
    m11 #模块一一
    m12 {
      m121 #模块一二一
      m122 #模块一二二
    } #模块一二
  } #模块一
  m2 #模块二
}

define page test0 #欢迎页面零;
define page m1.test1 #欢迎页面一;
define page m12.test2 #欢迎页面二;
define page m121.test3 #欢迎页面三;