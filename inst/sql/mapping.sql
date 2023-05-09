SELECT * FROM `mapping` WHERE mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};
