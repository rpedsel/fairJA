set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.667, <2> 11.3209, <3> 30.7758, <4> 42.539, <5> 19.5596, <6> 41.6141, <7> 2.0922, <8> 25.4761, <9> 7.3716, <10> 13.5499;
param workload[JOB] := <1> 24.1204, <2> 48.0431, <3> 2.2532, <4> 13.3568, <5> 6.1925, <6> 6.7616, <7> 14.031, <8> 18.2362, <9> 2.6394, <10> 5.8124;
param capacity[MACHINE] := <1> 141.4466, <2> 141.4466, <3> 141.4466;

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
