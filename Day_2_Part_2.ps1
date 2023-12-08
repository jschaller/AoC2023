$text = Get-Content .\Day_2_Input.txt
$value = 0
$maxRed = 12
$maxGreen = 13
$maxBlue = 14


$text | % {
    $listReds = New-Object Collections.Generic.List[Int]
    $listGreens = New-Object Collections.Generic.List[Int]
    $listBlues = New-Object Collections.Generic.List[Int]
    $gameReds = [regex]::Matches($_, "\d+\sr\w+")
    $gameGreens = [regex]::Matches($_, "\d+\sg\w+")
    $gameBlues = [regex]::Matches($_, "\d+\sb\w+")
    $gameReds.Value | % {
        $listReds.Add($_.Split(' ')[0])
    }
    $gameGreens.Value | % {
        $listGreens.Add($_.Split(' ')[0])
    }
    $gameBlues.Value | % {
        $listBlues.Add($_.Split(' ')[0])
    }
    $maxReds = ($listReds | Measure -Maximum).Maximum
    $maxGreens = ($listGreens | Measure -Maximum).Maximum
    $maxBlues = ($listBlues | Measure -Maximum).Maximum
    $gamePower = $maxReds * $maxGreens * $maxBlues
    $value = $value + $gamePower
}
Write-Host $value