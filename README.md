# Enable Service for license in Office 365
Script to enable service in bulk or individually to a particular office 365 license in an Office 365 tenant

You must connect to the tenant using connect-msolservice before running either of these scripts.

## Enable service in licenses for individual account

Fill in varaibles before running the script, if you don't know the AccountSkuId or service name use this script first to determine what they are
(https://github.com/Jamie-Bray/GetServices-Office365-licensing)

example variable input-

$AccountSkuId = "CONTOSO:POWER_BI_PRO"

$servicetoactivate = "BI_AZURE_P2"

$account = "Jamie@Contoso.com"

(https://github.com/Jamie-Bray/Enable-service-for-a-license-s-in-Office-365/blob/master/Add%20service%20to%20license%20for%20a%20single%20account.ps1)

## Enable service in licenses for multiple accounts

Fill in varaibles before running the script, if you don't know the AccountSkuId or service name use this script first to determine what they are
(https://github.com/Jamie-Bray/GetServices-Office365-licensing)

example variable input-

$AccountSkuId = "CONTOSO:POWER_BI_PRO"

$servicetoactivate = "BI_AZURE_P2"

$user = Import-Csv "C:\Powershell\names.csv"

Ensure a CSV is used, it is important that 'name' is the header of the column.
![CSV](https://github.com/Jamie-Bray/Enable-service-for-a-license-s-in-Office-365/blob/master/namesCSV-img.png)
