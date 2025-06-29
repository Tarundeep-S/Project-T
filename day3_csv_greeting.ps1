# Day 3 - CSV Greeting Script

$users = Import-Csv -Path "../names.csv"

foreach ($user in $users) {
    Write-Host "Hello, $($user.Name)! Welcome to Project T"
}
