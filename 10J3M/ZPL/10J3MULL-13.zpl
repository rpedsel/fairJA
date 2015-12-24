set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 1.4126, <2> 8.275, <3> 43.2764, <4> 2.5367, <5> 27.2061, <6> 9.4972, <7> 49.2607, <8> 38.6059, <9> 41.1751, <10> 42.0499;
param workload[JOB] := <1> 1.4126, <2> 8.275, <3> 43.2764, <4> 2.5367, <5> 27.2061, <6> 9.4972, <7> 49.2607, <8> 38.6059, <9> 41.1751, <10> 42.0499;
param capacity[MACHINE] := <1> 87.7652, <2> 87.7652, <3> 87.7652;

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
