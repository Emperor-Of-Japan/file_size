
#lancer le script:
#powershell "chemin"\Script_taille_fichier.ps1

#-----------------------------------------------------
#Variable
$path = read-host "emplacement du répertoire"
$size = read-host "taille minimum des fichiers (en MO)"
$sizeMB = $size  + 'MB'

#-----------------------------------------------------
#on test la saisi utilisateurs
 $test=Test-Path -Path $path
 while ($test -eq $false)
    {
    $path = read-host "emplacement du répertoire(C:\)"
    $test=Test-Path -Path $path
    }


#-----------------------------------------------------
#code
#on récupère dans un fichier le résultat de la commande
#on cherche dans $path tous les fichiers dont la taille est supérieure à $sizeMB cela crée un tableau dont la taille afficher en GB avec le nom du fichier et son emplacement
try{
Get-ChildItem -Path $path -File -Recurse -ErrorAction SilentlyContinue | Where-Object {$_.Length -gt $sizeMB} | Sort-Object length -Descending | Select-Object Name,Directory,@{n='GB';e={"{0:N2}" -F ($_.length/ 1GB)}} | out-file C:\Users\jecolas\Downloads\size.txt
}
catch{""}
Read-Host "Terminer, lire le fichier size.txt à "$pwd
