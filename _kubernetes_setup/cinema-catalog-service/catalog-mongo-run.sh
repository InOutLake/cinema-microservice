#!/bin/bash
echo 'initiating replicaset...'
kubectl exec -it catalog-mongo-0 -- mongosh --eval "rs.initiate({
  _id: 'rs2',
  members: [
    {_id: 0, host: 'catalog-mongo-0.catalog-mongo.default.svc.cluster.local:27017'},
    {_id: 1, host: 'catalog-mongo-1.catalog-mongo.default.svc.cluster.local:27017'},
    {_id: 2, host: 'catalog-mongo-2.catalog-mongo.default.svc.cluster.local:27017'}
  ]
})"
echo 'launched!'