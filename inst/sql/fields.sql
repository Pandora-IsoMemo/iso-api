select * from `{{ dbtools::sqlAssertChar(mappingId) }}_data` limit 0, 1;
select distinct(`variable`) from `extraCharacter` WHERE mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};
select distinct(`variable`) from `extraNumeric` WHERE mappingId IN {{ dbtools::sqlInAlnums(mappingId) }};
