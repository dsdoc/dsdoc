===============================================
PaxosLease算法: 实现租约的无盘Paxos算法
===============================================

原文名：PaxosLease: Diskless Paxos for Leases

Marton Trencseni, mtrencseni@scalien.com
Attila Gazso, agazso@scalien.com

这篇论文描述了PaxosLease算法，一种用于租约协商的分布式算法。PaxosLease基于Paxos算法，但无需写盘和时钟同步。PaxosLease在开源分布式复制KV存储Keyspace中被用来做Master租约协商。

1. 介绍
=====================

在并发编程中，*锁* 是进程用来同步共享资源访问的基本原语。在锁以不设置过期时间方式分配（也没有一个监督进程）的系统中，锁的持有者在释放锁之前如果失效（Failure），就可能导致其它进程阻塞。

在高可用系统中，期望避免单点失效导致整个系统阻塞的情况。另外，“重启”失效的系统会比重启一个多线程程序要更困难。因此，在分布式系统中，*租约* 取代锁以避免饿死的情况。一个 *租约* 就是 *有过期时间的锁* 。如果锁的持有者失效了或是和其它结点断开连接，它的租约会自动过期，其它结点可以得到租约。

我们假设基本的步骤如下：系统由一组请求者和一组接受者组成，请求者和接受者都有各自的算法；系统没有拜占庭问题，即结点之间不会通过不遵守各自算法作弊（也没有被Hack）。接受者的数目是固定不变的。

一个朴素的多数派投票式的算法可以正确地解决分布式租约的问题；这里 *正确* 的意思是，任何时候租约不会被多于一个结点持有。但是，这个简单的算法在有多个请求者时会频繁 *阻塞* ，因此需要一个更成熟的方案。

朴素的多数派算法是这样的： 请求者启动一个开始本地超时计时，超时时间T秒，然后向接受者发送请求时长为T的租约。接受者收到请求后启动一个时长为T秒的定时器，然后发送接受消息给请求者。超时之后，接受者清除自己的状态。如果接受者收到一个请求但他的状态不是空，则接受者不回应或是发一个拒绝消息。为确保任何时间只有一个请求者能获得租约，请求者必须收到多数派的接受者的接受消息；这样它获取租约直到它本地的定时器超时。

正如上面讨论的，有多个请求者时，有可能（而且很有可能）没有请求者能得到多数派，请求者会一直互相阻塞着。举个例子，有3个请求者1、2、3和三个接受者A、B、C，如果分布状态是这样的：A接受1的请求，B接受2的和C接受3的，然后没有一个请求者得到多数派的接受。系统必须等到超时过期，接受者清空自己的状态，这时请求者会再重试。但很很可能会再次阻塞。

在本文描述的解决方法是采取Paxos [1]_ 方案，引入 *准备* 和 *提案* 阶段，这样可以完全避免这类阻塞问题。Paxos解决

参考
=====================

.. [1] L. Lamport, The Part-Time Parliament, ACM Transactions on Computer Systems 16, 2 (May 1998), 133-169.

.. [2] L. Lamport, Paxos Made Simple, ACM SIGACT News 32, 4 (Dec. 2001), 18-25.

.. [3] T. Chandra, R. Griesemer, J. Redstone, Paxos Made Live - An Engineering Perspective, PODC ’07: 26th ACM Symposium on Principles of Distributed Computing

.. [4] M. Burrows, The Chubby Lock Service for Loosely-Coupled Distributed Systems, OSDI’06: Seventh Symposium on Operating System Design and Implementation.

.. [5] F. Hupfeld et al., FaTLease: Scalable Fault-Tolerant Lease Negotiation with Paxos, HPDC08, June 2327, 2008, Boston, Massachusetts, USA.

.. [6] AGPL License. http://www.fsf.org/licensing/licenses/agpl-3.0.html