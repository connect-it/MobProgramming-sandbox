<### Powershell Bingo V.0.1 ####
Author Ali Özcan
Beta 4 ever
###>


[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing") 
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")


$form = New-Object System.Windows.Forms.Form
$form.StartPosition = "CenterScreen"
$form.Size = New-Object System.Drawing.Size(700,500)
$form.Text = "Bingo V.0.1"
$form.MaximizeBox = $false

function Get-Number{
	$loop = $true
	while($loop -eq $true){
		$neueZahl = Get-Random -InputObject (1..75) -Count 1
		if($zahlen -notcontains $neueZahl){
			$loop = $false
		}
	}
	echo "$neueZahl"
	[array]$zahlen += $neueZahl
}

$font = New-Object System.Drawing.Font("Times New Roman",18,[System.Drawing.FontStyle]::Italic)
$fontneu = New-Object System.Drawing.Font("Times New Roman",45,[System.Drawing.FontStyle]::Italic)

$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(300,300)
$Button.Size = New-Object System.Drawing.Size(75,23)
$Button.Text = "Neue Zahl"

$Button.Add_Click({
	if(($label1 -ne $null) -and ($label2 -ne $null)){
 		$label1.Dispose()
		$label2.Dispose()
		
	}
	if($zahlen.Length -eq 75){
		$label1.Dispose()
		$label2.Dispose()
		$Button.Dispose()
		
		$label3 = New-Object System.Windows.Forms.Label
		$label3.Location = New-Object System.Drawing.Size(10,50) 
		$label3.Size = New-Object System.Drawing.Size(400,600)
		$label3.Font = $font 
		$label3.Controls.Clear()
		$label3.Text = "Das Spiel ist beendet. Alle Zahlen gezogen"
		$form.Controls.Add($label3)
		
		
	}
	
	if($zahlen.Length -le 74){
	$neueZahl = Get-Number
	[array]$zahlen += $neueZahl
	
	$letzteZahl = $zahlen.Length
	
	if($letzteZahl -gt 0){
		$label2 = New-Object System.Windows.Forms.Label
		$label2.Location = New-Object System.Drawing.Size(10,300) 
		$label2.Size = New-Object System.Drawing.Size(150,250)
		$label2.Font = $font 
		$label2.Text = "Letzte Zahl "+$zahlen[$letzteZahl-2]
		$form.Controls.Add($label2)
	}
		
	$label1 = New-Object System.Windows.Forms.Label
	$label1.Location = New-Object System.Drawing.Size(270,50) 
	$label1.Size = New-Object System.Drawing.Size(400,400)
	$label1.Font = $fontneu 
	$label1.Controls.Clear()
	$label1.Text = $neueZahl
	$form.Controls.Add($label1)
	}
})
$form.Controls.Add($Button)

[void] $form.ShowDialog()
