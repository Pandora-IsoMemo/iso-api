select max(`timestamp`) as `lastUpdate` from `updated` WHERE mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};
