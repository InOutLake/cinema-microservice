#!/bin/bash
echo 'launching databases...'
kubectl exec -it movies-mongo-0 -- mongosh --eval "rs.initiate({
  _id: 'rs3',
  members: [
    {_id: 0, host: 'movies-mongo-0.movies-mongo.default.svc.cluster.local:27017'},
    {_id: 1, host: 'movies-mongo-1.movies-mongo.default.svc.cluster.local:27017'},
    {_id: 2, host: 'movies-mongo-2.movies-mongo.default.svc.cluster.local:27017'}
  ]
})"
echo 'launched!'