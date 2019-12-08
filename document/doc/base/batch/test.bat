::echo off 是关闭命令显示,前面的“@”符号使命令也适用于自己
@echo off 
echo "Hello World"

Rem Rem后面是注释，添加注释来说明这个批处理文件的功能。：This is for listing down all the files in the directory Program files 
rem 注 - 如果Rem的行数太多，可能会使代码变慢，因为最后还是需要执行批处理文件中的每行代码。
rem @echo off 
dir "C:\Program Files" > E:\my\lists.txt 
echo "The program has completed"

rem 获取输入参数，多的参数会被忽略，如test.bat hehe haha xixi ddddd
echo %1 
echo %2 
echo %3

rem 默认是全局变量，整个脚本都可以使用，var变量是在局部范围内定义的，因为它被包含在SETLOCAL和ENDLOCAL块之间
set globalvar=5
SETLOCAL
set var=13145
set /A var=%var% + 5
echo %var%
echo %globalvar%
ENDLOCAL
echo %var%
echo %globalvar%

rem 使用环境变量
echo "path=%path%"


rem 字符串
set message=Hello World 
echo %message%

set str=Hello World
call :strlength str strlen
echo String is %strlength% characters long
:: exit /b

rem 定义一个变量来保存一个数值。 这可以通过使用/A开关完成。
SET /A a=5 
SET /A b=10 
SET /A c=%a% + %b% 
echo %c%

SET /A c=%a% - %b% 
echo %c% 
SET /A c=%b% / %a% 
echo %c% 
SET /A c=%b% * %a% 
echo %c%

rem  数组
set list=1 2 3 4 
(for %%a in (%list%) do ( 
   echo %%a 
))

set a[0]=1 
set a[1]=2 
set a[2]=3 
echo The first element of the array is %a[0]% 
echo The second element of the array is %a[1]% 
echo The third element of the array is %a[2]%

rem 修改数组和新增元素
Set a[1]=5 
set a[5]=9

echo "a[1]=%a[1]%"
echo "a[5]=%a[5]%"


rem 循环迭代数组，for循环移动范围的/L参数用于迭代数组。
setlocal enabledelayedexpansion 
set topic[0]=comments 
set topic[1]=variables 
set topic[2]=Arrays 
set topic[3]=Decision making 
set topic[4]=Time and date 
set topic[5]=Operators 

for /l %%n in (0,1,5) do ( 
   echo !topic[%%n]! 
)

rem 数组的长度，通过遍历数组中的值来+1计算
set Arr[0]=1 
set Arr[1]=2 
set Arr[2]=3 
set Arr[3]=4 
set "x=0" 
:SymLoop 

if defined Arr[%x%] ( 
   call echo %%Arr[%x%]%% 
   set /a "x+=1"
   GOTO :SymLoop 
)
echo "The length of the array is" %x%

Rem 数组中使用结构对象 使用set命令定义的每个变量具有与数组的每个索引关联的2个值。 变量i设置为0，以便可以遍历结构将数组的长度为3。 是检查i的值是否等于len的值，如果不是，则循环遍历代码。 可以使用obj[%i%]表示法访问结构的每个元素。

rem 批处理多行注释 使用goto start11 跳过去
goto start11
set len=3 
set obj[0].Name=Joe 
set obj[0].ID=1 
set obj[1].Name=Mark 
set obj[1].ID=2 
set obj[2].Name=Mohan 
set obj[2].ID=3 
set i=0 
:loop 

if %i% equ %len% goto :eof 
set cur.Name= 
set cur.ID=

for /f "usebackq delims==.tokens=1-3" %%j in (`set obj[%i%]`) do ( 
   set cur.%%k=%%l 
) 
echo Name=%cur.Name% 
echo Value=%cur.ID% 
set /a i=%i%+1 
goto loop
:start11


::::if/else语句 、if语句,区分大小写

SET /A a=5 
SET /A b=10 
SET /A c=%a% + %b% 
if %c%==15 (echo "The value of variable c is 15") else (echo "Unknown value") 
if %c%==10 (echo "The value of variable c is 10") else (echo "Unknown value")

SET str1=String1 
SET str2=String2 
if %str1%==String1 (echo "The value of variable String1") else (echo "Unknown value") 
if %str2%==StrinG1 (echo "The value of variable c is String3") else (echo "Unknown value") 

rem “if”语句的一个特例是“if defined”，用于测试变量是否存在。
if defined str1 echo "Variable str1 is defined"
if defined str3 (echo "Variable str3 is defined") else (echo "Variable str3 is not defined")

rem “if”语句的另一个特例是“if exists”，用于测试文件是否存在。 以下是声明的一般语法。
if exist C:\set2.txt echo "File exists" 
if exist C:\set3.txt (echo "File exists") else (echo "File does not exist")

::嵌套if语句

SET /A a=5
SET /A b=10
if %a%==5 if %b%==10 echo "The value of the variables are correct"


rem goto语句，跳转到特定部分的能力，如果没有labela后面的exit，后面的便签内容还会继续执行
SET /A a=5 

if %a%==5 goto :labela 
if %a%==10 goto :labelb

:labela 
echo "The value of a is 5" 
rem exit /b 0

:labelb 
echo "The value of a is 10"


rem 时间
echo %DATE%
echo %TIME%

echo/Today is: %year%-%month%-%day% 
goto :EOF 
setlocal ENABLEEXTENSIONS 
set t=2&if "%date%z" LSS "A" set t=1 

for /f "skip=1 tokens=2-4 delims=(-)" %%a in ('echo/^|date') do ( 
   for /f "tokens=%t%-4 delims=.-/ " %%d in ('date/t') do ( 
      set %%a=%%d&set %%b=%%e&set %%c=%%f)) 
endlocal&set %1=%yy%&set %2=%mm%&set %3=%dd%&goto :EOF


