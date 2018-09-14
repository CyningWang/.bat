@echo off
rem 第一部分：查找重复部分 >> 结果文件-duplicate.txt
for /f "delims=" %%i in ('type 1.txt') do (
    findstr /x "%%i" 2.txt && echo %%i
) >> duplicate.txt

rem 第二部分：删除重复部分 >> 结果文件-result.txt
for /f "delims=" %%j in ('type 2.txt') do (
    findstr /x "%%j" duplicate.txt || echo %%j
) >> result.txt
pause

// type 显示文件内容
// findstr /x 完全匹配
// findstr /c:"" 搜索字符串，匹配到一部分就可以，比如：/c:"1" 可以匹配到 "12345"
// && 连接前一句成功后的操作
// || 连接前一句 %errorlevel% == 1 的操作
// >> 放在循环外面的好处时每一行不会产生额外的空格，放在里面，每一行末尾会产生一个空格，导致findstr /x 完全匹配失败
