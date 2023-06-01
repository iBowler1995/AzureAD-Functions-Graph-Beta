function Assign-AADUserLicense {

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $True)]
        [String]$UPN,
        [Parameter()]
        [Switch]$E3,
        [Parameter()]
        [Switch]$E5,
        [Parameter()]
        [Switch]$ExchangeStd,
        [Parameter()]
        [Switch]$ExchangeEnt,
        [Parameter()]
        [Switch]$Stream,
        [Parameter()]
        [Switch]$Essentials,
        [Parameter()]
        [Switch]$AutomateFree,
        [Parameter()]
        [Switch]$AutomatePro,
        [Parameter()]
        [Switch]$PBIFree,
        [Parameter()]
        [Switch]$PBIPro,
        [Parameter()]
        [Switch]$ProjectPrem,
        [Parameter()]
        [Switch]$ProjectPro,
        [Parameter()]
        [Switch]$Visio,
        [Parameter()]
        [Switch]$WStore
    )

    <#
        IMPORTANT:
        ===========================================================================
        This script is provided 'as is' without any warranty. Any issues stemming 
        from use is on the user.
        ===========================================================================
		.DESCRIPTION
		Assigns license(s) to AAD user
        Known bugs/issues as of 3/14/22: 
        Adding multiple licenses in one call can result in function failure due to MS Graph rate limiting
        ===========================================================================
		.PARAMETER UPN
		REQUIRED - Email address/userPrincipalName of the user.
		.PARAMETER E3
		Assigns user the M365 E3 license
        .PARAMETER ExchangeStd
		Assigns user the M365 Exchange Online Standard license
        .PARAMETER ExchangeEnt
		Assigns user the M365 Exchange Online Enterprise license
        .PARAMETER Stream
		Assigns user the Microsoft Stream license
        .PARAMETER Essentials
		Assigns user the O365 Business Essentials license
        .PARAMETER AutomateFree
		Assigns user the Power Automate Free license
        .PARAMETER AutomatePro
		Assigns user the Power Automate Pro license
        .PARAMETER PBIFree
		Assigns user the PowerBI Free license
        .PARAMETER PBIPro
		Assigns user the PowerBI Pro license
        .PARAMETER ProjPrem
		Assigns user the Project Premium (Plan 3) license
        .PARAMETER ProjPro
		Assigns user the Project Pro (Plan 5) license
        .PARAMETER Visio
		Assigns user the Visio (Plan 2) license
        ===========================================================================
		.EXAMPLE
		Assign-AADUserLicense -UPN bjameson@example.com -E3 -Visio <--- Assigns E3 and Visio licenses to bjameson@example.com
	#>

    $token = Get-MsalToken -clientid x -tenantid organizations
    $global:header = @{'Authorization' = $token.createauthorizationHeader();'ConsistencyLevel' = 'eventual'}
    $E3SkuId = "05e9a617-0261-4cee-bb44-138d3ef5d965"
    $E5SkuId = "06ebc4ee-1bb5-47dd-8120-11324bc54e06"
    $ExStdSkuId = "4b9405b0-7788-4568-add1-99614e613b69"
    $ExEntSkuId = "19ec0d23-8335-4cbd-94ac-6050e30712fa"
    $StreamSkuId = "1f2f344a-700d-42c9-9427-5cea1d5d7ba6"
    $EssentSkuId = "3b555118-da6a-4418-894f-7df1e2096870"
    $FlowFreeSkuId = "f30db892-07e9-47e9-837c-80727f46fd3d"
    $FlowProSkuId = "bc946dac-7877-4271-b2f7-99d2db13cd2c"
    $PBIFreeSkuId = "a403ebcc-fae0-4ca2-8c8c-7a907fd6c235"
    $PBIProSkuId = "f8a1db68-be16-40ed-86d5-cb42ce701560"
    $ProjPremSkuId = "09015f9f-377f-4538-bbb5-f75ceb09358a"
    $ProjProSkuId = "53818b1b-4a27-454b-8896-0dba576410e6"
    $VisioSkuId = "c5928f49-12ba-48f7-ada3-0d743a3601d5"
    $WStoreSkuId = "6470687e-a428-4b7a-bef2-8a291ad947c9"
    $Licenses = @{
        addLicenses = @();
        removeLicenses = @()
    }

    If ($E3) {

        $Licenses.addLicenses += @{
            skuId = $E3SkuId
        }
            

    }
    If ($E5) {

        $Licenses.addLicenses += @{
            skuId = $E5SkuId
        }
            

    }
    If ($ExchangeStd) {

        $Licenses.addLicenses += @{
            skuId = $ExStdSkuId
        }
            

    }
    If ($ExchangeEnt) {

        $Licenses.addLicenses += @{
            skuId = $ExEntSkuId
        }
            

    }
    If ($Stream) {

        $Licenses.addLicenses += @{
            skuId = $StreamSkuId
        }
            

    }
    If ($Essentials) {

        $Licenses.addLicenses += @{
            skuId = $EssentSkuId
        }
            

    }
    If ($AutomateFree) {

        $Licenses.addLicenses += @{
            skuId = $FlowFreeSkuId
        }

    }
    If ($AutomatePro) {

        $Licenses.addLicenses += @{
            skuId = $FlowProSkuId
        }

    }
    If ($PBIFree) {

        $Licenses.addLicenses += @{
            skuId = $PBIFreeSkuId
        }
            


    }
    If ($PBIPro) {

        $Licenses.addLicenses += @{
            skuId = $PBIProSkuId
        }
            


    }
    If ($ProjectPrem) {

        $Licenses.addLicenses += @{
            skuId = $ProjPremSkuId
        }
            


    }
    If ($ProjectPro) {

        $Licenses.addLicenses += @{
            skuId = $ProjProSkuId
        }
            


    }
    If ($Visio) {

        $Licenses.addLicenses += @{
            skuId = $VisioSkuId
        }
            


    }
    If ($WStore) {

        $Licenses.addLicenses += @{
            skuId = $WStoreSkuId
        }
            


    }
    $Uri = "https://graph.microsoft.com/beta/users/$UPN/assignLicense"
        $JSON = $Licenses | ConvertTo-Json
        Try {

            Invoke-RestMethod -Uri $Uri -Body $JSON -Headers $Header -Method Post -ContentType "application/Json"

        }
        catch{
            $ResponseResult = $_.Exception.Response.GetResponseStream()
            $ResponseReader = New-Object System.IO.StreamReader($ResponseResult)
            $ResponseBody = $ResponseReader.ReadToEnd()
            $ResponseBody    
        }

}