Import-Module au

$softwareRepo = 'SadeghHayeri/GreenTunnel'

function global:au_GetLatest {
    $packagePageUri = 'https://www.npmjs.com/package/green-tunnel'
    $userAgent = 'Update checker of Chocolatey Community Package ''green-tunnel-cli'''
    $packagePage = Invoke-WebRequest -Uri $packagePageUri -UserAgent $userAgent -UseBasicParsing

    if ($packagePage.Content -notmatch '\>\s*([\d]+\.[\d\.]+)\s*\<\/p\>')
    {
        throw 'Version number not found!'
    }

    $version = $Matches[1]
    $script:softwareTag = "v$version"

    return @{
        Version = $version
    }
}

function global:au_BeforeUpdate ($Package)  {
    Set-DescriptionFromReadme -Package $Package -ReadmePath ".\DESCRIPTION.md"
}

function global:au_AfterUpdate ($Package)  {

}

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
            "<packageSourceUrl>[^<]*</packageSourceUrl>" = "<packageSourceUrl>https://github.com/brogers5/chocolatey-package-$($Latest.PackageName)/tree/v$($Latest.Version)</packageSourceUrl>"
            "<licenseUrl>[^<]*</licenseUrl>" = "<licenseUrl>https://github.com/$($softwareRepo)/blob/$($softwareTag)/LICENSE</licenseUrl>"
            "<projectSourceUrl>[^<]*</projectSourceUrl>" = "<projectSourceUrl>https://github.com/$($softwareRepo)/tree/$($softwareTag)</projectSourceUrl>"
            "<copyright>[^<]*</copyright>" = "<copyright>Copyright © $(Get-Date -Format yyyy) Sadegh Hayeri</copyright>"
        }
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]?\s*npmPackageVersion\s*=\s*)('.*')" = "`$1'$($Latest.Version)'"
        }
    }
}

Update-Package -ChecksumFor None -NoReadme
