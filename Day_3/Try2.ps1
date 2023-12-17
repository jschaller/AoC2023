#$content = Get-Content .\Day_3_Input.txt
$content = Get-Content .\reddit.txt
$line = 1
$numberTable = @{}
$i = 0
$content | % {
    $currentLine = $_
    $lineNumbers = [regex]::Matches($currentLine, "\d+")
    $lineNumbers | % {
        $startCol = $currentLine.IndexOf($_)
        $endCol = $startCol+$_.Length-1
        $numberTable.add($i, @($_,$line,$startCol,$endCol))
        $i++
    }
    $line++
}
$line = 1
$i = 0
$symbolTable = @{}
$content | % {
    $currentLine = $_
    $lineSymbols = [regex]::Matches($currentLine, "[^a-zA-Z\d\s\.:]")
    $currentIndex=0
    $lineSymbols | % {
        $startCol = $currentLine.IndexOf($_,$currentIndex)
        $endCol = $startCol+$_.Length-1
        $symbolTable.add($i, @($_,$line,$startCol,$endCol))
        $currentIndex = $startCol+1
        $i++
    }
    $line++
}
$numberTable
ForEach ($s in $symbolTable.GetEnumerator()) {
    Write-Host "The numbers in the line above the symbol in line $($s.Value[1]) are: " -NoNewline
    foreach ($n in $numberTable.GetEnumerator()) {
        # Checking for Above
        if($s.Value[1]-1 -eq $n.Value[1] -and ($n.Value[1]-1 -gt 0)) {
            
            Write-Host "$($n.Value[0]) " -NoNewline
        }
        
    }
    Write-Host ""
}