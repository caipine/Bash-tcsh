while read unit; do
  echo "${unit}"


#echo "ls *-${unit}.* | while read fn; do    mv  "`echo '"${fn}"'`"   "`echo '"${fn}" "${fn/-${unit}./.}"'`" ;   done"  > tmp.sh

echo "ls *-${unit}.* | while read fn; do    mv  "`echo '"${fn}"'`"     "`echo '"${fn/-'`"${unit}"`echo './.}"'`" ;   done"  > tmp.sh

sh tmp.sh

done <unit.list
