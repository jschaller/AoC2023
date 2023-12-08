$text = Get-Content .\Day_2_Input.txt
$value = 0
$maxRed = 12
$maxGreen = 13
$maxBlue = 14


$text | % {
    $gameValid = $true
    $gameId = ($_.split(":")[0]).split(' ')[1]
    #$hands = $_.split(":")[1]
    #$hands.split(';') | % {
    #}
    $gameReds = [regex]::Matches($_, "\d+\sr\w+")
    $gameGreens = [regex]::Matches($_, "\d+\sg\w+")
    $gameBlues = [regex]::Matches($_, "\d+\sb\w+")
    $gameReds.Value | % {
        if([int]($_.split(' ')[0]) -gt $maxRed) {
            $gameValid = $false
        }
    }
    $gameGreens.Value | % {
        if([int]($_.split(' ')[0]) -gt $maxGreen) {
            $gameValid = $false
        }
    }
    $gameBlues.Value | % {
        if([int]($_.split(' ')[0]) -gt $maxBlue) {
            $gameValid = $false
        }
    }
    if($gameValid) {
        $value = $value + $gameId
    }
}
Write-Host $value