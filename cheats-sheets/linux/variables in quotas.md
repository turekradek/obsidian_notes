$(curl -H "$headers" -s "$FULLURL/api/search" | jq -r '.[] | select(.folderTitle == "'"$folder"'" ) | .uid');

```bash
'<Data Token="someToken" Name="'"$appName"'" ...>'
                              ^^^
                              |||
                              ||+- shell quote to protect $appName
                              |+- shell quote enclosing the XML
                              +- literal quote embedded in the XML
```