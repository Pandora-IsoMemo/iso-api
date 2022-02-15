SELECT *
  FROM `data`
 WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }};

SELECT *
  FROM `extraNumeric`
  WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }};

SELECT *
  FROM `extraCharacter`
  WHERE source IN {{ dbtools::sqlInAlnums(dbsource) }};

