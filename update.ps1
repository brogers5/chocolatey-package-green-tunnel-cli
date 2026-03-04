Import-Module au

$softwareRepo = 'SadeghHayeri/GreenTunnel'

function global:au_GetLatest {
    $packagePageUri = 'https://registry.npmjs.org/green-tunnel'
    $userAgent = 'Update checker of Chocolatey Community Package ''green-tunnel-cli'''
    $packageInfo = Invoke-RestMethod -Uri $packagePageUri -UserAgent $userAgent -UseBasicParsing

    $version = $packageInfo.'dist-tags'.latest

    return @{
        SoftwareVersion = $version
        Version         = $version  #This may change if building a package fix version
    }
}

function global:au_BeforeUpdate ($Package) {
    Set-DescriptionFromReadme -Package $Package -ReadmePath '.\DESCRIPTION.md'
}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            '<packageSourceUrl>[^<]*</packageSourceUrl>' = "<packageSourceUrl>https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)</packageSourceUrl>"
            '<licenseUrl>[^<]*</licenseUrl>'             = "<licenseUrl>https://github.com/$($softwareRepo)/blob/v$($Latest.SoftwareVersion)/LICENSE</licenseUrl>"
            '<projectSourceUrl>[^<]*</projectSourceUrl>' = "<projectSourceUrl>https://github.com/$($softwareRepo)/tree/v$($Latest.SoftwareVersion)</projectSourceUrl>"
            '<copyright>[^<]*</copyright>'               = "<copyright>Copyright © $(Get-Date -Format yyyy) Sadegh Hayeri</copyright>"
        }
        'tools\chocolateyInstall.ps1'   = @{
            "(^[$]?\s*npmPackageVersion\s*=\s*)('.*')" = "`$1'$($Latest.SoftwareVersion)'"
        }
    }
}

Update-Package -ChecksumFor None -NoReadme
