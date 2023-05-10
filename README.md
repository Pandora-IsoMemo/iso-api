# iso-api
API to access data from MPI database

## Access to Data

data is returned in JSON format

- IsoData: https://isomemodb.com/api/v1/iso-data
- IsoData (beta): https://isomemodb.com/testapi/v1/iso-data

You can use the following parameters:

- (only on beta: mappingId)
- dbsource
- category
- field

Example call:

- https://isomemodb.com/api/v1/iso-data?dbsource=LiVES&category=Location&field=site,longitude
- beta version: https://isomemodb.com/api/v1/iso-data?mappingId=IsoMemo&dbsource=LiVES&category=Location&field=site,longitude

### Helper endpoints

- Databases: https://isomemodb.com/api/v1/dbsources
- Mapping: https://isomemodb.com/api/v1/mapping
- Databases (beta): https://isomemodb.com/testapi/v1/dbsources
- Mapping (beta): https://isomemodb.com/testapi/v1/mapping

On _beta_ version you can use the following parameter:

- mappingId

Example calls:

- Databases (beta): https://isomemodb.com/testapi/v1/dbsources?mappingId=IsoMemo
- Mapping (beta): https://isomemodb.com/testapi/v1/mapping?mappingId=IsoMemo

For the production api use /api instead of /testapi
