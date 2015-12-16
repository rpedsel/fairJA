set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.6551, <2> 19.477, <3> 26.9075, <4> 33.1804, <5> 19.2788, <6> 27.4948, <7> 27.2954, <8> 20.5709, <9> 17.458, <10> 25.8356;
param workload[JOB] := <1> 5.353, <2> 4.4133, <3> 5.1872, <4> 5.7602, <5> 4.3908, <6> 5.2435, <7> 5.2245, <8> 4.5355, <9> 4.1783, <10> 5.0829;
param capacity[MACHINE] := <1> 49.3692, <2> 49.3692, <3> 49.3692;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
