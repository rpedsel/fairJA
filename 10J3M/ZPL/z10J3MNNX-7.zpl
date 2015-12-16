set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.7644, <2> 14.2063, <3> 25.4075, <4> 21.7415, <5> 24.3141, <6> 10.2237, <7> 43.9436, <8> 20.0159, <9> 25.2062, <10> 23.7191;
param workload[JOB] := <1> 5.0759, <2> 3.7691, <3> 5.0406, <4> 4.6628, <5> 4.9309, <6> 3.1975, <7> 6.629, <8> 4.4739, <9> 5.0206, <10> 4.8702;
param capacity[MACHINE] := <1> 47.6705, <2> 47.6705, <3> 47.6705;

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
