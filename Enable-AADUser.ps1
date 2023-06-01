function Enable-AADUser {

    [cmdletbinding()]
    param(

        [Parameter()]
        [String]$UPN

    )

    <#
		IMPORTANT:
        ===========================================================================
        This script is provided 'as is' without any warranty. Any issues stemming 
        from use is on the user.
        ===========================================================================
		.DESCRIPTION
		Enables AAD User
		===========================================================================
		.PARAMETER UPN
        REQUIRED - Email/userPrincipalName of user to enable
		===========================================================================
		.EXAMPLE
		Enable-AADUser -UPN bjameson@example.com <--- This enables bjameson@example.com
	#>

    $token = Get-MsalToken -clientid x -tenantid organizations
    $global:header = @{'Authorization' = $token.createauthorizationHeader();'ConsistencyLevel' = 'eventual'}
    $uri = "https://graph.microsoft.com/beta/users/$UPN"
    $Body = @{"accountEnabled" = $true} | ConvertTo-Json
    Try {

        Invoke-RestMethod -Uri $Uri -Body $body -Headers $Header -Method Patch -ContentType "application/Json"

    }
    catch{
        $ResponseResult = $_.Exception.Response.GetResponseStream()
        $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
        $ResponseBody = $ResponseReader.ReadToEnd()
        $ResponseBody    
    }
        
}