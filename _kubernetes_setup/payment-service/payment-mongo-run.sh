#!/bin/bash
echo 'launching databases...'
kubectl exec -it payment-mongo-0 -- mongosh --eval "rs.initiate({
  _id: 'rs4',
  members: [
    {_id: 0, host: 'payment-mongo-0.payment-mongo.default.svc.cluster.local:27017'},
    {_id: 1, host: 'payment-mongo-1.payment-mongo.default.svc.cluster.local:27017'},
    {_id: 2, host: 'payment-mongo-2.payment-mongo.default.svc.cluster.local:27017'}
  ]
})"
echo 'launched!'