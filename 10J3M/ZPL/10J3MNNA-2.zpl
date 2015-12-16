set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.2346, <2> 27.7066, <3> 29.5976, <4> 30.7391, <5> 24.3135, <6> 16.8406, <7> 21.3427, <8> 18.7066, <9> 25.3714, <10> 24.8536;
param workload[JOB] := <1> 688.2542, <2> 767.6557, <3> 876.0179, <4> 944.8923, <5> 591.1463, <6> 283.6058, <7> 455.5108, <8> 349.9369, <9> 643.7079, <10> 617.7014;
param capacity[MACHINE] := <1> 6218.4292, <2> 6218.4292, <3> 6218.4292;

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
