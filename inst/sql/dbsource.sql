SELECT DISTINCT `source` AS `dbsource` FROM {{ dbtools::sqlAssertChar(mappingId) }}_data;
