set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.9537, <2> 20.7474, <3> 22.6636, <4> 19.6111, <5> 24.5895, <6> 25.9395, <7> 27.7999, <8> 21.5226, <9> 28.1316, <10> 26.2868;
param workload[JOB] := <1> 24.9537, <2> 20.7474, <3> 22.6636, <4> 19.6111, <5> 24.5895, <6> 25.9395, <7> 27.7999, <8> 21.5226, <9> 28.1316, <10> 26.2868;
param capacity[MACHINE] := <1> 242.2457, <2> 242.2457, <3> 242.2457;

var x[JM] binary;
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
