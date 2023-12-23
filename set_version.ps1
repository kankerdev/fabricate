# Update modpack version using regex
$file = ".\pack.toml"
$regex = 'version \= "\d*\.\d*\.\d*\w?"'
(Get-Content $file) -Replace $regex, ('version = "{0}"' -f $args[0]) | Set-Content $file

# Update version in titlebar
$file = ".\config\barista\bar.json"
$regex = '"context": "Fabricate v\d*\.\d*\.\d*\w?"'
(Get-Content $file) -Replace $regex, ('"context": "Fabricate v{0}"' -f $args[0]) | Set-Content $file

# Update version in main menu credits
$file = ".\config\isxander-main-menu-credits.json"
$regex = '"text": "Fabricate v\d*\.\d*\.\d*\w?"'
(Get-Content $file) -Replace $regex, ('"text": "Fabricate v{0}"' -f $args[0]) | Set-Content $file

# Update pack compat checker versioning
$file = ".\config\bcc.json"
$regex = '"modpackVersion": "v\d*\.\d*\.\d*\w?",'
(Get-Content $file) -Replace $regex, ('"modpackVersion": "v{0}",' -f $args[0]) | Set-Content $file

# Refresh packwiz index
packwiz refresh