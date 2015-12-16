set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 10.3541, <2> 13.7431, <3> 49.2771, <4> 24.3767, <5> 1.6203, <6> 39.2321, <7> 36.1225, <8> 10.6829, <9> 40.7234, <10> 3.5423;
param workload[JOB] := <1> 10.3541, <2> 13.7431, <3> 49.2771, <4> 24.3767, <5> 1.6203, <6> 39.2321, <7> 36.1225, <8> 10.6829, <9> 40.7234, <10> 3.5423;
param capacity[MACHINE] := <1> 229.6745, <2> 229.6745, <3> 229.6745;

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
