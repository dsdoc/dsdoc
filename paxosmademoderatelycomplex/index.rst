.. highlight:: c

.. _paxos:

===============================================
【译】Paxos Made Moderately Complex
===============================================

:原文名:
    .. line-block::

        Paxos Made Moderately Complex

:翻译:
    .. line-block::

        `Jerry Lee oldratlee<at>gmail<dot>com <http://oldratlee.com>`_

Robbert van Renesse
Cornell University
rvr@cs.cornell.edu

2011/03/25

摘要
================================

对于任何一个要实现Paxos的人，Paxos决不是一个简单的协议，尽管它基于相对简单的不变式。本论文给出了 *完全Paxos* （The full Paxos）（或称 *多Paxos* (Multi-Paxos)）的命令式的伪代码，不会回避讨论各种各样的实现细节。前一部分的描述先不考虑协议的优化让方便理解。后一部分讨论算法的活性（Liveness），并列出让协议更实用的各种优化。

1 介绍
=================================

Paxos [13]_






.. _references:

参考文献
=================================

.. [1] P. Alvaro, T. Condie, N. Conway, J.M. Hellerstein, and R.C. Sears. I DoDeclare: Consensus in a logic language. In *Proceedings of the SOSP Workshop on Networking Meets Databases (NetDB)*, 2009.

.. [2] H. Attiya, A. Bar Noy, and D. Dolev. Sharing memory robustly in message passing systems. *Journal of the ACM*, 42(1):121-132, 1995.

.. [3] R. Boichat, P. Dutta, S. Frolund, and R. Guer-raoui. Deconstructing Paxos. *ACM SIGACT News*, 34(1), March 2003.

.. [4] M. Burrows. The Chubby Lock Service for loosely-coupled distributed systems. In *:sup:`7th` Sym-posium on Operating System Design and Implementation*, Seattle, WA, November 2006.

.. [5] T.D. Chandra, R. Griesemer, and J. Redstone. Paxos made live: an engineering perspective. In *Proc. of the 26:sup:`th` ACM Symp. on Principles of Distributed Computing*, pages 398-407, Portland, OR, May 2007. ACM.

.. [6] T.D. Chandra and S. Toueg. Unreliable failure detectors for asynchronous systems. InProc. of the 11th ACM Symp. on Principles of Dis-tributed Computing, pages 325{340, Montreal, Quebec, August 1991. ACM SIGOPS-SIGACT.

.. [7] M.J. Fischer, N.A. Lynch, and M.S. Patterson. Impossibility of distributed consensus with one faulty process. J. ACM, 32(2):374-382, April 1985.

.. [8] C. Gray and D. Cheriton. Leases: an efficient fault-tolerant mechanism for distributed file cache consistency. In *Proc. of the Twelfth ACM Symp. on Operating Systems Principles*, pages 202-210, Litchfield Park, AZ, November 1989.

.. [9] M. Herlihy and J. Wing. Linearizability: a correctness condition for concurrent objects. ACM Transactions on Programming Languages and Systems (TOPLAS), 12(3):463-492, 1990.

.. [10] F. Junqueira, P. Hunt, M. Konar, and B. Reed. The ZooKeeper Coordination Service (poster). In Symposium on Operating Systems Principles (SOSP), 2009.

.. [11] J. Kirsch and Y. Amir. Paxos for system builders. Technical Report CNDS-2008-2, Johns Hopkins University, 2008.

.. [12] L. Lamport. Time, clocks, and the order-ing of events in a distributed system. CACM, 21(7):558-565, July 1978.

.. [13] L. Lamport. The part-time parliament. Trans. on Computer Systems, 16(2):133-169, 1998.

.. [14] L. Lamport. Paxos made simple. ACM SIGACT News (Distributed Computing Col-umn), 32(4):51-58, 2001.

.. [15] B. Lampson. How to build a highly available system using consensus. In O. Babaoglu and K. Marzullo, editors,Distributed Algorithms, volume 115 ofLecture Notes on Computer Sci-ence, pages 1-17. Springer-Verlag, 1996.

.. [16] B.W. Lampson. The ABCD's of Paxos. In Proc. of the 20th ACM Symp. on Principles of Dis-tributed Computing, page 13, Newport, RI, 2001. ACM Press.

.. [17] H.C. Li, A. Clement, A. S. Aiyer, and L. Alvisi. The Paxos register. InProceedings of the 26th IEEE International Symposium on Reliable Dis-tributed Systems (SRDS 07), 2007.

.. [18] D. Mazieres. Paxos made practical. Technical Report on the web at scs.stanford.edu/~dm/home/papers/paxos.pdf, Stanford University, 2007.

.. [19] B.M. Oki and B.H. Liskov. Viewstamped repli-cation: A general primary-copy method to sup-port highly-available distributed systems. In Proc. of the 7th ACM Symp. on Principles of Distributed Computing, pages 8-17, Toronto, Ontario, August 1988. ACM SIGOPS-SIGACT.

.. [20] R. De Prisco, B. Lampson, and N. Lynch. Revis-iting the Paxos algorithm. Theoretical Computer Science, 243(1-2):35-91, July 2000.

.. [21] R.D. Schlichting and F.B. Schneider. Fail-stop processors: an approach to designing fault-tolerant computing systems. Trans. on Com-puter Systems, 1(3):222-238, August 1983.

.. [22] F.B. Schneider. Implementing fault-tolerant ser-vices using the state machine approach: A tuto-rial. ACM Computing Surveys, 22(4):299-319, December 1990.

.. [23] R.H. Thomas. A solution to the concurrency control problem for multiple copy databases. In Proc. of COMPCON 78 Spring, pages 88-93, Washington, D.C., February 1978. IEEE Com-puter Society.