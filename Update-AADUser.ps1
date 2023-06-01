function Update-AADUser {

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $True)]
        [String]$UPN,
        [Parameter()]
        [String]$FName,
        [Parameter()]
        [String]$LName,
        [Parameter()]
        [String]$Title,
        [Parameter()]
        [String]$Office,
        [Parameter()]
        [String]$Manager,
        [Parameter()]
        [String]$Dept,
        [Parameter()]
        [String]$Mobile,
        [Parameter()]
        [String]$Company,
        [Parameter()]
        [Switch]$Location

    )

    <#
		IMPORTANT:
        ===========================================================================
        This script is provided 'as is' without any warranty. Any issues stemming 
        from use is on the user.
        ===========================================================================
		.DESCRIPTION
		This function will update an AAD user
		===========================================================================
		.PARAMETER UPN
        REQUIRED - Email/userPrincipalName of user to be updated
        .PARAMETER FName
        Updates user's givenName
        .PARAMETER LName
        Updates user's surname
        .PARAMETER Title
        Updates user's jobTitle
        .PARAMETER Office
        Updates user's officeLocation
        .PARAMETER Dept
        Updates user's department
        .PARAMETER Company
        Updates user's company
        .PARAMETER Location
        Switch that adds US as usage location (can be updated for other country codes at line 212)
		===========================================================================
		.EXAMPLE
		Update-AADUser -UPN bjameson@example.com -Title "Sr. Job Tester" -Office "Los Angeles" <--- Updates bjameson@example.com's title to Sr. Job Tester and office to LA
	#>

    $token = Get-MsalToken -clientid x -tenantid organizations
    $global:header = @{'Authorization' = $token.createauthorizationHeader()}
    If ($FName){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "givenName" = $FName

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($LName){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "surname" = $LName

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Title){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "jobTitle" = $Title

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Office){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "officeLocation" = $Office

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Manager){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN/manager/`$ref"
        $Body = @{

            "@odata.id" = "https://graph.microsoft.com/beta/users/$Manager"

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Put -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Dept){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "department" = $Dept

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Mobile){

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "mobilePhone" = $Mobile

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        
    }
    If ($Location) {

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "usageLocation" = "US"

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        

    }
    If ($Company) {

        $Uri = "https://graph.microsoft.com/beta/users/$UPN"
        $Body = @{

            "companyName" = $Company

        }
        $JSON = $Body | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Patch -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody
        }
        

    }
}