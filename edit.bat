@echo off&setlocal EnableDelayedExpansion
cd /d "工作目录"  
for /f "delims=" %%a in ('dir /b/s *.html') do (
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
//  cd  %~dp0 指定当前脚本所在目录为工作区
//  dir /b/s *.html 循环目录下所有html文件，包括子目录下面的
//  /i 忽略大小写
//  !str:指定替换部分=!   替换为空，替换后与原行字符串比较，是否相同，相同意味着，没有指定内容，不同，意味着有指定内容
//  set .=. 设置标志符变量，表示已经找到相同部分
//  if defined . 判断是否已经定义 . 变量标志，定义了，说明相同内容在上一行，替换并打印，如果没有定义，则输出当前行内容
//  echo, %%b 这一句输出和上一句的if defined并不是if else的关系，而是相对独立的，无论if defined 这一句后面的赋值会不会进行，这一句在当前if下都会执行
//  move tmp "%%a" 替换文件，临时文件替换源文件达到修改的目的
//  , 逗号相当于空格，批处理中表意相同
