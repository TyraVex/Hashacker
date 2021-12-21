@ECHO OFF
FOR /F "delims=: tokens=*" %%A IN ('findstr /B ::: "%~f0"') do @echo(%%A
:::
:::    _               _                _             
:::   | |             | |              | |            
:::   | |__   __ _ ___| |__   __ _  ___| | _____ _ __ 
:::   | '_ \ / _` / __| '_ \ / _` |/ __| |/ / _ \ '__|
:::   | | | | (_| \__ \ | | | (_| | (__|   <  __/ |   
:::   |_| |_|\__,_|___/_| |_|\__,_|\___|_|\_\___|_|   
:::
:::
IF EXIST hashcat.restore SET /P restore=Do you want to restore the previous session? (y/n) : 
IF /I %restore% == "y" hashcat --restore && PAUSE && EXIT /b
SET /P hash=Hash type code : 
SET /P dict=Dictionary file name : 

::100GB dictionary - 30min
hashcat -a 0 -m %hash% -w 4 -O --username hashes.txt %dict%

::[a-z][A-Z][0-9][@-/] 1-7 - characters - 1h30
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1?1?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1?1?1?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d?s ?1?1?1?1?1?1?1

::[a-z][A-Z][0-9] - 8 characters - 5h
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?u?d ?1?1?1?1?1?1?1?1

::[A-Z][0-9] & [a-z][0-9] - 9 characters - 4h30
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?d ?1?1?1?1?1?1?1?1?1
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?u?d ?1?1?1?1?1?1?1?1?1

::[0-9] - 10-13 characters - 15min
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?d?d?d?d?d?d?d?d?d?d
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?d?d?d?d?d?d?d?d?d?d?d
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?d?d?d?d?d?d?d?d?d?d?d?d
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?d?d?d?d?d?d?d?d?d?d?d?d?d

::[A-Z](start)[a-z][0-9](end) & [A-Z][0-9](end) - 10 characters - 2h30
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?d -2 ?l?u ?2?l?l?l?l?l?1?1?d?d
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?u?d ?u?u?u?u?u?u?1?1?d?d

::[A-Z](start)[a-z][0-9](end) & [A-Z][0-9](end) - 11 characters - 5h30
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?l?d -2 ?l?u ?2?l?l?l?l?l?l?d?d?d?d
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt -1 ?u?d ?u?u?u?u?u?u?u?d?d?d?d

::[a-z] & [A-Z] 10 characters - 6h
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?l?l?l?l?l?l?l?l?l?l
hashcat -a 3 -m %hash% -w 4 -O --username hashes.txt ?u?u?u?u?u?u?u?u?u?u

::Get results - 1h/30k hashes
hashcat.exe --show --username --outfile results.txt hashes.txt

PAUSE && EXIT /B