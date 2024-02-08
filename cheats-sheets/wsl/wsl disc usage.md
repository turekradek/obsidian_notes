```
"C:\Users\rturek2\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx"
```


```
Optimize-VHD -Path "C:\Users\rturek2\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx" -Mode Full
```


# It works 

PS C:\Windows\System32> wsl.exe --shutdown Ubuntu-22.04
PS C:\Windows\System32> wsl --manage Ubuntu-22.04 --set-sparse false
Konwersja w toku. Może to potrwać kilka minut.
The operation completed successfully.
PS C:\Windows\System32> Optimize-VHD -Path "C:\Users\rturek2\AppData\Local\Packages\CanonicalGroupLimited.Ubuntu22.04LTS_79rhkp1fndgsc\LocalState\ext4.vhdx" -Mode Full