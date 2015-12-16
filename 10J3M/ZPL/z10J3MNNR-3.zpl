set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.2306, <2> 29.3431, <3> 18.0855, <4> 31.0175, <5> 23.5737, <6> 29.6218, <7> 12.2756, <8> 21.0114, <9> 27.2988, <10> 24.3423;
param workload[JOB] := <1> 2.5662, <2> 18.2152, <3> 5.2091, <4> 38.4028, <5> 6.5739, <6> 42.8028, <7> 36.6975, <8> 49.8413, <9> 44.4668, <10> 37.3906;
param capacity[MACHINE] := <1> 282.1662, <2> 282.1662, <3> 282.1662;

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
