#!/bin/bash
echo 'launching databases...'
kubectl exec -it booking-mongo-0 -- mongosh --eval "rs.initiate({
  _id: 'rs1',
  members: [
    {_id: 0, host: 'booking-mongo-0.booking-mongo.default.svc.cluster.local:27017'},
    {_id: 1, host: 'booking-mongo-1.booking-mongo.default.svc.cluster.local:27017'},
    {_id: 2, host: 'booking-mongo-2.booking-mongo.default.svc.cluster.local:27017'}
  ]
})"
echo 'launched!'