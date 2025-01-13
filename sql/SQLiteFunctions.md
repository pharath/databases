# SQLite

## Aggregate functions

```sql
avg(X)
count(X)
group_concat(X,[Y])
total(X,Y)
max(X)
min(X)
sum(X)
```

## Core functions

```sql
abs(X)
changes()
char(X1,X2,..,XN)
coalesce(X,Y,..)
glob(X,Y)
hex(X)
ifnull(X,Y)
instr(X,Y)
last_insert_rowid()
length(X)
like(X,Y,[Z])
likelihood(X,Y)
likely(X)
load_extension(X,[Y])
lower(X)
ltrim(X,[Y])
max(X,Y,..)
min(X,Y,..)
nullif(X,Y)
printf(FORMAT,..)
quote(X)
random()
randomblob(N)
replace(X,Y,Z)
round(X,[Y])
rtrim(X,[Y])
soundex(X)
substr(X,Y,[Z])
total_changes()
trim(X,[Y])
typeof(X)
unicode(X)
unlikely(X)
upper(X)
zeroblob(N)
sqlite_compileoption_get(N)
sqlite_compileoption_used(X)
sqlite_offset(X)
sqlite_source_id()
sqlite_version()
```

## Date functions

```sql
date(..)
time(..)
datetime(..)
julianday(..)
jstrftime(..)
```

```sql
%d day of month: 00
%m month: 01-12
%Y year: 0000-9999
%w day of week 0-6 with Sunday==0
%j day of year: 001-366
%W week of year: 00-53
%J Julian day number

%s seconds since 1970-01-01
%S seconds: 00-59
%M minute: 00-59
%H hour: 00-24
%f fractional seconds: SS.SSS
%% %
```

