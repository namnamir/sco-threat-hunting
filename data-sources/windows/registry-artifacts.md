# Windows Registry Forensics

#### 1. RDP Connections
* **Outgoing:** `HKCU\SOFTWARE\Microsoft\Terminal Server Client\Default\MRU` (IPs/Hostnames) & `HKCU\SOFTWARE\Microsoft\Terminal Server Client\Servers\` (UsernameHints)
* **Incoming:** `HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server` (Check `fDenyTSConnections`: `0` is allowed, `1` is denied)

#### 2. Execution & App Usage
* **Run Dialog:** `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU`
* **UserAssist:** `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist\{GUID}\Count` (Requires decoding, tracks executed programs)
* **ShimCache:** `HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache` (Tracks executed files, valuable for timelines)

#### 3. Devices & Network
* **USB History:** `HKLM\SYSTEM\CurrentControlSet\Enum\USBSTOR` & `HKLM\SYSTEM\CurrentControlSet\Enum\USB` (Connected USB devices)
* **Network History:** `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkList\Signatures\` (Networks connected to)

#### 4. System & User Activity
* **Last Shutdown:** `HKLM\SYSTEM\CurrentControlSet\Control\Windows\ShutdownTime` (UTC timestamp)
* **Mounted Devices:** `HKLM\SYSTEM\MountedDevices` (Mounted volumes/drives)
* **Recent Files:** `HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs` (Recently accessed documents)
* **Logon History:** `HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\UserMRU` (Users who logged on)
