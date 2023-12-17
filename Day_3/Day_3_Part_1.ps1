#$content = Get-Content .\Day_3_Input.txt
$content = Get-Content .\test.txt
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
$counter = 0
$blueprint | % {
    if(([regex]::Match($_ , $regex)).Success) {
        Write-Host "Symbol found at $counter"
        <#if($counter -lt 141) {
            # Check middle left
            if(([regex]::Match($blueprint[$counter-1], "\d")).Success) {
                $num = ($blueprint[$counter-1]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-1-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-1-$checkingLeft]).ToString() + $num
                    $checkingLeft--
                }
                Write-Host "$counter $num"
                $value = $value + [int]$num
            }
            # Check middle right
            if(([regex]::Match($blueprint[$counter+1], "\d")).Success) {
                $num = ($blueprint[$counter-1]).ToString()
                $checkingRight = 1
                while(([regex]::Match($blueprint[$counter+1+$checkingRight], "\d")).Success) {
                    $num = ($blueprint[$counter+1+$checkingRight]).ToString() + $num
                    $checkingRight++
                }
                $value = $value + [int]$num
            }
            $checkMiddle = $true
            $checkRight = $true
            # Check bottom left
            if(([regex]::Match($blueprint[$counter+139], "\d")).Success) {
                #Start looking to left of number
                $num = ($blueprint[$counter+139]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+139-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+139-$checkingLeft]).ToString() + $num
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
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check bottom middle
            if($checkMiddle) {
                #Start looking to left of number
                $num = ($blueprint[$counter-140]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+140-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+140-$checkingLeft]).ToString() + $num
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+140+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+140+$checkingRight]).ToString()
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check bottom right
            if($checkRight) {
                #Start looking to left of number
                $num = ($blueprint[$counter+141]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+141-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+141-$checkingLeft]).ToString() + $num
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+141+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+141+$checkingRight]).ToString()
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
        }#>
        if($counter -gt 140 -and $counter -lt 19461) {
            $checkMiddle = $true
            $checkRight = $true
            # Always start with checking  top left
            if(([regex]::Match($blueprint[$counter-141], "\d")).Success) {
                #Start looking to left of number
                $num = ($blueprint[$counter-141]).ToString()
                Write-Host "---Top Left---"
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-141-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-141-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-141+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-141+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check top middle
            if($checkMiddle) {
                #Start looking to left of number
                Write-Host "---Top Middle---"
                $num = ($blueprint[$counter-140]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-140-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-140-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-140+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-140+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check top right
            if($checkRight) {
                Write-Host "---Top Right---"
                #Start looking to left of number
                $num = ($blueprint[$counter-139]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-139-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-139-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
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
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check middle left
            if(([regex]::Match($blueprint[$counter-1], "\d")).Success) {
                Write-Host "---Middle Left---"
                $num = ($blueprint[$counter-1]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-1-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-1-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                $value = $value + [int]$num
            }
            # Check middle right
            if(([regex]::Match($blueprint[$counter+1], "\d")).Success) {
                Write-Host "---Middle Right---"
                $num = ($blueprint[$counter-1]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingRight = 1
                while(([regex]::Match($blueprint[$counter+1+$checkingRight], "\d")).Success) {
                    $num = ($blueprint[$counter+1+$checkingRight]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                }
                $value = $value + [int]$num
            }
            $checkMiddle = $true
            $checkRight = $true
            # Check bottom left
            if(([regex]::Match($blueprint[$counter+139], "\d")).Success) {
                Write-Host "---Bottom Left---"
                #Start looking to left of number
                $num = ($blueprint[$counter+139]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+139-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+139-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
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
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check bottom middle
            if($checkMiddle) {
                Write-Host "---Bottom Middle---"
                #Start looking to left of number
                $num = ($blueprint[$counter-140]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+140-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+140-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+140+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+140+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check bottom right
            if($checkRight) {
                Write-Host "---Bottom Right---"
                #Start looking to left of number
                $num = ($blueprint[$counter+141]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter+141-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter+141-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter+141+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter+141+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
        }
        if($counter -gt 19460) {
            $checkMiddle = $true
            $checkRight = $true
            if(([regex]::Match($blueprint[$counter-141], "\d")).Success) {
                Write-Host "---Top Left---"
                #Start looking to left of number
                $num = ($blueprint[$counter-141]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-141-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-141-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-141+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-141+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check  top middle
            if($checkMiddle) {
                Write-Host "---Top Middle---"
                #Start looking to left of number
                $num = ($blueprint[$counter-140]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-140+$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-140+$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                #Start looking to the right
                $checkingRight = 1
                $rightCounter = 0
                while(([regex]::Match($blueprint[$counter-140+$checkingRight], "\d")).Success) {
                    $checkMiddle = $false
                    if($rightCounter -gt 0 ) {
                        $checkRight = $false
                    }
                    $num = $num + ($blueprint[$counter-140+$checkingRight]).ToString()
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check top right
            if($checkRight) {
                Write-Host "---Top Right---"
                #Start looking to left of number
                $num = ($blueprint[$counter-139]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-139-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-139-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
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
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                    $rightCounter++
                }
                $value = $value + [int]$num
            }
            # Check middle left
            if(([regex]::Match($blueprint[$counter-1], "\d")).Success) {
                Write-Host "---Middle Left---"
                $num = ($blueprint[$counter-1]).ToString()
                $checkingLeft = -1
                while(([regex]::Match($blueprint[$counter-1-$checkingLeft], "\d")).Success) {
                    $num = ($blueprint[$counter-1-$checkingLeft]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingLeft--
                }
                $value = $value + [int]$num
            }
            # Check middle right
            if(([regex]::Match($blueprint[$counter+1], "\d")).Success) {
                Write-Host "---Middle Right"
                $num = ($blueprint[$counter-1]).ToString()
                Write-Host "Counter: $counter \nNumber: $num"
                $checkingRight = 1
                while(([regex]::Match($blueprint[$counter+1+$checkingRight], "\d")).Success) {
                    $num = ($blueprint[$counter+1+$checkingRight]).ToString() + $num
                    Write-Host "Counter: $counter \nNumber: $num"
                    $checkingRight++
                }
                $value = $value + [int]$num
            }
        }
    }
    $counter++
}
Write-host $value