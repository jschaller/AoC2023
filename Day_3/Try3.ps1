$content = Get-Content .\Day_3_Input.txt
$numberList = [System.Collections.ArrayList]::new()
$symbolList = [System.Collections.ArrayList]::new()
$lineNumber = 1
$value = 0
$content | % {
    $currentLine = $_

    # Find Numbers
    $numberMatches = [regex]::Matches($currentLine, "\d+")
    $numberIndex = 0
    $numberMatches | % {
        $numberList.Add(
            [PSCustomObject]@{
                NumberLine = $lineNumber
                Number = $_
                StartCol = $currentLine.IndexOf($_, $numberIndex)
                EndCol = $currentLine.IndexOf($_, $numberIndex) + $_.Length -1
                Length = $_.Length
            }
        ) | Out-Null
        $numberIndex = $currentLine.IndexOf($_, $numberIndex) + 1
    }

    # Find Symbols
    $symbolMatches = [regex]::Matches($currentLine, "[^a-zA-Z\d\s\.:]")
    $symbolIndex = 0
    $symbolMatches | % {
        $symbolList.Add(
            [PSCustomObject]@{
                SymbolLine = $lineNumber
                Symbol = $_
                Col = $currentLine.IndexOf($_, $symbolIndex)
            }
        )
        $symbolIndex = $currentLine.IndexOf($_, $symbolIndex) + 1
    } | Out-Null
    $lineNumber++
}
$numberList | Measure-Object
$symbolList | Measure-Object
$symbolList | % {
    $line = $_.SymbolLine
    $col = $_.Col

    # Top Row
    $numberList | ? {$_.NumberLine -eq ($line-1)} | % {
        $break = $false
        while($true) {
            if($_.EndCol -eq ($col-1)) {
                $value = $value + $_.Number.Value
                break
            }
            if($_.StartCol -le $col -and $col -le $_.EndCol) {
                $value = $value + $_.Number.Value
                break
            }
            if($_.StartCol -eq ($col+1)) {
                $value = $value + $_.Number.Value
                break
            }
            else {
                break
            }
        }
    }
    # Middle Row
    $numberList | ? {$_.NumberLine -eq ($line)} | % {
        $break = $false
        while($true) {
            if($_.EndCol -eq ($col-1)) {
                $value = $value + $_.Number.Value
                break
            }
            if($_.StartCol -eq ($col+1)) {
                $value = $value + $_.Number.Value
                break
            }
            else {
                break
            }
        }
    }
    # Bottom Row
    $numberList | ? {$_.NumberLine -eq ($line+1)} | % {
        $break = $false
        while($true) {
            if($_.EndCol -eq ($col-1)) {
                $value = $value + $_.Number.Value
                break
            }
            if($_.StartCol -le $col -and $col -le $_.EndCol) {
                $value = $value + $_.Number.Value
                break
            }
            if($_.StartCol -eq ($col+1)) {
                $value = $value + $_.Number.Value
                break
            }
            else {
                break
            }
        }
    }
}
$value