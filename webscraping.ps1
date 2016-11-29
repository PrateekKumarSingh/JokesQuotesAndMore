[System.Reflection.Assembly]::LoadWithPartialName("System.web")|Out-Null

#$r = (iwr -uri "http://www.short-funny.com")
#$div = $r.ParsedHtml.getElementsByTagName("div")
#$div| %{ $_.innertext}
#
$j1 = (iwr -uri "http://api.icndb.com/jokes/"| % content | ConvertFrom-Json).value.joke
$j1 = foreach($item in $j1)
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$a = (iwr -uri "http://staging.laughfactory.com/jokes/technology-jokes")
$j2 = foreach($item in ($a.ParsedHtml.getElementsByTagName("p")|?{$_.id -like "joke_*"}| %{$_.innertext}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}


$b = (iwr -Uri "http://staging.laughfactory.com/jokes/technology-jokes/2")
$j3 = foreach($item in ($b.ParsedHtml.getElementsByTagName("p")|?{$_.id -like "joke_*"}| %{$_.innertext}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$j4 = foreach($item in (((iwr -uri "http://tambal.azurewebsites.net/").content |ConvertFrom-Json).joke))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$c = (iwr -Uri "http://staging.laughfactory.com/jokes/technology-jokes/3")
$j5 = foreach($item in ($c.ParsedHtml.getElementsByTagName("p")|?{$_.id -like "joke_*"}| %{$_.innertext}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$d= (iwr -Uri "http://www.techrepublic.com/article/the-geekiest-tech-jokes-on-the-internet/")
($d.ParsedHtml.getElementsByTagName("div") |?{$_.classname -eq 'content'}).innerhtml
$j5 = foreach($item in ($d.ParsedHtml.getElementsByTagName("p")| %{$_.innertext|?{$_ -like "*. *."}}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$joke = $j1+$j2+$j3+$j4
