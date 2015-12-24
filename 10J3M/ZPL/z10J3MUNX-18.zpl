set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.4095, <2> 9.6002, <3> 40.6071, <4> 30.027, <5> 45.9101, <6> 28.1962, <7> 17.072, <8> 27.8532, <9> 10.5513, <10> 1.2827;
param workload[JOB] := <1> 4.0509, <2> 3.0984, <3> 6.3724, <4> 5.4797, <5> 6.7757, <6> 5.31, <7> 4.1318, <8> 5.2776, <9> 3.2483, <10> 1.1326;
param capacity[MACHINE] := <1> 44.8774, <2> 44.8774, <3> 44.8774;

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
