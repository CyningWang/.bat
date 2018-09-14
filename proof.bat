@echo off
rem 第一部分：查找重复部分 >> 结果文件-duplicate.txt
for /f "delims=" %%i in ('type 1.txt') do (
    findstr /x "%%i" 2.txt
) >> duplicate.txt

rem 第二部分：删除重复部分 >> 结果文件-result.txt
for /f "delims=" %%j in ('type 2.txt') do (
    findstr /x "%%j" duplicate.txt || echo %%j >> result.txt
)
pause

// type 显示文件内容
// findstr /x 完全匹配
// findstr /c:"" 搜索字符串，匹配到一部分就可以，比如：/c:"1" 可以匹配到 "12345"
// && 连接前一句成功后的操作
// || 连接前一句 %errorlevel% == 1 的操作
// >> 放在循环外面的好处时每一行不会产生额外的空格，放在里面，每一行末尾会产生一个空格，导致findstr /x 完全匹配失败
// 
// 需要注意：
// findstr 本身就会echo 返回值，所以如果上面再加findstr /x "%%i" 2.txt && echo %%i 就会打印2遍，并且2遍都会写入文件
// findstr /x "%%i" 2.txt && echo %%i >> duplicate.txt 只写入1遍的原因在于&&语句连接符，使得写入操作只针对echo %%i
// 同理：findstr /x "%%j" duplicate.txt || echo %%j >> result.txt
// 但是不能将result.txt提到for循环外的原因时echo %%j是在查找不到时执行的，查找不到时是不会echo值的，如果写在外面，那么一定是空的
//
// 批处理好像没有对文件内容进行删除的命令，只能通过新建文件写入+重命名的方式，模拟删除操作。[del对文件进行参数，不能对内容进行删除]
