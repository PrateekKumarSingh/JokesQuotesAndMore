Function Get-Joke
{
    ((iwr -Uri "https://raw.githubusercontent.com/PrateekKumarSingh/JokesQuotesAndMore/master/Data.json").content |ConvertFrom-Json).text | random
}

Get-Joke
