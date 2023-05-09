SELECT *
  FROM `{{ dbtools::sqlAssertChar(mappingId) }}_data`
 WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }};

SELECT *
  FROM `extraNumeric`
  WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }} AND mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};

SELECT *
  FROM `extraCharacter`
  WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }} AND mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};
