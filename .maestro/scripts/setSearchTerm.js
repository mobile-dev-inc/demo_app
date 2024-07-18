// setSearchTerm.js

output.searchTerm = 'blackberries'
if (maestro.platform == 'android'){
    output.searchTerm = 'robots'
}
if (maestro.platform == 'ios'){
    output.searchTerm = 'apples'
}
