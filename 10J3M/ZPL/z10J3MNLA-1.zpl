set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3298, <2> 18.4872, <3> 17.9165, <4> 17.9504, <5> 20.4147, <6> 28.1289, <7> 31.5158, <8> 21.7325, <9> 27.1328, <10> 25.8201;
param workload[JOB] := <1> 746.918, <2> 341.7766, <3> 321.001, <4> 322.2169, <5> 416.76, <6> 791.235, <7> 993.2456, <8> 472.3016, <9> 736.1888, <10> 666.6776;
param capacity[MACHINE] := <1> 1936.107, <2> 1936.107, <3> 1936.107;

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
