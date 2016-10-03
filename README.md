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
                    
  
