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
$j2 = $a.ParsedHtml.getElementsByTagName("p")|?{$_.id -like "joke_*"}| %{$_.innertext}
$j2 = foreach($item in ($a.ParsedHtml.getElementsByTagName("p")| %{$_.innertext}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}


$b = (iwr -Uri "http://staging.laughfactory.com/jokes/technology-jokes/2")
$j3 = $a.ParsedHtml.getElementsByTagName("p")|?{$_.id -like "joke_*"}| %{$_.innertext}
$j3 = foreach($item in ($a.ParsedHtml.getElementsByTagName("p")| %{$_.innertext}))
{
    ''|select @{n='Category';e={'joke'}}, @{n='text';e={[System.Web.HttpUtility]::HtmlDecode($item)}}
}

$joke = $j1+$j2+$j3
