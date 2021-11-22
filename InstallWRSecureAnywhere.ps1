###############################################
#Script Author: Adam Berry                    #
#This is built for Tactical RMM               #
#The script will install Webroot IF you have  #
#a keycode entered under the 'Site' custom    #
#field. In this case it also requires a custom#
#field 'Install PC Protect' to be toggled     #
#Feel free to amend as you see fit.           #
#This will not install Webroot if already     #
#installed and running on the machine.        #
###############################################



param (
[string] $WRKeycode,
[string] $SubscribedtoPCP
)

if ( 'true' -eq $SubscribedtoPCP )
{

        
        if (Get-Service "WRSVC" -ErrorAction SilentlyContinue)
        {
        "Webroot is already installed. Exiting script."
        exit
        }
        else {
        Invoke-WebRequest -Uri "http://anywhere.webrootcloudav.com/zerol/wsasme.exe" -OutFile "C:\wsasme.exe"
        C:\wsasme.exe /key=$WRKeycode /silent
        Write-Host "Installed Successfully."
        }

}
else {
Write-Host "This device does not belong to a site/client that has subscribed to PC Protect"
}
