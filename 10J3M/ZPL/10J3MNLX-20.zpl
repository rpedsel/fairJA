set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2271, <2> 25.5599, <3> 26.8362, <4> 28.8627, <5> 25.7411, <6> 31.4832, <7> 25.6889, <8> 28.6719, <9> 28.7437, <10> 23.8512;
param workload[JOB] := <1> 4.4975, <2> 5.0557, <3> 5.1804, <4> 5.3724, <5> 5.0736, <6> 5.611, <7> 5.0684, <8> 5.3546, <9> 5.3613, <10> 4.8838;
param capacity[MACHINE] := <1> 17.1529, <2> 17.1529, <3> 17.1529;

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
