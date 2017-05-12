loginsight-powershell
======================
loginsight rest api handling by powershell script

## Usage

1 set loginsight.psm1 to C:\Program Files\WindowsPowerShell\Modules\LogInsight\LogInsight.psm1  
2 start powershell and execute following commands.   
* PowerCLI is not required.

```powershell
$ErrorActionPreference = "Stop"
Connect-LogInsight -Server <LogInsight IP Address> -Username <user name> -Password <password>
```

## Example

### get events

```powershell
> $log Get-LogInsightEvents -limit 10
> $log.events

text                                                    timestamp fields
----                                                    --------- ------
May 12 05:20:07 hoge01.fuga.local vmkwarni...   1494566407163 {@{name=hostname; startPosition=16...
May 12 05:20:07 hoge01.fuga.local vmkernel...   1494566407163 {@{name=hostname; startPosition=16...
May 12 05:20:07 hoge01.fuga.local vmkwarni...   1494566407163 {@{name=hostname; startPosition=16...
May 12 05:20:07 hoge01.fuga.local vmkernel...   1494566407162 {@{name=hostname; startPosition=16...
May 12 05:20:07 hoge01.fuga.local vmkwarni...   1494566407162 {@{name=hostname; startPosition=16...
May 12 05:20:07 hoge01.fuga.local vmkernel...   1494566407161 {@{name=hostname; startPosition=16...
May 12 05:20:06 hoge01.fuga.local Hostd: i...   1494566406991 {@{name=hostname; startPosition=16...
May 12 05:20:06 hoge01.fuga.local Hostd: i...   1494566406990 {@{name=hostname; startPosition=16...
May 12 05:20:06 hoge01.fuga.local Hostd: i...   1494566406990 {@{name=hostname; startPosition=16...
May 12 05:26:49 hoge01.fuga.local vsanSoap...   1494566809743 {@{name=hostname; startPosition=16...
```

Get-LogInsightEvents returns a object which is converted from json of REST API response.  
