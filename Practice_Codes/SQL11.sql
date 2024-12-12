-- string functions 
-- concatnate function

select fname,lname,concat(fname,lname) as full_name from EmpInfo;
select fname,lname,concat(fname," ",lname) as full_name from EmpInfo;

-- show the deptname and fname in capital letters
select upper(dept),upper(fname) from EmpInfo;

-- show length of each employees fname
select fname,length(fname) from EmpInfo;

-- select only 3 characters from fname of employee from rightside
select fname,right(fname,3) from EmpInfo; -- right will give last 3 characters
select fname,left(fname,3) from EmpInfo; -- left will give first 3 characters

-- replace fnames with initials 
select replace(fname,fname,concat("Mrs.",fname)) from EmpInfo;
select replace("Amazon","zon","ZON");

-- string comparing
select strcmp("java","python");-- it returns -1, based on alphabetical order,it takes java as smaller strng
select strcmp("python","java");-- it returns 1,python is taken as bigger strng
select strcmp("Java","java"); -- not case sensitive

-- sub string
-- it always goes from left to right
select substring("AishwaryaRavindran",5);-- 5 position from where the extracting should start
select substring("AishwaryaRavindran",-6);
select substring("AishwaryaRavindran",1,9);-- 1 means starting position and 9 means length
select substring("AishwaryaRavindran",-6,2);
-- substring(string,position,length)
-- substring extract the string from given string starting from position and till the length given
select substring("AishwaryaRavindran",-4,4);

-- ltrim -- it removes spaces from left side of string if any
-- rtrim -- it removes spaces from right side of string if any
select ltrim("   This is Mysql..   ") as LTRM;
select rtrim("   This is Mysql..   ") as RTRM;
select trim("   This is Mysql..   ") as TRM;

-- repeat
select repeat("'$$$'",3);

-- lpad  
select lpad(fname,11,"Mrs.") from EmpInfo;
select lpad("Hello",9,"hi");-- it will addd hi to left side to make the string of size 9 characters
select rpad("Hello",9,"hi");-- it will addd hi to right side to make the string of size 9 characters

-- reverse
select reverse("aishwarya");