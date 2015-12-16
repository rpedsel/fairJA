set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.0574, <2> 23.8932, <3> 21.4924, <4> 30.895, <5> 22.2206, <6> 28.3632, <7> 33.1884, <8> 25.6783, <9> 29.8529, <10> 18.9151;
param workload[JOB] := <1> 787.2177, <2> 570.885, <3> 461.9233, <4> 954.501, <5> 493.7551, <6> 804.4711, <7> 1101.4699, <8> 659.3751, <9> 891.1956, <10> 357.781;
param capacity[MACHINE] := <1> 7082.5748, <2> 7082.5748, <3> 7082.5748;

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
