function touch {
    if ($args.length -eq 0) {
        Write-Host "Must specify a filepath"
        return
    }
    echo $null >> $args
}
