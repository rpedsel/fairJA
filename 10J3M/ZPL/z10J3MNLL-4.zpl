set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.0514, <2> 25.7559, <3> 22.6829, <4> 25.1282, <5> 27.5352, <6> 27.2074, <7> 21.1927, <8> 27.3719, <9> 31.5405, <10> 33.6095;
param workload[JOB] := <1> 26.0514, <2> 25.7559, <3> 22.6829, <4> 25.1282, <5> 27.5352, <6> 27.2074, <7> 21.1927, <8> 27.3719, <9> 31.5405, <10> 33.6095;
param capacity[MACHINE] := <1> 89.3585, <2> 89.3585, <3> 89.3585;

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
