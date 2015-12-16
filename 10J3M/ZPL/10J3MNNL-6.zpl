set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.5459, <2> 18.0721, <3> 32.5675, <4> 23.9131, <5> 23.7048, <6> 28.1108, <7> 35.8519, <8> 26.6128, <9> 17.3387, <10> 22.5623;
param workload[JOB] := <1> 25.5459, <2> 18.0721, <3> 32.5675, <4> 23.9131, <5> 23.7048, <6> 28.1108, <7> 35.8519, <8> 26.6128, <9> 17.3387, <10> 22.5623;
param capacity[MACHINE] := <1> 254.2799, <2> 254.2799, <3> 254.2799;

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
