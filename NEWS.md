# MpiIsoApi development version

## Version 23.04.1

### New Features
- Option to add a new parameter `mappingId` to the url of an endpoint, e.g. `&mappingId=IsoMemo`.
An endpoint will provide data for the given `mappingId`, where the default `mappingId` is "IsoMemo". (#4)
- `mappingId` can be used with all three endpoints:
  - https://isomemodb.com/testapi/v1/iso-data
  - https://isomemodb.com/testapi/v1/dbsources
  - https://isomemodb.com/testapi/v1/mapping
- Checks to ensure correctness of the new parameter `mappingId`.

