@echo off&setlocal EnableDelayedExpansion
cd /d "工作目录"  
for %%a in (*.html) do (
  (for /f "delims=" %%b in ('type "%%a"') do (
    set "str=%%b"
    if /i "!str:指定替换部分=!" == "%%b" (
      if defined . set .=&type replace.list & echo,
      echo, %%b
    ) else (
      set .=.
    )
  ))>tmp
  move tmp "%%a"
)

/* 注释 */
//  cd /d 直接进入指定目录，跳过盘符转换
//  /i 忽略大小写
//  !str:指定替换部分=!   替换为空，替换后与原行字符串比较，是否相同，相同意味着，没有指定内容，不同，意味着有指定内容
//  set .=. 设置标志符变量，表示已经找到相同部分
//  if defined . 判断是否已经定义 . 变量标志，定义了，说明相同内容在上一行，替换并打印，如果没有定义，则输出当前行内容
//  move tmp "%%a" 替换文件，临时文件替换源文件达到修改的目的
//  , 逗号相当于空格，批处理中表意相同
