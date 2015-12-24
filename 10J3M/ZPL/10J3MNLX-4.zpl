set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.8642, <2> 31.2757, <3> 28.1041, <4> 14.9715, <5> 22.9421, <6> 30.6054, <7> 26.6896, <8> 26.7647, <9> 26.5287, <10> 26.1823;
param workload[JOB] := <1> 5.7327, <2> 5.5925, <3> 5.3013, <4> 3.8693, <5> 4.7898, <6> 5.5322, <7> 5.1662, <8> 5.1735, <9> 5.1506, <10> 5.1169;
param capacity[MACHINE] := <1> 17.1417, <2> 17.1417, <3> 17.1417;

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
