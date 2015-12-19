set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.5633, <2> 25.946, <3> 15.6243, <4> 15.8078, <5> 22.0702, <6> 23.8604, <7> 24.0972, <8> 30.9996, <9> 32.9523, <10> 22.0906;
param workload[JOB] := <1> 705.6089, <2> 673.1949, <3> 244.1188, <4> 249.8865, <5> 487.0937, <6> 569.3187, <7> 580.675, <8> 960.9752, <9> 1085.8541, <10> 487.9946;
param capacity[MACHINE] := <1> 1511.1801, <2> 1511.1801, <3> 1511.1801;

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
