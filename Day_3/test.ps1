$content = Get-Content .\Day_3_Input.txt
#$content = Get-Content .\test.txt
#$content = Get-Content .\reddit.txt
$regex = "[^a-zA-Z\d\s\.:]"
$line = 0
$blueprint = @()
$value = 0

$content | % {
    $charArray = $_.ToCharArray()
    $charArray | % {
        $blueprint += $_
    }
}
$blueprint | % {
    if(([regex]::Match($_ , $regex)).Success) {
        $currentLine = [math]::floor($counter/140)+1
        Write-Host "Symbol found at $counter (Line $currentLine Col $(($counter%140)+1))"
        if($counter -gt -1) {
            $checkMiddle = $true
            $checkRight = $true
            if(([regex]::Match($blueprint[$counter-141], "\d")).Success -and ([math]::floor((($counter-141+$checkingLeft)/140)+1) -eq ($currentLine-1))) {
                Write-Host "---Top Left---"
                #Start looking to left of number
                $num = ($blueprint[$counter-141]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-141+$checkingLeft], "\d")).Success -and ([math]::floor((($counter-141+$checkingLeft)/140)+1) -eq ($currentLine-1))) {
                    $num = ($blueprint[$counter-141+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-141+$checkingRight], "\d")).Success -and ([math]::floor((($counter-141+$checkingRight)/140)+1) -eq ($currentLine-1))) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-141+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check  top middle
            if($checkMiddle -and ([regex]::Match($blueprint[$counter-140], "\d")).Success -and ([math]::floor((($counter-140+$checkingLeft)/140)+1) -eq ($currentLine-1))) {
                Write-Host "---Top Middle---"
                #Start looking to left of number
                $num = ($blueprint[$counter-140]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-140+$checkingLeft], "\d")).Success) {
                    Write-Host "hi!"
                    $num = ($blueprint[$counter-140+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-140+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    Write-Host "hello!"
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-140+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check top right
            if($checkRight -and ([regex]::Match($blueprint[$counter-139], "\d")).Success -and ([math]::floor((($counter-139+$checkingLeft)/140)+1) -eq ($currentLine-1))) {
                Write-Host "---Top Right---"
                #Start looking to left of number
                $num = ($blueprint[$counter-139]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-139+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-139+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-139+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-139+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check middle left
            if(([regex]::Match($blueprint[$counter-1], "\d")).Success) {
                Write-Host "---Middle Left---"
                $num = ($blueprint[$counter-1]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-1+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-1+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check middle right
            if(([regex]::Match($blueprint[$counter+1], "\d")).Success) {
                Write-Host "---Middle Right---"
                $num = ($blueprint[$counter+1]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingRight = 1
                while(([regex]::Match($blueprint[$counter+1+$checkingRight], "\d")).Success) {
                    $num = $num + ($blueprint[$counter+1+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            $checkMiddle = $true
            $checkRight = $true
            # Check bottom left
            if(([regex]::Match($blueprint[$counter+139], "\d")).Success) {
                Write-Host "---Bottom Left---"
                #Start looking to left of number
                $num = ($blueprint[$counter+139]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+139+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+139+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+139+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+139+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check bottom middle
            if($checkMiddle -and ([regex]::Match($blueprint[$counter+140], "\d")).Success) {
                Write-Host "---Bottom Middle---"
                #Start looking to left of number
                $num = ($blueprint[$counter+140]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+140+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+140+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+140+$checkingRight], "\d")).Success) {
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+140+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
            # Check bottom right
            if($checkRight -and ([regex]::Match($blueprint[$counter+141], "\d")).Success) {
                Write-Host "---Bottom Right---"
                #Start looking to left of number
                $num = ($blueprint[$counter+141]).ToString()
                #Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+141+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+141+$checkingLeft]).ToString() + $num
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+141+$checkingRight], "\d")).Success) {
                    $num = $num + ($blueprint[$counter+141+$checkingRight]).ToString()
                    #Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                }
                Write-Host $num
                $value = $value + [int]$num
                Write-Host "Current Value: $value"
            }
        }
    }
    $counter++
}
Write-Host $blueprint.Count
Write-host $value