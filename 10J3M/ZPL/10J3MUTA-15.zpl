set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.6717, <2> 16.7968, <3> 10.8015, <4> 46.1883, <5> 25.525, <6> 2.6593, <7> 22.9501, <8> 6.6162, <9> 48.6422, <10> 5.1845;
param workload[JOB] := <1> 58.855, <2> 282.1325, <3> 116.6724, <4> 2133.3591, <5> 651.5256, <6> 7.0719, <7> 526.7071, <8> 43.7741, <9> 2366.0636, <10> 26.879;
param capacity[MACHINE] := <1> 1553.26, <2> 1553.26, <3> 1553.26;

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
