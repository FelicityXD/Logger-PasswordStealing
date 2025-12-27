
$path = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\NetworkProvider\Order" -Name PROVIDERORDER
$UpdatedValue = $Path.PROVIDERORDER + ",Logger"
Set-ItemProperty -Path $Path.PSPath -Name "PROVIDERORDER" -Value $UpdatedValue

New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\Logger
New-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\Logger\NetworkProvider
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Logger\NetworkProvider -Name "Class" -Value 2
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Logger\NetworkProvider -Name "Name" -Value Logger
New-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\Logger\NetworkProvider -Name "ProviderPath" -PropertyType ExpandString -Value "%SystemRoot%\System32\Logger.dll"