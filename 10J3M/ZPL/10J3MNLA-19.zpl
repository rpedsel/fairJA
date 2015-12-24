set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.4469, <2> 24.3343, <3> 19.9406, <4> 35.034, <5> 22.7904, <6> 28.9342, <7> 35.0939, <8> 27.0368, <9> 26.3652, <10> 28.9578;
param workload[JOB] := <1> 503.8633, <2> 592.1582, <3> 397.6275, <4> 1227.3812, <5> 519.4023, <6> 837.1879, <7> 1231.5818, <8> 730.9886, <9> 695.1238, <10> 838.5542;
param capacity[MACHINE] := <1> 2524.6229, <2> 2524.6229, <3> 2524.6229;

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
