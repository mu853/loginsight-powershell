function Connect-LogInsight {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,Position=0)]
        [String]$server,
        [Parameter(Mandatory=$true,Position=1)]
        [String]$username,
        [Parameter(Mandatory=$true)]
        [String]$password
    )
    process {
        [System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$True}
        
        $auth = @{
          "username" = $username;
          "password" = $password
        } | ConvertTo-Json

        $client = New-Object System.Net.WebClient
        $client.Headers.Add("Accept", "application/json")
        $client.Headers.Add("Content-Type", "application/json")
        $client.BaseAddress = "https://$server"
        
        $res = $client.UploadString("/api/v1/sessions", "POST", $auth)
        if($res){
            $global:vrli_session = $res | ConvertFrom-Json
            $global:vrli_api_client = $client
            "Successfull Connected."
        }
    }
}

function Get-LogInsightEvents {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$false,Position=1)]
        [int]$limit = 100
    )
    process {
        $url = "/api/v1/events?limit={0}" -F $limit
        $global:vrli_api_client.Headers.Add("Accept", "application/json")
        $global:vrli_api_client.Headers.Add("Content-Type", "application/json")
        $global:vrli_api_client.Headers.Add("Authorization", ("Bearer {0}" -F $global:vrli_session.sessionId))
        $res = $global:vrli_api_client.DownloadString($url)
        if($res){
            return $res | ConvertFrom-Json$
        }
    }
}
