@echo off

REM install splunk enterprise quietly with some reasonable defaults
echo Installing Splunk Enterprise...
msiexec.exe /i splunk-6.4.3-b03109c2bad4-x64-release.msi AGREETOLICENSE=Yes ^
  WINEVENTLOG_APP_ENABLE=1 ^
  WINEVENTLOG_SEC_ENABLE=1 ^
  WINEVENTLOG_SYS_ENABLE=1 ^
  WINEVENTLOG_FWD_ENABLE=1 ^
  WINEVENTLOG_SET_ENABLE=1 ^
  WMICHECK_FREEDISK=1 /quiet

REM install license
REM echo Will try to install license...
REM "C:\Program Files\Splunk\bin\splunk.exe" add license enterprise.license

REM Ask user to authenticate
echo Please login as "admin", password "changeme" when prompted below...
"C:\Program Files\Splunk\bin\splunk.exe" login

REM actually, use free license as we don't have the license file handy
echo Configure free license...
"C:\Program Files\Splunk\bin\splunk.exe" edit licenser-groups Free -is_active 1
echo Please wait whilst I restart splunk for you...
net stop splunkd
net start splunkd

REM allow splunk and related sites
echo Allow IE safe sites for splunk...
regedit /S safe_sites.reg
echo All done
timeout /t 3
