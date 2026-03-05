# Jocko

Kafka distributed commit log service in Go.

## Goals of this project:

- Implement Kafka in Go
- Protocol compatible with Kafka so Kafka clients and services work with Jocko
- Make operating simpler
- Distribute a single binary
- Use Serf for discovery, Raft for consensus (and remove the need to run ZooKeeper)
- Smarter configuration settings
    - Able to use percentages of disk space for retention policies rather than only bytes and time kept
    - Handling size configs when you change the number of partitions or add topics
- Learn a lot and have fun

## TODO

- [x] Producing
- [x] Fetching
- [x] Partition consensus and distribution
- [ ] Protocol
    - [x] Produce
    - [x] Fetch
    - [x] Metadata
    - [x] Create Topics
    - [x] Delete Topics
    - [ ] Consumer group [current task]
- [x] Discovery
- [ ] API versioning [more API versions to implement]
- [ ] Replication [first draft done - testing heavily now]

## Acknowledgements

The project is a fork of [Jocko](https://github.com/travisjeffery/jocko), originally developed by [Travis Jeffery](https://github.com/travisjeffery).

The primary design of the project is outlined in the following articles:

- [How Jocko's built-in service discovery and consensus works](https://medium.com/the-hoard/building-a-kafka-that-doesnt-depend-on-zookeeper-2c4701b6e961#.uamxtq1yz)
- [How Jocko's (and Kafka's) storage internals work](https://medium.com/the-hoard/how-kafkas-storage-internals-work-3a29b02e026#.qfbssm978)

## License

Jocko is under the MIT license, see the [LICENSE](LICENSE) file for details.
