@echo off
dir /b /ad > list.txt

/* 注释 */
//  dir参数：/b /ad
//  /b: 显示子目录名称，不显示附加的完整路径
//  /ad: 指定显示目录，其他属性的文件不管
//  > list.txt 导出到list.txt文件
