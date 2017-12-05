$list = import-csv "C:\Users\mark\Documents\GitHub\Advent of Code\2015\day2.csv"

$paperNeed = 0
$ribbonNeed = 0
foreach ($gift in $list) {
    [int]$length = $gift.dimensions.split('x')[0]
    [int]$width  = $gift.dimensions.split('x')[1]
    [int]$height = $gift.dimensions.split('x')[2]

    [int]$side1 = $length * $width
    [int]$side2 = $width * $height
    [int]$side3 = $height * $length
    [int]$slack = (@($side1,$side2,$side3) | Measure -Minimum).Minimum

    [int]$surfaceArea = (2*$side1)+(2*$side2)+(2*$side3)+$slack
    [int]$ribbon = ((@($length,$width,$height) | Sort-Object)[0]+(@($length,$width,$height) | Sort-Object)[1])*2
    [int]$bow = $length*$width*$height
    
    $paperNeed += $surfaceArea
    $ribbonNeed += $ribbon + $bow
}

Write-Host "Total need is $paperNeed square feet of wrapping paper and $ribbonNeed feet of ribbon."