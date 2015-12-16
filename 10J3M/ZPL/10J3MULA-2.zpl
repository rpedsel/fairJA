set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.8284, <2> 26.3536, <3> 22.1032, <4> 33.9897, <5> 29.8932, <6> 2.3421, <7> 28.7432, <8> 40.6522, <9> 35.9257, <10> 45.2149;
param workload[JOB] := <1> 2009.5854, <2> 694.5122, <3> 488.5515, <4> 1155.2997, <5> 893.6034, <6> 5.4854, <7> 826.1715, <8> 1652.6014, <9> 1290.6559, <10> 2044.3872;
param capacity[MACHINE] := <1> 3686.9512, <2> 3686.9512, <3> 3686.9512;

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
