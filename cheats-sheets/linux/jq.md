proxyalt

socks5h://192.168.67.2:1081

socks5h://192.168.67.2:1081

socks5h://192.168.67.2:1081

socks5h://192.168.67.2:1081

  

KEY="eyJrIjoiejdFN3hSZ3pva2kwYVE3Mmg0ek1Gc3dxNlh0OWhlUUQiLCJuIjoicmFkZWsiLCJpZCI6Mn0="

FULLURL="https://grafana-centralized-monitoring.advantagedp.org"

headers="Authorization: Bearer $KEY"

  

## nie ma kropki przed nawiasem [] --> puste nawiasy

> curl -H "$headers" -s "$FULLURL/api/search" > all.json | jq -r '[]' > all1.json>

  

## ładny pli json

> curl -H "$headers" -s "$FULLURL/api/search" > all.json | jq -r '.[]' > all1.json

  

##

> curl -H "$headers" -s "$FULLURL/api/search" > all.json | jq -r '.[] | select(.folderTitle == "Boson")' > all_select_folderTitle.json

  

## two folders

```

curl -H "$headers" -s "$FULLURL/api/search"  | jq -r '.[] | select(.folderTitle == "Boson" or .folderTitle == "Data Pipeline Monitoring")' > all_select_folderJOIN.json  

```

  

## only title

  

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[].title'

  

## indexes

  

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[1:4]'

  

## length

  

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[1:4] | length'

  

## keys

  

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[1] | keys'

  

## mapping

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r 'map(has("folderId"))'

  

## unique values

  

>  curl -H "$headers" -s "$FULLURL/api/search" | jq -r 'map(.folderTitle) | unique'

  

# select value beetwen

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[] | select(.id>15 and .id<20)'

  

## check n characters

>curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[] | select(.folderTitle[:3] == "Bos")'

  

## del  key

>curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[] | del(.folderTitle)'

  

## increment

>curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[] | .folderTitle+ 2'

  
  

## sort by

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r 'sort_by(.titleFolder) | .[] | select(.folderTitle == "Boson")'

  

> curl -H "$headers" -s "$FULLURL/api/search" | jq -r 'sort_by(.titleFolder, .uid) | .[] | select(.folderTitle == "Boson")'


## compare to files
>jq --argfile a Boson_Alerts_2023-01-13-14-46-15.json --argfile b Boson_Alerts_2023-01-13-14-47-42.json -n '($a | (.. | arrays) |= sort) as $a | ($b | (.. | arrays) |= sort) as $b | $a == $b'

true 

> jq --argfile a Boson_Alerts_2023-01-13-15-14-02.json --argfile b Boson_Alerts_2023-01-13-14-47-42.json -n '($a | (.. | arrays) |= sort) as $a | ($b | (.. | arrays) |= sort) as $b | $a == $b'

false

<<<<<<< HEAD

jq '.[] | .name'
jq '[.user, .projects[]]'

select(boolean_expression)  
      The function select(foo) produces its input unchanged if foo returns true for that input,  
      and produces no output otherwise.  
  
      It's useful for filtering lists: [1,2,3] | map(select(. >= 2)) will give you [2,3].  
  
          jq 'map(select(. >= 2))'  
             [1,5,3,0,7]  
          => [5,3,7]  
  
          jq '.[] | select(.id == "second")'  
             [{"id": "first", "val": 1}, {"id": "second", "val": 2}]  
          => {"id": "second", "val": 2}


map(x), map_values(x)  
      For any filter x, map(x) will run that filter for each element of the  input  array,  and  
      return  the  outputs  in a new array. map(.+1) will increment each element of an array of  
      numbers.  
  
      Similarly, map_values(x) will run that filter for each element, but it will return an ob‐  
      ject when an object is passed.  
  
      map(x) is equivalent to [.[] | x]. In fact, this is how it's defined. Similarly, map_val‐  
      ues(x) is defined as .[] |= x.  
  
          jq 'map(.+1)'  
             [1,2,3]  
          => [2,3,4]  
  
          jq 'map_values(.+1)'  
             {"a": 1, "b": 2, "c": 3}  
          => {"a": 2, "b": 3, "c": 4}

cat all_folders.json | jq -r  '.folderTitle'
cat all_folders.json | jq -r  'select(.folderTitle == "Boson")  
'

cat all_folders.json | jq -s  'sort_by(.id)'
=======
>>>>>>> main
