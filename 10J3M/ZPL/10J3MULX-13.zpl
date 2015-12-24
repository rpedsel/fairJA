set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.6036, <2> 1.8051, <3> 1.5182, <4> 28.7993, <5> 49.9698, <6> 47.6755, <7> 13.4806, <8> 49.1687, <9> 19.8032, <10> 32.4323;
param workload[JOB] := <1> 2.1456, <2> 1.3435, <3> 1.2322, <4> 5.3665, <5> 7.0689, <6> 6.9047, <7> 3.6716, <8> 7.012, <9> 4.4501, <10> 5.6949;
param capacity[MACHINE] := <1> 14.9633, <2> 14.9633, <3> 14.9633;

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
