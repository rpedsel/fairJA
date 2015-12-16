set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 47.2688, <2> 37.2215, <3> 12.7702, <4> 13.8266, <5> 48.8094, <6> 18.3202, <7> 14.8356, <8> 46.6387, <9> 17.3669, <10> 15.3004;
param workload[JOB] := <1> 36.6656, <2> 30.1832, <3> 8.3027, <4> 43.6089, <5> 21.1835, <6> 44.5718, <7> 31.6464, <8> 7.6897, <9> 2.7245, <10> 48.706;
param capacity[MACHINE] := <1> 91.7608, <2> 91.7608, <3> 91.7608;

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
