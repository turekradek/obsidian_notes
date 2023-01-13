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

