set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.3807, <2> 23.528, <3> 23.0183, <4> 11.2282, <5> 26.8739, <6> 26.8538, <7> 23.3771, <8> 27.3095, <9> 26.1703, <10> 26.1492;
param workload[JOB] := <1> 594.4185, <2> 553.5668, <3> 529.8421, <4> 126.0725, <5> 722.2065, <6> 721.1266, <7> 546.4888, <8> 745.8088, <9> 684.8846, <10> 683.7807;
param capacity[MACHINE] := <1> 1969.3986, <2> 1969.3986, <3> 1969.3986;

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
