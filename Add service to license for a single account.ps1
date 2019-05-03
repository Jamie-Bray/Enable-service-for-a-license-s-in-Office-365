$AccountSkuId = ""
$servicetoactivate = ""
$account = "" # This is the email address of the account you want to enable the service on

{

#get the license that you specified in the $AccountSkuId variable for the user
$license = (Get-MsolUser -UserPrincipalName $account).Licenses | where AccountSkuId -eq $AccountSkuId

#check if the actual license has been assigned to the user so the script can find the service in the license, if it has not, assign the license to the user and try setting the variable again
if (!$license) { 
                
                Set-MsolUserLicense -UserPrincipalName $account -AddLicenses $AccountSkuId 

                $license = (Get-MsolUser -UserPrincipalName $account ).Licenses | where AccountSkuId -eq $AccountSkuId
               
                }

#get all the disabled services in the license
$services = $license.serviceStatus.Where{$_.ProvisioningStatus -eq 'disabled'} 


#get just the name of these disabled services removing the service that we want to activate
$disabledservices =  $services.ServicePlan.ServiceName | Where-Object { $_ –ne $servicetoactivate }


#build a new license for the user, this license will enable every service including the new service you specified apart from services that were already disabled for the user
$newlicense = New-MsolLicenseOptions -AccountSkuId $AccountSkuId -DisabledPlans $disabledservices


#apply the new license to the users account, overwriting the old one
Set-MsolUserLicense -UserPrincipalName $account -LicenseOptions $newlicense

Write-host "$account now has $servicetoactivate assigned to their license"
