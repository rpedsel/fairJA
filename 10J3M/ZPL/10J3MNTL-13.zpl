set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.3444, <2> 30.5009, <3> 24.5396, <4> 25.2231, <5> 24.4629, <6> 18.5198, <7> 16.2778, <8> 27.0124, <9> 22.173, <10> 25.0947;
param workload[JOB] := <1> 21.3444, <2> 30.5009, <3> 24.5396, <4> 25.2231, <5> 24.4629, <6> 18.5198, <7> 16.2778, <8> 27.0124, <9> 22.173, <10> 25.0947;
param capacity[MACHINE] := <1> 58.7872, <2> 58.7872, <3> 58.7872;

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
