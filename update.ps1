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
            '(<packageSourceUrl>)[^<]*(</packageSourceUrl>)' = "`$1https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)`$2"
            '(<licenseUrl>)[^<]*(</licenseUrl>)'             = "`$1https://github.com/$($softwareRepo)/blob/v$($Latest.SoftwareVersion)/LICENSE`$2"
            '(<projectSourceUrl>)[^<]*(</projectSourceUrl>)' = "`$1https://github.com/$($softwareRepo)/tree/v$($Latest.SoftwareVersion)`$2"
            '(<docsUrl>)[^<]*(</docsUrl>)'                   = "`$1https://github.com/SadeghHayeri/GreenTunnel/blob/v$($Latest.SoftwareVersion)/README.md`$2"
            '(<copyright>)[^<]*(</copyright>)'               = "`$1Copyright © $(Get-Date -Format yyyy) Sadegh Hayeri`$2"
        }
        'tools\chocolateyInstall.ps1'   = @{
            "(^[$]?\s*npmPackageVersion\s*=\s*)('.*')" = "`$1'$($Latest.SoftwareVersion)'"
        }
    }
}

Update-Package -ChecksumFor None -NoReadme
