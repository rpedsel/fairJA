set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.5613, <2> 6.6154, <3> 6.3373, <4> 24.2209, <5> 12.5583, <6> 21.7388, <7> 40.2304, <8> 28.9982, <9> 31.0171, <10> 39.0044;
param workload[JOB] := <1> 4.0696, <2> 2.572, <3> 2.5174, <4> 4.9215, <5> 3.5438, <6> 4.6625, <7> 6.3427, <8> 5.385, <9> 5.5693, <10> 6.2454;
param capacity[MACHINE] := <1> 15.2764, <2> 15.2764, <3> 15.2764;

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
