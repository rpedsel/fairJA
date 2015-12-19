set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.367, <2> 22.1765, <3> 34.8822, <4> 43.6815, <5> 24.4556, <6> 13.1652, <7> 17.5235, <8> 40.4212, <9> 28.1072, <10> 31.7278;
param workload[JOB] := <1> 30.831, <2> 43.0398, <3> 5.9976, <4> 45.309, <5> 44.0101, <6> 43.3766, <7> 17.4434, <8> 44.8537, <9> 1.0507, <10> 1.6113;
param capacity[MACHINE] := <1> 277.5232, <2> 277.5232, <3> 277.5232;

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
