mkdir incompleted
foreach line ( "`cat inc.list`" )
mv $line incompleted
end

