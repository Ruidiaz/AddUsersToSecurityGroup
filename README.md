# AddUsersToSecurityGroup
PowerShell script that adds users to AD Security Group form the spreadsheet AddUsers.csv saved in the same location.

1. You need ot organize the names in the csv sheet with format firstname.Surname.
   a) see sources:  https://exceltotal.com/como-separar-nombres-y-apellidos-en-excel/
                    https://exceltotal.com/dividir-texto-en-columnas/
                    
2. Select all names / Data tab / select "Text to Columns" 
   a) Wizard windows:
      - Delimited
      - Delimiters: Tab & Space
      - Column data format:General / Destination: $B$1
                    
3. Now we have surname in one column and firstname in a different one. In order to combine them... =(C1&"."&B1)
   a) Source: https://support.office.com/en-us/article/Combine-text-from-two-or-more-cells-into-one-cell-81ba0946-ce78-42ed-b3c3-21340eb164a6

***Please see this case scenario is when receiving the list of users listed as SURNAME Firstname

***Attention with the AD Security Name in the csv as it needs to be the "Group Name(pre-Windows 2000)"
