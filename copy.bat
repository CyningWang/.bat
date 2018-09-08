/*----- 批处理拷贝所有子孙文件到指定目录 -----*/

@echo off
setlocal enabledelayedexpansion
for /f "delims=" %%a in ('dir /b /ad 指定目录') do (
    set /a sum+=1
    echo f | xcopy %%a\*.* "指定目录!sum!.jpg" /s /y
)
pause

// setlocal enabledelayedexpansion 开启变量延迟：批处理按条处理而不是按行处理，因此对于复合语句里的赋值操作，不会立即生效
// eg: n = 0
//     set n=1 & echo n
// 结果显示 0，这就是变量延迟，批处理运行到echo n时，set n=1 并没有执行
// 如果用 && 就没有变量延迟的问题，&& 等待前一句执行成功，才执行后面的语句，当然隔行写，不构成复合语句时，也不会造成变量延迟

// for 语句结构： for ... in () do ()
// ('dir /b /ad 指定目录') 返回一个显示自己目录的列表集合
// /f 对于文件处理提供很多便捷，以下三种工具：
// "delims=" 以什么形式分割集合中的每一项，一般集合是文件时，即以什么形式分割列
// "skip=1" 跳过第一行
// "token=1,5" 提取第一列和第五列

// set /a 处理表达式计算赋值  → set /a sum = 1 → 执行结束：sum 是 1
// set /p 处理控制台输入交互赋值 → set /p b = 输入： → 等待输入 → b的值取决于用户输入

// echo f | 输入f，不加，在这里会询问一些问题：是创建目录 or 创建文件
// !sum! 开启变量延迟后变量调用的写法
// xcopy /s 创建目录
// xcopy /y 覆盖文件
